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

    //Set the behavior system regarding the outBus
    assign link[0] = ~outBus[3];
    assign link[1] = outBus[0];
    assign link[2] = outBus[1];
    assign link[3] = outBus[2];

    //Set all the appropriate DFlipFlops using a generate statement
    genvar i;
    generate
        for(i = 0; i < 4; i = i+1) begin : eachDFF
            DFlipFlop otherDFF (.q(outBus[i]), .D(link[i]), .clk(clk), .rst(rst));
        end
    endgenerate

endmodule