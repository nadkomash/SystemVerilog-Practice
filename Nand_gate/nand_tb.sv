`timescale 1ns/1ps
module nand_tb ;
    logic a,b ;
    logic y;

    nand_gate dut (
        .a(a),
        .b(b),
        .y(y)
    );

//This block tell icarus to save waveforms
    initial begin
        $dumpfile("nand_tb.vcd"); // name of the wave file
        $dumpvars(0, nand_tb);    // dump all variables in the nand_tb module
    end

    initial begin   
        $monitor ("At time %0t: a=%b, b=%b, y=%b", $time, a, b, y);
        // Test case 1: a=0, b=0
        a = 0; b = 0; #10;      
        // Test case 2: a=0, b=1
        a = 0; b = 1; #10;
        // Test case 3: a=1, b=0
        a = 1; b = 0; #10;
        // Test case 4: a=1, b=1
        a = 1; b = 1; #10;  


        $display("Test completed");
        $finish;
    end
endmodule