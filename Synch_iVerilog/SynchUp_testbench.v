/***********************************************************************************************
	EE 371
	Joshua Smith
	Section AB

    Description:
        SynchUp_testbench.v is the tester module for the synchronous up counter made by
        SynchUp.v.

    Inputs:
        None

    Outputs:
        None

	Author: Joshua Shackelford

***********************************************************************************************/

`include "SynchUp.v"

module SynchUp_testbench();

    reg clk, rst;
    wire [3:0] outBus;
    parameter CLOCK_PERIOD = 10;

    //Set clock cycle
    initial clk <= 0;
    always #(CLOCK_PERIOD/2) clk <= ~clk;

    SynchUp dut (clk, rst, outBus);

    //Set files for GTKWave
    initial begin
        $dumpfile("SynchUp.vcd");
        $dumpvars(1, dut);
    end

    //Let the counter run
    initial begin
        rst <= 0;       #10;
        rst <= 1;       #10;
        repeat(50)      #10;
        rst <= 0;       #10;
        rst <= 1;       #10;
        repeat(25)      #10;
        $finish();
    end

endmodule