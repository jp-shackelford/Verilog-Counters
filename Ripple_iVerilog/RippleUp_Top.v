/***********************************************************************************************
	EE 371
	Joshua Smith
	Section AB

	Description:
		RippleUp_Top.v is the top level module for a basic 4-bit Asynchronous (or Ripple) Up Counter.
		The System has an acitve-low rst and will rst to 0 and count up to 15 and then roll over
		back to 0. The rst is also an asynchronous rst, and so can interupt the count at any time.

	Inputs:
		Clock: The internal System Clock. Typically 50MHz on the DE1-SoC boards
		rst: An active-low rst signal, supplied by a KEY on the DE1 board

	Outputs:
		outBus: The binary representation of the count that will be linked to LEDs on the DE1 board

	Contributors: Titus Berndt, Nesta Isakovic, and Joshua Shackelford

***********************************************************************************************/

//include additional modules for iVerilog
`include "DFlipFlop.v"

module RippleUp_Top(clk, rst, outBus);

	input clk, rst;
	output [3:0] outBus;
	
	//All internal wiring
	wire Q1Bar, Q2Bar, Q3Bar, Q4Bar;
	
	//The first DFF gets a signal from the clock, the rest toggle on the rising edge of the
	//qBar signal of the previous DFF
	DFlipFlop F1 (.q(outBus[0]), .qBar(Q1Bar), .D(Q1Bar), .clk(clk), .rst(rst));
	DFlipFlop F2 (.q(outBus[1]), .qBar(Q2Bar), .D(Q2Bar), .clk(Q1Bar), .rst(rst));
	DFlipFlop F3 (.q(outBus[2]), .qBar(Q3Bar), .D(Q3Bar), .clk(Q2Bar), .rst(rst));
	DFlipFlop F4 (.q(outBus[3]), .qBar(Q4Bar), .D(Q4Bar), .clk(Q3Bar), .rst(rst));
	
endmodule 