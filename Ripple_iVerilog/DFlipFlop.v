/***********************************************************************************************
	EE 371
	Joshua Smith
	Section AB

	Description:
		DFlipFlop.v is a simple D Flip Flop with asynchronous reset.

	Inputs:
		D: The input of the DFF
		clk: The clock signal, the rising edge of which triggers the DFF
		rst: The reset signal, which is asynchronous from the clock

	Outputs:
		q: The output of the DFF, which takes the value of D upon every clock edge
		qBar: the inverse of the q signal

	Author: Joshua Shackelford

***********************************************************************************************/

module DFlipFlop (q, qBar, D, clk, rst);
	input clk, rst, D;
	output q, qBar;
	
	reg q;
	not n1 (qBar, q);
	
	always @(negedge rst or posedge clk) //negedge for rst as it is active-low reset
	begin
		if(!rst)
			q = 0;
		else
			q = D;
	end

endmodule 