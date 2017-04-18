/***********************************************************************************************
	EE 371
	Joshua Smith
	Section AB

Description:
	SynchUp.v is a module implementing a synchronous up counter with the Data-Flow
	style of verilog. It performs a count up from 0 to 15.

Inputs:
	clk: The clock signal, the rising edge of which triggers the DFF
	rst: The reset signal, which is asynchronous from the clock

Outputs:
	outBus: The output of the counter. A 4-bit bus that increments from 0 to 15

Author: Joshua Shackelford

***********************************************************************************************/

module SynchUp (clk, rst, outBus);
	
	input clk, rst;
	output [3:0] outBus;
	
	wire bit0, bit1, bit2, bit3;
	wire temp1, temp2;
	
	assign bit0 = ~outBus[0];
	
	assign bit1 = outBus[1] ^ outBus[0];
	
	assign temp1 = outBus[1] & outBus[0];
	assign bit2 = outBus[2] ^ temp1;
	
	assign temp2 = outBus[2] & outBus[1] & outBus[0];
	assign bit3 = outBus[3] ^ temp2;
	
	DFlipFlop F0 (.q(outBus[0]), .D(bit0), .clk(clk), .rst(rst));
	DFlipFlop F1 (.q(outBus[1]), .D(bit1), .clk(clk), .rst(rst));
	DFlipFlop F2 (.q(outBus[2]), .D(bit2), .clk(clk), .rst(rst));
	DFlipFlop F3 (.q(outBus[3]), .D(bit3), .clk(clk), .rst(rst));
	
endmodule 