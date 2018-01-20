//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:30:38 03/19/2013 
// Design Name: 
// Module Name:    LifeGame
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top_matrix(
		input wire  dclk, //input clock: 12MHz
		input wire  clr, //asynchronous reset
		output wire hsync, //horizontal sync out
		output wire vsync, //vertical sync out
		output wire red, //red vga output
		output wire green, //green vga output
		output wire blue //blue vga output 	       
		);   
   
   wire [2:0] 	       rgb_game;
   wire [2:0] 	       rgb_VGA;
   assign rgb_VGA = rgb_game;
   wire [9:0] 	       X_format, X_vga;
   wire [9:0] 	       Y_format, Y_vga;
   assign X_format = X_vga;
   assign Y_format = Y_vga;
   /**/
   vga vga1(
	    .dclk(dclk),
	    .RGB(rgb_VGA),
	    .hsync(hsync),
	    .vsync(vsync),
	    .red_vga(red),
	    .green_vga(green),
	    .blue_vga(blue),
	    .X(X_vga),
	    .Y(Y_vga)
	    );
   
   matrix matrix1(
		  .VGAx(X_format),
		  .VGAy(Y_format),
		  .rgb(rgb_game)
		  );
endmodule
