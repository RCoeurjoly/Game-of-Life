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
module top_tb();   

   //-- Registro para generar la señal de reloj
   reg dclk = 0;
   reg clr = 0;
   

   //salidas
   wire hsync;
   wire vsync;
   wire red;
   wire green;
   wire blue;
   
   //-- Instanciar el contador
   top top1(
	    .dclk(dclk),
	    .clr(clr),
	    .hsync(hsync),
	    .vsync(vsync),
	    .red(red),
	    .green(green),
	    .blue(blue)
	    );

   //-- Generador de reloj. Periodo 2 unidades
   always #1 dclk = ~dclk;

   always @(negedge dclk) begin
   end
   //-- Proceso al inicio
   initial begin
      
      //-- Fichero donde almacenar los resultados
      $dumpfile("top_tb.vcd");
      $dumpvars(0, top_tb);
      # 10 clr = 1;
     
      # 100000 $display("End of simulation");
      # 1 $finish;
   end
endmodule
