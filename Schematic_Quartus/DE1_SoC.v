/****************************************************************************
	EE 371
	Joshua Smith
	Section AB
	
Desctiption:
	DE1_SoC.v is the top level module connecting our schematic entry to the board.
	
Inputs:
	CLOCK_50: The DE1_SoC board's internal system clock, running at 50MHz
	SW: The 10 switches that the DE1_SoC board has
	KEY: The 4 buttons that the DE1_SoC board has
	
	KEY[0]: We use this button for our active-low reset
	
Outputs:
	LEDR: The 10 LEDs that the DE1_SoC board has
	HEX0-HEX5: The six 7-segment displays that the DE1_SoC board has
	
	LEDR[3:0]: The count will be displayed on the bottom 4 LEDs
	
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
	
	//Set up our clock-divider
	reg [32:0] clk = 32'b0;
	always @(posedge CLOCK_50) clk <= clk + 1; 
		
	Schematic_SynchUp counter (.clk(clk[23]), .rst(KEY[0]), .TRUE(1), .inBus(LEDR[3:0]), .outBus(LEDR[3:0]));
	
	

endmodule 