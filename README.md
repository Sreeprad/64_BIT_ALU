# 64-Bit ALU Design (Verilog)

A modular, synthesizable 64-bit Arithmetic Logic Unit (ALU) implemented in Verilog HDL. This project demonstrates hierarchical digital design using parameterized modules, supporting arithmetic and logic operations with future extensibility for advanced verification environments.

---

## 📁 Directory Structure
├── DESIGN_MODULES/ │ ├── ALU_deisgn.v # Top-level 64-bit ALU module │ ├── RCA_design.v # 64-bit Ripple Carry Adder │ ├── FA_design.v # 1-bit Full Adder │ ├── MUX2_1_design.v # 2:1 Multiplexer │ ├── MUX4_1_design.v # 4:1 Multiplexer (using 2:1 MUXes) │ └── ALU_TB.v # Basic ALU testbench ├── README.md # Project overview and instructions └── LICENSE # Project license (MIT)

---

## 🏗️ Module Overview

- [`DESIGN_MODULES/ALU_deisgn.v`](DESIGN_MODULES/ALU_deisgn.v):  
  Top-level ALU supporting 64-bit addition, subtraction, AND, OR, XOR. Operation selection via `SEL0` and `SEL1`. Handles overflow detection.

- [`DESIGN_MODULES/RCA_design.v`](DESIGN_MODULES/RCA_design.v):  
  64-bit Ripple Carry Adder using a chain of full adders for sum and carry propagation.

- [`DESIGN_MODULES/FA_design.v`](DESIGN_MODULES/FA_design.v):  
  1-bit Full Adder module for single-bit sum and carry computation.

- [`DESIGN_MODULES/MUX2_1_design.v`](DESIGN_MODULES/MUX2_1_design.v):  
  2:1 Multiplexer, used for bit selection and as a building block for larger multiplexers.

- [`DESIGN_MODULES/MUX4_1_design.v`](DESIGN_MODULES/MUX4_1_design.v):  
  4:1 Multiplexer constructed from three 2:1 MUXes, used for ALU output selection.

- [`DESIGN_MODULES/ALU_TB.v`](DESIGN_MODULES/ALU_TB.v):  
  Simple testbench for functional simulation of the ALU module.

---

## 🚦 Supported Operations

| SEL1 | SEL0 | Operation      |
|------|------|---------------|
| 0    | 0    | ADD/SUB       |
| 0    | 1    | AND           |
| 1    | 0    | OR            |
| 1    | 1    | XOR           |

- `B_inv` input enables subtraction by inverting operand B and setting carry-in.

---

## 🧪 Verification & Future Plans

- Current testbench: [`DESIGN_MODULES/ALU_TB.v`](DESIGN_MODULES/ALU_TB.v) covers basic functional cases.
- **Planned additions:**  
  - Advanced testbenches: checker, buffer, environment, and coverage modules for robust verification.
  - Self-checking and constrained-random stimulus.
  - Scoreboarding and assertion-based verification.

---

## 🛠️ Usage

1. **Simulation:**  
   Use any Verilog simulator (Icarus, ModelSim, Vivado) to run the testbench:
   ```sh
   iverilog -g2012 DESIGN_MODULES/*.v -o alu_tb
   vvp alu_tb
   ```