module matrix(
	      input wire [9:0] x,
	      input wire [9:0] y,
	      output reg [2:0] rgb 	       
	      );   
   
   parameter MAX_i = 4;
   parameter MAX_j = 3;
   reg [MAX_i:0] screen [MAX_j:0];
   reg [4:0] 	 i, j;
   
   wire [4:0] 	 sprite_x = x[9:5];
   wire [3:0] 	 sprite_y = y[8:5];
   wire [4:0] 	 index_x = x[4:0];
   wire [4:0] 	 index_y = y[4:0];
   
   initial begin
      for (j = 0; j <= 15; j = j + 1) begin
	 screen[j] <= j;
      end
   end // initial begin
   
   always @(*) begin
      if (screen[sprite_x][sprite_y] == 1) begin
	 rgb[2] <= 1;
	 rgb[1] <= 1;
	 rgb[0] <= 1;
      end
      else begin
	 rgb[2] <= 0;
	 rgb[1] <= 0;
	 rgb[0] <= 0;
      end // else: !if(screen[y][x] == 1)
   end // always @ (*)
   
endmodule // matrix
