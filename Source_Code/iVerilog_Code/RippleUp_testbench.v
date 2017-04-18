/***********************************************************************************************
	EE 371
	Joshua Smith
	Section AB

	Description:
		RippleUp_testbench.v is the tester module for RippleUp_Top. It is writen to be compiled
		by iVerilog and simulated in GTKWave.

	Inputs:
		None

	Outputs:
		None

	Contributors: Titus Berndt, Nesta Isakovic, and Joshua Shackelford

***********************************************************************************************/

//include additional modules for iVerilog
`include "RippleUp_Top.v"

module RippleUp_testbench();

	reg Clock, Reset;
	wire [3:0] outBus;
	parameter CLOCK_PERIOD = 10;
		
	//Set Clock	
	initial
	begin
		Clock <= 0;
		forever #(CLOCK_PERIOD/2) Clock <= ~Clock;
	end

   	RippleUp_Top dut (Clock, Reset, outBus);

	//Set files for GTKWave
    initial
    begin
        $dumpfile("RippleUp.vcd");
        $dumpvars(1, dut);
    end
	
	//Let the counter run
	initial
	begin
		Reset <= 0;	#10;
		Reset <= 1;	#10;
		repeat(50)	#10;
		Reset <= 0;	#10;
		Reset <= 1;	#10;
		repeat(25)	#10;
		$finish;
	end
	

endmodule