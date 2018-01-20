module matrix(
	      input wire [9:0] VGAx,
	      input wire [9:0] VGAy,
	      output reg [2:0] rgb 	       
	      );   
   
   parameter MAX_j = 239;
   parameter MAX_i = 319;
   reg [0:MAX_i] screen [0:MAX_j];

   wire [7:0] 	 x;
   wire [7:0] 	 y;
   assign x = VGAx[9:1];
   assign y = VGAy[9:1];
   reg [9:0] 	 i;
   reg [9:0] 	 j;

   reg [7:0] 	 LFSR = 8'b00101011;
   //wire feedback = LFSR[7] ^ LFSR[6:0];

   initial begin
      /*LFSR[0] <= feedback;
      LFSR[1] <= LFSR[0];
      LFSR[2] <= LFSR[1] ^ feedback;
      LFSR[3] <= LFSR[2] ^ feedback;
      LFSR[4] <= LFSR[3] ^ feedback;
      LFSR[5] <= LFSR[4] ^ feedback;
      LFSR[6] <= LFSR[5] ^ feedback;
      LFSR[7] <= LFSR[6];*/
      for (j = 0; j <= MAX_j; j = j + 1)
	begin
	   screen[j] <= j;
	   //screen[j + 1] <= j;
      //screen[j] <= +{LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR, LFSR};
	end
   end // initial begin
   
   always @(*)
     begin
	if (screen[y][x] == 1)
	  begin
	     rgb[2] <= 1;
	     rgb[1] <= 1;
	     rgb[0] <= 1;
	  end
	else
	  begin
	     rgb[2] <= 0;
	     rgb[1] <= 0;
	     rgb[0] <= 1;
	  end // else: !if(clr == 1)
     end // always @ begin
   /**/
endmodule // matrix
