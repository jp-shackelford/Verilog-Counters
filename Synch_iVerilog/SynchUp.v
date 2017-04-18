/***********************************************************************************************
	EE 371
	Joshua Smith
	Section AB

	Description:
		SynchUp.v creates a synchronous up counter with active-low reset. The Verilog is writen
		in a dataflow style, explicitly defining each bit of logic and how it connects.

	Inputs:
		clk: The clock signal, the rising edge of which triggers the DFFs in the counter
		rst: The reset signal, which is asynchronous from the clock

	Outputs:
		outBus: a 4-bit output that is driven by the counter. Counts from 0 to 15 then resets.

	Author: Joshua Shackelford

***********************************************************************************************/

`include "DFlipFlop.v"

module SynchUp (clk, rst, outBus);
	
	input clk, rst;
	output [3:0] outBus;
	
	//Internal connecting wires
	wire bit0, bit1, bit2, bit3;
	wire temp1, temp2;
	
	/*
		The output of a synchronous up counter is determined by the following logic:
			Bit 0 is the inverse of the bottom output bit
			Every bit above that is the XOR of the current bit with the AND of all bits below it.
	*/

	assign bit0 = ~outBus[0];
	
	assign bit1 = outBus[1] ^ outBus[0];
	
	assign temp1 = outBus[1] & outBus[0];
	assign bit2 = outBus[2] ^ temp1;
	
	assign temp2 = outBus[2] & outBus[1] & outBus[0];
	assign bit3 = outBus[3] ^ temp2;
	
	//Set the DFFs (could use a generate if I had defined the bitXs as a bus)
	DFlipFlop F0 (.q(outBus[0]), .D(bit0), .clk(clk), .rst(rst));
	DFlipFlop F1 (.q(outBus[1]), .D(bit1), .clk(clk), .rst(rst));
	DFlipFlop F2 (.q(outBus[2]), .D(bit2), .clk(clk), .rst(rst));
	DFlipFlop F3 (.q(outBus[3]), .D(bit3), .clk(clk), .rst(rst));
	
endmodule 