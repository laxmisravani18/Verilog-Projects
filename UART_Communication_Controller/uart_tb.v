module tb_uart;

reg clk=0;
reg reset;
reg start;
reg [7:0] data;
reg rx;

wire tx;

uart_controller uut(
.clk(clk),
.reset(reset),
.start(start),
.tx_data(data),
.rx(rx),
.tx(tx)
);

always #10 clk=~clk;

initial
begin
   $dumpfile("dump.vcd");
  $dumpvars(1);    

reset=1;
start=0;

#50 reset=0;

data=8'b10101010;
start=1;

#20 start=0;

#1000 $finish;

end

endmodule
