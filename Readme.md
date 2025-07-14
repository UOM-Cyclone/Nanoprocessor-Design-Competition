# 🧠 Nanoprocessor Design   
**CS1050 – Computer Organization and Digital Design**  
Department of Computer Science and Engineering, University of Moratuwa

## 📌 Overview
This repository contains the design files, simulation results, and documentation for a 4-bit nanoprocessor designed as part of Lab 9–10 in the CS1050 course. The nanoprocessor is a simple 4-bit processor capable of executing a limited instruction set with 4 operations. It was developed by a team of 5 students to practice hardware design, simulation, and integration using VHDL and related tools.

## 🎯 Learning Outcomes
Through this lab project, we were able to:
- Design and implement a 4-bit arithmetic unit for signed integer addition and subtraction.
- Build a functional 3-bit program counter with reset capability.
- Create k-way b-bit multiplexers and tri-state bus systems.
- Decode and execute simple instructions with a custom instruction decoder.
- Integrate and test the nanoprocessor components both via simulation and on a development board.
- Collaborate effectively as a team and manage modular hardware design tasks.

---

## 🔧 Nanoprocessor Architecture

### ✔ Components Developed:
- **4-bit Add/Subtract Unit**  
  - Supports signed arithmetic using 2’s complement  
  - Modified from Lab 3’s Ripple Carry Adder (RCA)

- **3-bit Adder for PC Increment**  
  - Adapted from 4-bit RCA  

- **3-bit Program Counter (PC)**  
  - Built with D Flip-Flops and asynchronous reset  

- **Multiplexers**
  - 2-way 3-bit MUX  
  - 2-way 4-bit MUX  
  - 8-way 4-bit MUX  

- **Register Bank**  
  - 8 registers (R0–R7), 4-bit each  
  - R0 hardcoded to 0 (read-only)  
  - Uses 3-to-8 decoder (Lab 4)  

- **Program ROM**  
  - Built by extending Lab 7’s ROM-based LUT  
  - Stores Assembly-like instructions  

- **Instruction Decoder**  
  - Decodes 12-bit instructions and activates required control signals  

- **Buses**  
  - 3-bit, 4-bit, and 12-bit buses for clean interconnection  
  - Example: `D(3 downto 0)`, `I(11 downto 0)`, `R(3 downto 0)`  



---

## 💻 Development Tools

- **VHDL**
- **Xilinx Vivado** (for simulation and synthesis)
- **FPGA Development Board** (Basys 3 )

---

## 👥 Team Members

- 👤 Devinda Dilshan
- 👤 Thumul Dasun
- 👤 Shanil Praveen
- 👤 Dinara De Silva


---

## 🚀 How to Run

1. Clone this repository  
   ```bash
   git clone https://github.com/UOM-Cyclone/Nanoprocessor-Design-Competition.git
   ```


