`timescale 1ns/1ps
module tb_fifo;

    reg clk = 0;
    reg rst;
    reg wr_en;
    reg rd_en;
    reg [7:0] din;
    wire [7:0] dout;
    wire full, empty;

    // Instantiate FIFO
    fifo #(.WIDTH(8), .DEPTH(4)) uut (
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .din(din),
        .dout(dout),
        .full(full),
        .empty(empty)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Dump waveform
        $dumpfile("fifo.vcd");
        $dumpvars(0, tb_fifo);

        // Reset
        rst = 1; wr_en = 0; rd_en = 0; din = 0;
        #10 rst = 0;

        // Write 4 elements
        wr_en = 1;
        din = 8'hA1; #10
        din = 8'hB2; #10
        din = 8'hC3; #10
        din = 8'hD4; #10

        wr_en = 0; // stop writing

        // Read 2 elements
        rd_en = 1; #20

        rd_en = 0; #10

        // Write 1 element
        wr_en = 1; din = 8'hE5; #10
        wr_en = 0;

        // Read remaining
        rd_en = 1; #40
        rd_en = 0;

        $finish;
    end

endmodule
