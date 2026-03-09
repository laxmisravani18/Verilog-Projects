# Low Power Multiplier (Verilog)

## Overview

This project implements a **4-bit Low Power Multiplier** using **Verilog HDL**.
The design multiplies two 4-bit numbers and produces an 8-bit product.

The multiplier uses a **shift-and-add method** and performs addition **only when the multiplier bit is 1**, which helps reduce unnecessary switching activity and lowers power consumption.

## Files in this Project

* `low_power_multiplier.v` → Verilog design code
* `tb_low_power_multiplier.v` → Testbench for simulation
* `README.md` → Project documentation
* `waveform.png → outform waveform

## Inputs and Outputs

**Inputs**

* `clk` – Clock signal
* `reset` – Reset signal
* `start` – Start multiplication
* `A[3:0]` – Multiplicand
* `B[3:0]` – Multiplier

**Outputs**

* `product[7:0]` – Multiplication result
* `done` – Indicates operation completion

## How it Works

1. Inputs `A` and `B` are loaded when `start` is enabled.
2. The multiplier checks each bit of `B`.
3. If the bit is `1`, the shifted value of `A` is added to the product.
4. If the bit is `0`, the addition is skipped.
5. After 4 cycles, the multiplication finishes and `done` becomes `1`.
## Example
A = 3
B = 5

Output:
Product = 15

## Simulation

You can simulate this design using tools like:

* ModelSim
* Vivado Simulator
* Icarus Verilog
* EDA Playground

Steps:

1. Compile the design file.
2. Compile the testbench.
3. Run the simulation.
4. Check the output or waveform.
5. 
## Applications

* Digital Signal Processing
* Embedded systems
* Low-power hardware design
* FPGA learning projects

## Author

G Laxmi Sravani
