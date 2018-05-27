module matrix(
	      input wire [9:0] x,
	      input wire [9:0] y,
	      output reg [2:0] rgb 	       
	      );   
   
   parameter MAX_i = 1;
   parameter MAX_j = 1;
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
      for (i = 0; i < 3; i = i + 1) begin
	 screen[i]  <= 2'b01;
      end
	 /*      
       screen[1]  <= 20'b00010001111001000010;
       screen[2]  <= 20'b00100001001000000000;
       screen[3]  <= 20'b00101000000000000000;
       screen[4]  <= 20'b00011110010000100001;
       screen[5]  <= 20'b00000100001000100110;
       screen[6]  <= 20'b00000100000000001000;
       screen[7]  <= 20'b00100001001000100110;
       screen[8]  <= 20'b00000000010000001000;
       screen[9]  <= 20'b00010001000000000000;
       screen[10] <= 20'b00100110010001001000;
       screen[11] <= 20'b10000001000001100010;
       screen[12] <= 20'b10000110000011000000;
       screen[13] <= 20'b00100001110001000110;
       screen[14] <= 20'b10000100000011100000;
*/       
   end // initial begin
   
   always @(*) begin
      if (sprite_x[0] ^ sprite_y[0] == 1)
	rgb <= WHITE;
      else rgb <= BLACK;
   end // always @ (*)
   
endmodule // matrix
