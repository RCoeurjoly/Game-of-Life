module top(
	   input wire  clk_12MHz,
	   output wire hsync, //horizontal sync out
	   output wire vsync, //vertical sync out
	   output wire red, //red vga output
	   output wire green, //green vga output
	   output wire blue //blue vga output 	       
	   );   
   
   wire 	       clk_36MHz;
   wire [2:0] 	       rgb;
   wire [9:0] 	       x, y;
  
   clk_36MHz_generator clk_36MHz_generator1(
					    .clk_12MHz(clk_12MHz),
					    .clk_36MHz(clk_36MHz)
					    );
   
   vga_controller vga_controller1(
				  .clk_36MHz(clk_36MHz),
				  .rgb(rgb),
				  .hsync(hsync),
				  .vsync(vsync),
				  .red(red),
				  .green(green),
				  .blue(blue),
				  .x(x),
				  .y(y)
				  );
   
   matrix matrix1(
		  .x(x),
		  .y(y),
		  .rgb(rgb)
		  );

endmodule
