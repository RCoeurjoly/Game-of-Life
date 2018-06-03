module matrix(
	      input wire [9:0] x,
	      input wire [9:0] y,
	      output reg [2:0] rgb 	       
	      );   


   // The screen is 640 x 480 pixels
   // We divide the screen in sprites of 32 x 32
   // We get a screen composed of 20 x 15 sprites of 32 x 32 pixels each
   
   parameter MAX_i = 14;
   parameter MAX_j = 19;
   parameter [2:0] 	   BLACK = 3'b000;
   parameter [2:0] 	   BLUE = 3'b001;
   parameter [2:0] 	   GREEN = 3'b010;
   parameter [2:0] 	   CYAN = 3'b011;
   parameter [2:0] 	   RED = 3'b100;
   parameter [2:0] 	   MAGENTA = 3'b101;
   parameter [2:0] 	   YELLOW = 3'b110;
   parameter [2:0] 	   WHITE = 3'b111;

   reg [MAX_j : 0] 	       screen [MAX_i : 0];
   reg [4:0] 		       i, j;
   
   wire [4:0] 		       sprite_x = x[9:5];
   wire [3:0] 		       sprite_y = y[8:5];
   wire [4:0] 		       index_x = x[4:0];
   wire [4:0] 		       index_y = y[4:0];
   
   initial begin
      screen[0]   <= 20'b00000000000000000000;
      screen[1]   <= 20'b00000000000000000000;
      screen[2]   <= 20'b00000000000000010000;
      screen[3]   <= 20'b00000000000000100000;
      screen[4]   <= 20'b00000011111110000000;
      screen[5]   <= 20'b00000000010000010000;
      screen[6]   <= 20'b00000000010000100000;
      screen[7]   <= 20'b00000011111110000000;
      screen[8]   <= 20'b00000000010000000000;
      screen[9]   <= 20'b00000000010000100000;
      screen[10]  <= 20'b00000011111110010000;
      screen[11]  <= 20'b00000000000000000000;
      screen[12]  <= 20'b00000000000000000000;
      screen[13]  <= 20'b00000000000000000000;
      screen[14]  <= 20'b00000000000000000000;
   end
   
   always @(*) begin
      if (screen[sprite_y][sprite_x] == 1)
	rgb <= MAGENTA;
      else
	rgb <= BLACK;
   end // always @ (*)
  
endmodule // matrix
