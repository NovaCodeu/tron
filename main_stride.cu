#include <cuda_runtime.h>
#include <stdint.h>

// ─── Result Buffer Structure ────────────────────
struct Result {
    bool     found;
    char     address[35];   // Base58 address (34 + '\0')
    char     privateKey[65]; // Hex private key (64 + '\0')
};

// ─── Atomic Result Write ────────────────────────
__device__ int g_resultCount = 0;

__device__ void save_result(Result* results, const uint8_t* privKey) {
    int slot = atomicAdd(&g_resultCount, 1);
    if (slot >= 64) return; // Overflow guard, max 64 entries

    results[slot].found = true;

    // Convert private key bytes to hex string
    const char hex[] = "0123456789abcdef";
    #pragma unroll
    for (int i = 0; i < 32; i++) {
        results[slot].privateKey[i * 2]     = hex[privKey[i] >> 4];
        results[slot].privateKey[i * 2 + 1] = hex[privKey[i] & 0x0F];
    }
    results[slot].privateKey[64] = '\0';
}

// ─── Stride Computation Kernel ───────────────────
__global__ void StrideKernel(Result* results, uint8_t* baseSeed, int strideSize) {
    uint32_t tid = blockIdx.x * blockDim.x + threadIdx.x;
    Point p;
    GPU_InitPoint(&p, baseSeed, tid);

    for (int i = 0; i < strideSize; i++) {
        // 1. Point addition (P = P + G) - stride logic
        secp256k1_add_g(&p);

        // 2. Compute hash (Keccak)
        uint8_t hash[32];
        Keccak256_sm89(hash, p.x, p.y);

        // 3. T58 fast filter (check if first byte matches T)
        if (hash[12] == 0x41) { // TRON address prefix probe
            if (T58_Probe(hash, results)) {
                // Vanity address found, save to result buffer
                save_result(results, p.privateKey);
            }
        }

        // Warp-level sync every 256 steps for shared memory consistency
        if ((i & 0xFF) == 0) {
            __syncwarp();
        }
    }
}
