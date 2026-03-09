module low_power_multiplier(
    input clk,
    input reset,
    input start,
    input [3:0] A,
    input [3:0] B,
    output reg [7:0] product,
    output reg done
);

reg [3:0] multiplicand;
reg [3:0] multiplier;
reg [2:0] count;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        multiplicand <= 0;
        multiplier <= 0;
        product <= 0;
        count <= 0;
        done <= 0;
    end

    else if(start)
    begin
        multiplicand <= A;
        multiplier <= B;
        product <= 0;
        count <= 0;
        done <= 0;
    end

    else if(count < 4)
    begin
        // Low power idea: add only if multiplier bit is 1
        if(multiplier[0] == 1)
            product <= product + (multiplicand << count);

        multiplier <= multiplier >> 1;
        count <= count + 1;
    end

    else
    begin
        done <= 1;
    end
