`timescale 1ns/1ps

module tb_low_power_multiplier;

reg clk;
reg reset;
reg start;
reg [3:0] A;
reg [3:0] B;

wire [7:0] product;
wire done;

low_power_multiplier uut(
    .clk(clk),
    .reset(reset),
    .start(start),
    .A(A),
    .B(B),
    .product(product),
    .done(done)
);

always #5 clk = ~clk;

initial
begin
   
    $dumpfile("dump.vcd");
    $dumpvars(1); 
    clk = 0;
    reset = 1;
    start = 0;

    #10 reset = 0;

    // Test Case 1
    #10 A = 4'd3;
    B = 4'd5;
    start = 1;

    #10 start = 0;

    #100;

    // Test Case 2
    A = 4'd7;
    B = 4'd2;
    start = 1;

    #10 start = 0;

    #100;

    // Test Case 3
    A = 4'd9;
    B = 4'd3;
    start = 1;

    #10 start = 0;

    #200 $finish;
end

initial
begin
    $monitor("Time=%0t A=%d B=%d Product=%d Done=%b",
              $time, A, B, product, done);
end

endmodule
