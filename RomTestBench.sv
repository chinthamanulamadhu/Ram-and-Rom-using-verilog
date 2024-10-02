module tb_rom;

    reg [3:0] addr;
    wire [7:0] dout;

    // Instantiate ROM
    rom uut (
        .addr(addr),
        .dout(dout)
    );

    initial begin
        // Dump VCD file for waveform analysis
        $dumpfile("rom_wave.vcd");   // VCD filename
        $dumpvars(0, tb_rom);        // Dump all variables

        // Read data from ROM at various addresses
        addr = 4'b0000; #10;
        addr = 4'b0001; #10;
        addr = 4'b0010; #10;
        addr = 4'b0011; #10;
        addr = 4'b0100; #10;
        addr = 4'b0101; #10;
        addr = 4'b0110; #10;
        addr = 4'b0111; #10;

        #10 $finish;    // End the simulation
    end

endmodule
