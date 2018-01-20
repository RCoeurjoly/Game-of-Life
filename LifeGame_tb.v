//-------------------------------------------------------------------
//-- formatVGA_tb.v
//-- Banco de pruebas para el ship
//-------------------------------------------------------------------
//-- June 2017. Written by RCL
//-------------------------------------------------------------------

module LifeGame_tb();

   //-- input registers
   reg clk = 0;
   reg clr = 0;
   reg vsync = 0;
   reg [9:0] VGAx = 0;
   reg [9:0] VGAy = 0;
   
   
   //-- outputs
   wire [2:0] rgb;
   
   
   //-- Instanciar el contador
   LifeGame LifeGame1(
		      .clk(clk),
		      .clr(clr),
		      .vsync(vsync),
		      .VGAx(VGAx),
		      .VGAy(VGAy),
		      .rgb(rgb)
		  );

   always #1 clk = ~clk;
   always #1 VGAx = VGAx + 1;
   always #1024 VGAy = VGAy + 1;
   
   
   
//-- Proceso al inicio
   initial begin
      
      //-- Fichero donde almacenar los resultados
      $dumpfile("LifeGame_tb.vcd");
      $dumpvars(0, LifeGame_tb);
      // Next event happens n# of seconds after
      # 100 clr = 1;
      # 50 clr = 0;
      # 50 vsync = 0;
      # 1024 vsync = 1;
      # 50 vsync = 0;
      # 1024 vsync = 1;
      
      # 9999 $display("FIN de la simulacion");
      # 1000000 $finish;
   end
   
endmodule
