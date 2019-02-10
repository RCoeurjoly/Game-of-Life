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
module rules(
		input wire       clk,
		input wire       clr, //asynchronous reset
    input wire [4:0] sum_neighbours,
		input wire [9:0] VGAx,
		input wire [9:0] VGAy,
		output reg [2:0] rgb
		);

   parameter MAX_j = 14;
   parameter MAX_i = 19;
   reg [0:MAX_i] screen [0:MAX_j];
   reg [0:MAX_i] next_screen [0:MAX_j];
   reg [9:0] 	 i;
   reg [9:0] 	 j;

   wire [4:0] 			   x = VGAx[9:5];
   wire [3:0] 			   y = VGAy[8:5];


   //Rules of Conways's Game of Life
   always @(*)
     begin
	      //if the cell is alive
	      if (screen[y][x] == 1)
	        begin
	           case (sum_neighbours)
	             //Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
	             4'b0000, 4'b0001: next_screen[y][x] = 0;
	             //Any live cell with two or three live neighbours lives on to the next generation.
	             4'b0010, 4'b0011: next_screen[y][x] = 1;
	             //Any live cell with more than three live neighbours dies, as if by overpopulation.
	             default: next_screen[y][x] = 0;
	           endcase
	        end // if (screen[y][x] == 1)
	      //if the cell is dead
	      else
	        begin
	           case (sum_neighbours)
	             //Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
	             4'b0011: next_screen[y][x] = 1;
	             default: next_screen[y][x] = 0;
	           endcase // case (sum_neighbours)
	        end // if (screen[y][x] == 0)
     end
endmodule
