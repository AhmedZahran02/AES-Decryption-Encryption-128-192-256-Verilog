# **AES Encryption & Decryption (128/192/256-bit) in Verilog**  

## **Project Overview**  
This project implements the **Advanced Encryption Standard (AES)** algorithm for **128, 192, and 256-bit** key encryption and decryption in **Verilog**. It efficiently handles key expansion, encryption, and decryption with optimized hardware design for memory and upload time. The implementation is designed for deployment on **FPGA** systems, offering robust performance and reliability.

---

## **Key Features**  
- **AES Encryption & Decryption:**  
  - Supports key sizes of 128, 192, and 256 bits.  
- **Memory-Efficient Design:**  
  - Optimized for minimal memory usage.  
- **High Performance:**  
  - Fast upload and execution time on FPGA.  
- **Modular Architecture:**  
  - Clear separation of core AES operations for easier maintenance and testing.

---

## **Implemented Components**  
- **Key Expansion:**  
  - Efficient generation of round keys for AES operations.
  
- **AES Core Operations:**  
  - **Mix Columns:** Transformation for diffusion.  
  - **Add Round Key:** XOR operation with round keys.  
  - **Shift Rows:** Byte shifting for row permutation.  
  - **SubBytes:** Byte substitution using the AES S-Box.  
  - **RotWord & SubWord:** Used in key expansion.  

- **Inverse AES Operations:**  
  - **Inv Mix Columns:** Reverse transformation for decryption.  
  - **Inverse SubBytes:** Reverse S-Box operation for decryption.  

---

## **Directory Structure**  
```
AES-Decryption-Encryption/
├── keyExpansion256.v    # Key expansion module
├── AddRoundKey.v        
├── MixColumns.v         # Mix columns transformation
├── InvMixColumns.v      # Inverse mix columns transformation
├── Shift_Rows.v         # Shift rows operation
├── rotword.v            # rotate words operation
├── subBytes.v           # SubBytes operation
```

---

## **Getting Started**  

### **Prerequisites**  
- **Verilog Simulation Tool** (ModelSim, Xilinx Vivado, or Quartus Prime)  
- **FPGA Development Board**  

### **Simulation & Synthesis**  

1. **Clone the Repository:**  
   ```bash
   git clone https://github.com/AhmedZahran02/AES-Decryption-Encryption-128-192-256-Verilog.git
   cd AES-Decryption-Encryption-128-192-256-Verilog
   ```

2. **Compile and Simulate:**  
   Run the testbenches using your preferred Verilog simulation tool.

3. **Synthesize for FPGA:**  
   Upload the synthesized design to an FPGA board for real-time AES operations.

---

## **Performance Highlights**
- **Efficient Memory Usage:** Optimized design ensures minimal resource consumption.  
- **Fast Upload Time:** Streamlined design for quick deployment on FPGA hardware.  
- **Scalability:** Easily adaptable to different key sizes (128, 192, 256 bits).

---

## **Applications**
- Secure communication systems.  
- Cryptographic research and education.  
- Embedded system security applications.  

---

## **Contributions**
Contributions are welcome! Feel free to submit pull requests or raise issues for improvements.

---

## **License**
This project is licensed under the [MIT License](LICENSE). 
