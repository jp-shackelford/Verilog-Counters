/***********************************************************************************************
	EE 371
	Joshua Smith
	Section AB

	Description:
		RippleUp_Top.v is the top level module for a basic 4-bit Asynchronous (or Ripple) Up Counter.
		The System has an acitve-low reset and will reset to 0 and count up to 15 and then roll over
		back to 0. The Reset is also an asynchronous reset, and so can interupt the count at any time.

	Inputs:
		Clock: The internal System Clock. Typically 50MHz on the DE1-SoC boards
		Reset: An active-low reset signal, supplied by a KEY on the DE1 board

	Outputs:
		outBus: The binary representation of the count that will be linked to LEDs on the DE1 board

	Author: Joshua Shackelford

***********************************************************************************************/

module RippleUp_Top(Clock, Reset, outBus);

	input Clock, Reset;
	output [3:0] outBus;
	
	//Set the time-base off the system Clock
	reg [31:0] clk = 32'b0;
	always@(posedge Clock) clk <= clk + 1'b1;
	
	//All internal wiring
	wire Q1Bar, Q2Bar, Q3Bar, Q4Bar;
	
	//The first DFF gets a signal from the clock, the rest toggle on the rising edge of the
	//qBar signal of the previous DFF
	DFlipFlop F1 (.q(outBus[0]), .qBar(Q1Bar), .D(Q1Bar), .clk(clk[23]), .rst(Reset));
	DFlipFlop F2 (.q(outBus[1]), .qBar(Q2Bar), .D(Q2Bar), .clk(Q1Bar), .rst(Reset));
	DFlipFlop F3 (.q(outBus[2]), .qBar(Q3Bar), .D(Q3Bar), .clk(Q2Bar), .rst(Reset));
	DFlipFlop F4 (.q(outBus[3]), .qBar(Q4Bar), .D(Q4Bar), .clk(Q3Bar), .rst(Reset));
	
endmodule 