module traffic_light_controller(
    input clk,
    input reset,
    input pedestrian_button,
    input emergency,

    output reg red,
    output reg yellow,
    output reg green,
    output reg pedestrian
);

// FSM States
parameter GREEN = 2'b00;
parameter YELLOW = 2'b01;
parameter RED = 2'b10;
parameter PED = 2'b11;

reg [1:0] state;
reg [3:0] timer;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        state <= GREEN;
        timer <= 0;
    end

    else if(emergency)
    begin
        state <= RED;
        timer <= 0;
    end

    else
    begin
        timer <= timer + 1;

        case(state)

        GREEN:
        begin
            if(timer == 5)
            begin
                state <= YELLOW;
                timer <= 0;
            end
        end

        YELLOW:
        begin
            if(timer == 2)
            begin
                state <= RED;
                timer <= 0;
            end
        end

        RED:
        begin
            if(pedestrian_button)
            begin
                state <= PED;
                timer <= 0;
            end
            else if(timer == 5)
            begin
                state <= GREEN;
                timer <= 0;
            end
        end

        PED:
        begin
            if(timer == 4)
            begin
                state <= GREEN;
                timer <= 0;
            end
        end

        endcase
    end
end

// Output Logic
always @(*)
begin
    red = 0;
    yellow = 0;
    green = 0;
    pedestrian = 0;

    case(state)

    GREEN: green = 1;

    YELLOW: yellow = 1;

    RED: red = 1;

    PED:
    begin
        red = 1;
        pedestrian = 1;
    end

    endcase
end

endmodule
