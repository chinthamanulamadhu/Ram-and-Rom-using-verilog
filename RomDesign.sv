module rom (
    input [1:0] address,       // 2-bit address (for 4 locations)
    output reg [7:0] data_out  // 8-bit output data
);

    reg [7:0] memory [3:0];    // 4x8 ROM

    initial begin
        memory[0] = 8'b00000001;  // Preload ROM with fixed values
        memory[1] = 8'b00000010;
        memory[2] = 8'b00000100;
        memory[3] = 8'b00001000;
    end

    always @(*) begin
        data_out = memory[address];  // Read from ROM
    end
endmodule
