# Day 6 – Traffic Light Controller (Verilog)

## Overview

This project implements a **Traffic Light Controller using Verilog HDL** based on a **Finite State Machine (FSM)**.

The controller supports:

* Normal traffic light operation
* Pedestrian crossing signal
* Emergency vehicle override
* Timer-based light switching
* 
## Features

* FSM based control
* Sequential logic design
* Pedestrian crossing support
* Emergency override (forces RED light)
* Timer controlled light transitions

## Inputs

* `clk` – Clock signal
* `reset` – Reset system
* `pedestrian_button` – Request pedestrian crossing
* `emergency` – Emergency vehicle sign

## Outputs

* `red` – Red light
* `yellow` – Yellow light
* `green` – Green light
* `pedestrian` – Pedestrian crossing signal

## FSM States

GREEN → YELLOW → RED → PEDESTRIAN → GREEN

Emergency signal forces the system into **RED state**.

## Files

tlc.v
tlc_tb.v
tlc_waveform.png
README.md

## Learning Concepts

* Finite State Machines (FSM)
* Sequential Logic
* Timer based control
* Digital system design

## Example Use Cases

* Smart traffic intersections
* Embedded control systems
* FPGA learning projects

 # FSM Diagram


          +-------+
        | GREEN |
        +-------+
            |
            v
        +--------+
        | YELLOW |
        +--------+
            |
            v
        +------+
        | RED  |
        +------+
         |   |
         |   | pedestrian
         |   v
         | +------+
         | | PED  |
         | +------+
         |    |
         +----+
              |
            GREEN
