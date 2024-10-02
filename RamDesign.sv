// Code your design here
module ram (
    input [1:0] address,      // 2-bit address (for 4 locations)
    input [7:0] data_in,      // 8-bit input data
    input write_enable,       // Write enable signal
    input clk,                // Clock signal
    output reg [7:0] data_out // 8-bit output data
);

    reg [7:0] memory [3:0];   // 4x8 memory array

    always @(posedge clk) begin
        if (write_enable) begin
            memory[address] <= data_in;  // Write to memory
        end else begin
            data_out <= memory[address];  // Read from memory
        end
    end
endmodule
