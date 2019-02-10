module matrix(
	            input wire [9:0] i_x,
	            input wire [9:0] i_y,
	            output reg [2:0] o_rgb
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

   reg [MAX_j : 0]             screen [MAX_i : 0];
   reg [MAX_j : 0]             next_screen [0 : MAX_i];
   reg [4:0]                   i, j;

   wire [4:0]                  sprite_x = i_x[9:5];
   wire [3:0]                  sprite_y = i_y[8:5];
   wire [4:0]                  index_x = i_x[4:0];
   wire [4:0]                  index_y = i_y[4:0];
   wire [19:0]                 position = {i_x, i_y};


   initial begin
      $readmemb("assets/initial_matrix.txt", screen);
   end

   always @(*) begin
      if (screen[sprite_y][sprite_x] == 1)
	      o_rgb = MAGENTA;
      else
	      o_rgb = BLACK;
   end // always @ (*)

endmodule // matrix
