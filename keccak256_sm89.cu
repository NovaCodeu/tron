// LOP3.LUT instruction optimized for Ada Lovelace
// Logic: (a & b) ^ c -> LUT mask 0xCA
__device__ __forceinline__ uint64_t LOP3_CHI(uint64_t a, uint64_t b, uint64_t c) {
    uint32_t low_a = (uint32_t)a, low_b = (uint32_t)b, low_c = (uint32_t)c;
    uint32_t high_a = a >> 32, high_b = b >> 32, high_c = c >> 32;
    uint32_t res_l, res_h;

    asm("lop3.b32 %0, %1, %2, %3, 0xCA;" : "=r"(res_l) : "r"(low_a), "r"(low_b), "r"(low_c));
    asm("lop3.b32 %0, %1, %2, %3, 0xCA;" : "=r"(res_h) : "r"(high_a), "r"(high_b), "r"(high_c));

    return ((uint64_t)res_h << 32) | res_l;
}

// ─── Keccak-256 Round Constants ─────────────────
__device__ __constant__ uint64_t RC[24] = {
    0x0000000000000001ULL, 0x0000000000008082ULL, 0x800000000000808AULL,
    0x8000000080008000ULL, 0x000000000000808BULL, 0x0000000080000001ULL,
    0x8000000080008081ULL, 0x8000000000008009ULL, 0x000000000000008AULL,
    0x0000000000000088ULL, 0x0000000080008009ULL, 0x000000008000000AULL,
    0x000000008000808BULL, 0x800000000000008BULL, 0x8000000000008089ULL,
    0x8000000000008003ULL, 0x8000000000008002ULL, 0x8000000000000080ULL,
    0x000000000000800AULL, 0x800000008000000AULL, 0x8000000080008081ULL,
    0x8000000000008080ULL, 0x0000000080000001ULL, 0x8000000080008008ULL
};

// ─── Rotation Offsets ──────────────────────────
__device__ __constant__ int ROTC[24] = {
     1,  3,  6, 10, 15, 21, 28, 36, 45, 55,
     2, 14, 27, 41, 56,  8, 25, 43, 62, 18,
    39, 61, 20, 44
};

// ─── Pi Permutation Indices ─────────────────────
__device__ __constant__ int PILN[24] = {
    10,  7, 11, 17, 18,  3,  5, 16,  8, 21,
    24,  4, 15, 23, 19, 13, 12,  2, 20, 14,
    22,  9,  6,  1
};

// ─── 64-bit Rotation ───────────────────────────
__device__ __forceinline__ uint64_t ROTL64(uint64_t x, int n) {
    return (x << n) | (x >> (64 - n));
}

// ─── Keccak-f[1600] Single Round (LOP3 accelerated chi step) ─
__device__ void keccak_round(uint64_t st[25], int round) {
    uint64_t bc[5];

    // Theta
    #pragma unroll
    for (int i = 0; i < 5; i++)
        bc[i] = st[i] ^ st[i + 5] ^ st[i + 10] ^ st[i + 15] ^ st[i + 20];

    #pragma unroll
    for (int i = 0; i < 5; i++) {
        uint64_t t = bc[(i + 4) % 5] ^ ROTL64(bc[(i + 1) % 5], 1);
        #pragma unroll
        for (int j = 0; j < 25; j += 5) st[j + i] ^= t;
    }

    // Rho + Pi
    uint64_t tmp = st[1];
    #pragma unroll
    for (int i = 0; i < 24; i++) {
        int j = PILN[i];
        uint64_t t2 = st[j];
        st[j] = ROTL64(tmp, ROTC[i]);
        tmp = t2;
    }

    // Chi (accelerated with LOP3.LUT)
    #pragma unroll
    for (int j = 0; j < 25; j += 5) {
        uint64_t t0 = st[j], t1 = st[j+1], t2 = st[j+2], t3 = st[j+3], t4 = st[j+4];
        st[j]   = t0 ^ LOP3_CHI(~t1, t2, t0);
        st[j+1] = t1 ^ LOP3_CHI(~t2, t3, t1);
        st[j+2] = t2 ^ LOP3_CHI(~t3, t4, t2);
        st[j+3] = t3 ^ LOP3_CHI(~t4, t0, t3);
        st[j+4] = t4 ^ LOP3_CHI(~t0, t1, t4);
    }

    // Iota
    st[0] ^= RC[round];
}

// ─── Keccak-256 Main Hash (64-byte input -> 32-byte output) ─
__device__ void Keccak256_sm89(uint8_t* hash, const uint8_t* pubX, const uint8_t* pubY) {
    uint64_t st[25];
    #pragma unroll
    for (int i = 0; i < 25; i++) st[i] = 0;

    // Absorb phase: load 64-byte public key (X||Y) into state
    const uint64_t* px = (const uint64_t*)pubX;
    const uint64_t* py = (const uint64_t*)pubY;
    #pragma unroll
    for (int i = 0; i < 4; i++) st[i] ^= px[i];
    #pragma unroll
    for (int i = 0; i < 4; i++) st[i + 4] ^= py[i];

    // Padding (Keccak padding: 0x01 start, 0x80 end)
    st[8] ^= 0x01ULL;
    st[16] ^= 0x8000000000000000ULL; // rate = 136 bytes = 17 uint64s

    // 24 rounds of Keccak-f[1600]
    #pragma unroll
    for (int r = 0; r < 24; r++) {
        keccak_round(st, r);
    }

    // Squeeze phase: extract first 32 bytes
    const uint8_t* stBytes = (const uint8_t*)st;
    #pragma unroll
    for (int i = 0; i < 32; i++) hash[i] = stBytes[i];
}
