<div align="center">

<h1>🔑 Tron Premium Address Generation</h1>

<h3>TRON Vanity Address · High-Speed Generation · Precise Matching</h3>

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

Fully transparent and compliant, fully open to inspection and review! Recently, there has been malicious slander from peers and self-directed rumors. They simply cannot tolerate our project’s reasonable and standardized operation. The new version is now available for free with benefits, and we will consider the charging plan appropriately in the future, which will surely disappoint those malicious detractors. 🛡️ You can perform a full security check with 360 Anti-Virus and other mainstream antivirus software for verification. Some people just love making unreasonable malicious attacks out of spite.

## 🧩 Features

<div align="center">

| Module | Description |
|:------:|:------------|
| 🎨 **GUI Interface** | Visual interface, intuitive and simple operation |
| 🌐 **Internationalization** | Chinese/English bilingual, one-click switch |
| 🚀 **GPU Power** | GPU acceleration, speed exceeds 1 billion H/s |
| 🎯 **Precise Matching** | Prefix/suffix case-sensitive matching |
| 📋 **Batch Rules** | Single input or batch file import |
| 📊 **Real-time Monitoring** | Speed/time/results count real-time refresh |
| 💾 **One-click Export** | Address and private key quick export to text |

</div>

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
| **Target Address** | The wallet address you want to imitate, or select a rule file | Required |
| **Prefix Length** | Number of characters to match at the beginning (0-10) | 0 or 2 |
| **Suffix Length** | Number of characters to match at the end (0-10) | 6-8 |
| **Generate Count** | How many addresses to generate before auto-stop (0=unlimited) | 1 |
| **GPU Device** | Select the graphics card to use | Auto |
| **Output File** | Path to save results | Optional |

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
TGxxxxxxxxxxxxxxxxxxxxxxxxxxxxx666666
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

**Test Platform**: NVIDIA GeForce RTX 5090

**Throughput**: ≈ 1.02 billion H/s

| Matching Digits | Estimated Time |
|:---------------:|:--------------:|
| 6-digit suffix | Minutes |
| 7-digit suffix | Tens of minutes |
| 8-digit suffix | Hours |
| 10-digit suffix | Days |

---

## 🔒 Security

<details>
<summary>👉 Click to expand security details</summary>

- 🔒 **Zero Backdoors** — Can be verified with any antivirus software
- 🔒 **Zero Network** — Completely offline operation, no network requests
- 🔒 **Zero Upload** — Private keys stored locally only, never transmitted

**Address Verification**:
- Private key and address are one-to-one correspondence, fully matched
- No multi-signature mechanism required, saving on-chain fees
- Can be directly imported into any TRON wallet (TronLink, imToken, etc.)

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

</details>

---

## 📜 License

This project is open-sourced under the [MIT License](https://opensource.org/licenses/MIT).

<br/>

<div align="center">

**If this project helps you, please give it a ⭐ Star!**

</div>
