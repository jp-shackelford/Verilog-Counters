/***********************************************************************************************
	EE 371
	Joshua Smith
	Section AB

    Description:
        Johnson.v is a behavioral model implementation of a Johnson Ring counter. The Johnson
        counter is interesting in that it does not count straight from 0 to 15, but rather
        follows the following sequence: 0,1,3,7,15,14,12,8,0 and repeats.

    Inputs:
        clk: The clock signal, the rising edge of which triggers the DFFs within the counter
        rst: The reset signal, which is asynchronous from the clock

    Outputs:
        outBus: a 4-bit bus that carries the counting signal of this Ring counter

	Author: Joshua Shackelford

***********************************************************************************************/

`include "DFlipFlop.v"

module Johnson (clk, rst, outBus);

	input clk, rst;
	output [3:0] outBus;

	//Wires between DFFs
	wire [3:0] link;
	
	always @(posedge clk or negedge rst) begin
		if(rst == 0)
			link <= 4'b0000;
		else begin
			link[0] <= ~outBus[3];
			link[1] <= outBus[0];
			link[2] <= outBus[1];
			link[3] <= outBus[2];
		end
	end
	assign outBus = link;
endmodule
