module fifo #(
    parameter WIDTH = 8,   // Bits per data
    parameter DEPTH = 4    // Number of elements
)(
    input clk,
    input rst,
    input wr_en,           // Write enable
    input rd_en,           // Read enable
    input [WIDTH-1:0] din, // Data input
    output reg [WIDTH-1:0] dout, // Data output
    output full,
    output empty
);

    reg [WIDTH-1:0] mem [0:DEPTH-1]; // FIFO memory
    reg [$clog2(DEPTH):0] wr_ptr = 0;
    reg [$clog2(DEPTH):0] rd_ptr = 0;
    reg [$clog2(DEPTH+1):0] count = 0; // Number of elements in FIFO

    // Write operation
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            wr_ptr <= 0;
            count <= 0;
        end else if (wr_en && !full) begin
            mem[wr_ptr] <= din;
            wr_ptr <= (wr_ptr + 1) % DEPTH;
            count <= count + 1;
        end
    end

    // Read operation
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            rd_ptr <= 0;
            dout <= 0;
        end else if (rd_en && !empty) begin
            dout <= mem[rd_ptr];
            rd_ptr <= (rd_ptr + 1) % DEPTH;
            count <= count - 1;
        end
    end

    // Status signals
    assign full  = (count == DEPTH);
    assign empty = (count == 0);

endmodule
