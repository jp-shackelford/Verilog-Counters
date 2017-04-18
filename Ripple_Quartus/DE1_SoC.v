/****************************************************************************
	EE 371
	Joshua Smith
	Section AB
	
	Desctiption:
		DE1_SoC.v is the top level module for the Ripple Up Counter. Connecting all
		the appropriate GPIO pins to the inputs and outputs of the counter
		
	Inputs:
		CLOCK_50: The DE1_SoC board's internal system clock, running at 50MHz
		SW: The 10 switches that the DE1_SoC board has
		KEY: The 4 buttons that the DE1_SoC board has
		
		KEY[0]: Used for our active-low reset. Goes low when pressed.
		
	Outputs:
		LEDR: The 10 LEDs that the DE1_SoC board has
		HEX0-HEX5: The six 7-segment displays that the DE1_SoC board has
		
		LEDR[3:0] : The 4 lowest order LEDs that will display the count
	
	Author: Joshua Shackelford

****************************************************************************/

module DE1_SoC (CLOCK_50, SW, KEY, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);

	input CLOCK_50;
	input [9:0] SW;
	input [3:0] KEY;
	
	output [9:0] LEDR;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	
	//By default, turn off all the HEX displays
	assign HEX0 = 7'b1111111;
	assign HEX1 = 7'b1111111;
	assign HEX2 = 7'b1111111;
	assign HEX3 = 7'b1111111;
	assign HEX4 = 7'b1111111;
	assign HEX5 = 7'b1111111;
	
	//Set up clock divider
	reg [32:0] clk = 32'b0;
	always @(posedge CLOCK_50) clk <= clk + 1; 
	
	//Define Modules and Logic
	
	RippleUp counter (.clk(clk[23]), .rst(KEY[0]), .outBus(LEDR[3:0]));

endmodule 