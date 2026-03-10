`timescale 1ns/1ps

module tb_traffic_light;

reg clk;
reg reset;
reg pedestrian_button;
reg emergency;

wire red;
wire yellow;
wire green;
wire pedestrian;

traffic_light_controller uut(
    .clk(clk),
    .reset(reset),
    .pedestrian_button(pedestrian_button),
    .emergency(emergency),
    .red(red),
    .yellow(yellow),
    .green(green),
    .pedestrian(pedestrian)
);

always #5 clk = ~clk;

initial
begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    clk = 0;
    reset = 1;
    pedestrian_button = 0;
    emergency = 0;

    #10 reset = 0;

    // pedestrian request
    #40 pedestrian_button = 1;
    #10 pedestrian_button = 0;

    // emergency override
    #60 emergency = 1;
    #20 emergency = 0;

    #200 $finish;
end

initial
begin
    $monitor("Time=%0t Red=%b Yellow=%b Green=%b Ped=%b",
             $time, red, yellow, green, pedestrian);
end

endmodule
