module matrix(
	      input wire [9:0] x,
	      input wire [9:0] y,
	      output reg [2:0] rgb 	       
	      );   


   // The screen is 640 x 480 pixels
   // We divide the screen in sprites of 32 x 32
   // We get a screen composed of 20 x 15 sprites of 32 x 32 pixels each
   
   parameter MAX_i = 3;
   parameter MAX_j = 4;
   parameter [2:0] 	   BLACK = 3'b000;
   parameter [2:0] 	   BLUE = 3'b001;
   parameter [2:0] 	   GREEN = 3'b010;
   parameter [2:0] 	   CYAN = 3'b011;
   parameter [2:0] 	   RED = 3'b100;
   parameter [2:0] 	   MAGENTA = 3'b101;
   parameter [2:0] 	   YELLOW = 3'b110;
   parameter [2:0] 	   WHITE = 3'b111;

   reg [MAX_i : 0] 	       screen [MAX_j : 0];
   reg [4:0] 		       i, j;
   
   wire [4:0] 		       sprite_x = x[9:5];
   wire [3:0] 		       sprite_y = y[8:5];
   wire [4:0] 		       index_x = x[4:0];
   wire [4:0] 		       index_y = y[4:0];
   
   initial begin	 
   /*   for (i = 0; i < 3; i = i + 1) begin
	 screen[i]  <= 2'b01;
      end
*/	       
       screen[1]  <= 3;
       screen[2]  <= 3;
       screen[3]  <= 3;
       screen[4]  <= 3;
       screen[5]  <= 3;
       screen[6]  <= 3;
       screen[7]  <= 3;
       screen[8]  <= 3;
       screen[9]  <= 3;
       screen[10] <= 3;
       screen[11] <= 3;
       screen[12] <= 3;
       screen[13] <= 3;
       screen[14] <= 3;
       
   end // initial begin
   
   always @(*) begin
      if (screen[sprite_y][sprite_x] == 1)
	rgb <= WHITE;
      else
	rgb <= BLACK;
   end // always @ (*)
  
endmodule // matrix
