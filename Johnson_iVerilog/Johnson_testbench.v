/***********************************************************************************************
	EE 371
	Joshua Smith
	Section AB

    Description:
        Johnson_testbench.v is the tester module for the Johnson counter. Simply setting the
        right inputs and outputs and then toggling the reset and allowing the counter to go
        for several cycles before toggling the reset again.

    Inputs:
        None

    Outputs:
        None
        
	Author: Joshua Shackelford
	
***********************************************************************************************/


`include "Johnson.v"

module Johnson_testbench();

    reg clk, rst;
    wire [3:0] outBus;
    parameter CLOCK_PERIOD = 10;

    initial clk <= 1'b0;
    always #(CLOCK_PERIOD/2) clk <= ~clk;

    Johnson dut (clk, rst, outBus);

    initial begin
        $dumpfile("John.vcd");
        $dumpvars(1, dut);
    end

    initial begin
        rst <= 0;       #10;
        rst <= 1;       #10;
        repeat(50)      #10;
        rst <= 0;       #10;
        rst <= 1;       #10;
        repeat(17)      #10;
        $finish();
    end

endmodule