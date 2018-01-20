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
module LifeGame(
		input wire 	 clk,
		input wire 	 clr, //asynchronous reset
		input wire 	 vsync,
		input wire [9:0] VGAx,
		input wire [9:0] VGAy,
		output reg [2:0] rgb 	       
		);   
   
   parameter MAX_j = 15;
   parameter MAX_i = 19;
   reg [0:MAX_i] screen [0:MAX_j];
   reg [0:MAX_i] next_screen [0:MAX_j];
   reg [0:4] 	 matrix [0:4];
   
   reg [9:0] 	 i;
   reg [9:0] 	 j;
   reg upper_cell;
   reg upper_right_cell;
   reg right_cell;
   reg lower_right_cell;
   reg lower_cell;
   reg lower_left_cell;
   reg left_cell;
   reg upper_left_cell;
   
   wire [4:0] 			   x = VGAx[9:5];
   wire [3:0] 			   y = VGAy[8:5];
   
   /*initial begin
   for (j = 0; j <= MAX_j; j = j + 1)
     screen[j] <= j;
     //screen[j] <= +{LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR};
   end
   /**/
   
   //for simulation purposes
   initial begin
      matrix[0] <= 31;
      matrix[1] <= 30;
      matrix[2] <= 29;
      matrix[3] <= 28;
      upper_cell <= 0;
      upper_right_cell <= 0;
      right_cell <= 0;
      lower_right_cell <= 0;
      lower_cell <= 0;
      lower_left_cell <= 0;
      left_cell <= 0;
      upper_left_cell <= 0;
      rgb <= 0;
      for (j = 0; j <= MAX_j; j = j + 1)
	for (i = 0; i <= MAX_i; i = i + 1)
	  if ((j == 1) && (i == 10))
	    screen[j][i] <= 1;
	  else if (((j== 5) && (i == 10)) || ((j== 4) && (i == 11)))
	    screen[j][i] <= 1;
	  else if (((j== 9) && (i == 10)) || ((j== 8) && (i == 11)) || ((j== 8) && (i == 9)))
	    screen[j][i] <= 1;
	  else if (((j== 13) && (i == 10)) || ((j== 12) && (i == 11)) || ((j== 12) && (i == 9)) || ((j== 12) && (i == 10)))
	    screen[j][i] <= 1;
	  else
	    screen[j][i] <= 0;
   end/**/
   
   reg [7:0] LFSR = 8'b00101011;
   wire feedback = LFSR[7] ^ LFSR[6:0];
   /*
   //always @(posedge clk)
     initial begin
	LFSR[0] <= feedback;
	LFSR[1] <= LFSR[0];
	LFSR[2] <= LFSR[1] ^ feedback;
	LFSR[3] <= LFSR[2] ^ feedback;
	LFSR[4] <= LFSR[3] ^ feedback;
	LFSR[5] <= LFSR[4] ^ feedback;
	LFSR[6] <= LFSR[5] ^ feedback;
	LFSR[7] <= LFSR[6];
     end
    */

   //neighbour cells
   
   
   //Sending rgb data to vga controller
   always @(posedge clk)
     begin
	if (screen[y][x] == 1)
	  begin
	     rgb[2] <= screen[y][x];
	     rgb[1] <= screen[y][x];
	     rgb[0] <= screen[y][x];
			       end
	else
	  begin
	     rgb[2] <= 0;
				  rgb[1] <= 0;
	     rgb[0] <= 0;
	  end // else: !if(clr == 1)
     end // always @ begin
   always @(posedge clk)
     begin
	if (vsync == 0)
	  begin
	     for (j = 0; j <= MAX_j; j=j +1)
	       begin
		  screen[j] <= next_screen[j];
	       end
	  end
	else
	  begin
	     for (j = 0; j <= MAX_j; j=j +1)
	       begin
		  screen[j] <= screen[j];
	       end
	  end
     end
endmodule
