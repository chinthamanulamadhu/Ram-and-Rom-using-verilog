// Code your testbench here
// or browse Examples
module tb_ram;

    reg [1:0] address;
    reg [7:0] data_in;
    reg write_enable;
    reg clk;
    wire [7:0] data_out;
    
    ram my_ram (
        .address(address),
        .data_in(data_in),
        .write_enable(write_enable),
        .clk(clk),
        .data_out(data_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    // VCD file generation
    initial begin
        $dumpfile("ram_waveform.vcd");  // VCD file name
        $dumpvars(0, tb_ram);           // Dump all variables of tb_ram
    end

    initial begin
        // Initialize signals
        clk = 0;
        write_enable = 0;
        address = 2'b00;
        data_in = 8'b00000000;
        
        // Test Case 1: Write data to address 00
        #10 write_enable = 1;  // Enable write
        address = 2'b00;
        data_in = 8'b10101010;
        #10;
        
        // Test Case 2: Write data to address 01
        address = 2'b01;
        data_in = 8'b11110000;
        #10;

        // Test Case 3: Read from address 00
        write_enable = 0;  // Disable write (read mode)
        address = 2'b00;
        #10;
        $display("Data at address 00: %b", data_out);

        // Test Case 4: Read from address 01
        address = 2'b01;
        #10;
        $display("Data at address 01: %b", data_out);

        // End simulation
        $finish;
    end
endmodule
