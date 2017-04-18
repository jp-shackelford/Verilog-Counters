/****************************************************************************
	EE 371
	Joshua Smith
	Section AB
	
	Desctiption:
		DE1_SoC.v the top level module for this Johnson counter. It connects the
		logic and behavior of the general modules made for this counter to the
		actual pins and interfaces on the DE1_SoC board.
		
	Inputs:
		CLOCK_50: The DE1_SoC board's internal system clock, running at 50MHz
		KEY[0]: The button used for our active-low reset. Goes low when pressed
		
	Outputs:
		LEDR[3:0]: The bottom 4 LEDs that will display the current count of our
						Johnson counter.
	
Author: Joshua Shackelford

****************************************************************************/

module DE1_SoC (CLOCK_50, SW, KEY, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);

	input CLOCK_50;
	input [9:0] SW;
	input [3:0] KEY;
	
	output [9:0] LEDR;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	
	//By default, turn off all HEX displays
	assign HEX0 = 7'b1111111;
	assign HEX1 = 7'b1111111;
	assign HEX2 = 7'b1111111;
	assign HEX3 = 7'b1111111;
	assign HEX4 = 7'b1111111;
	assign HEX5 = 7'b1111111;
	
	//Establish a clock divider for a variable time-base
	reg [32:0] clk = 32'b0;
	always @(posedge CLOCK_50) clk <= clk + 1; 
	
	Johnson counter (clk[23], KEY[0], LEDR[3:0]);

endmodule 