// Code your testbench here
// or browse Examples
module alu_tb;

reg [3:0] a;
reg [3:0] b;
reg [2:0] op;

wire [3:0] result;

alu dut(
.a(a),
.b(b),
.op(op),
.result(result)
);

initial
begin
     
    $dumpfile("dump.vcd");
    $dumpvars(1); 

a = 4'b0101; 
b = 4'b0011;

op = 3'b000; #10; // add
op = 3'b001; #10; // sub
op = 3'b010; #10; // and
op = 3'b011; #10; // or
op = 3'b100; #10; // xor
op = 3'b101; #10; // shift left
op = 3'b110; #10; // shift right
op = 3'b111; #10; // not

$finish;

end

endmodule
