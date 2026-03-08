# FIFO Verilog Module

## Module: fifo.v
A **parameterized synchronous FIFO** that stores `DEPTH` number of `WIDTH`-bit elements.

### Ports
- `clk` (input) – Clock signal  
- `rst` (input) – Asynchronous reset  
- `wr_en` (input) – Write enable  
- `rd_en` (input) – Read enable  
- `din` (input [WIDTH-1:0]) – Data input  
- `dout` (output [WIDTH-1:0]) – Data output  
- `full` (output) – FIFO full indicator  
- `empty` (output) – FIFO empty indicator  

### Behavior
- Writes data on `wr_en` if FIFO is not full  
- Reads data on `rd_en` if FIFO is not empty  
- `full` and `empty` flags indicate status  
- Circular buffer with resettable pointers  

## Testbench: tb_fifo.v
- Simulates write/read operations  
- Tests full and empty conditions  
- Generates waveform

## Author
Laxmi Sravani G
