/***********************************************************************************************
	EE 371
	Joshua Smith
	Section AB

	Description:
		RippleUp.v is a Asynchronous counter set up in a structural model. As can me seen, each wire is
		defined and each DFF is explicitly called.

	Inputs:
		clk: input clock that will interact with the first tear DFF
		rst: active-low reset that will set all DFFs to zero

	Outputs:
		outBus: The binary representation of the count that will be linked to LEDs on the DE1 board

	Author: Joshua Shackelford

***********************************************************************************************/

module RippleUp(clk, rst, outBus);

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