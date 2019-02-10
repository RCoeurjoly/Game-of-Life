module game_of_life_top(
	                      input wire  i_clk_12MHz,
	                      output wire o_hsync, //horizontal sync out
	                      output wire o_vsync, //vertical sync out
	                      output wire o_red, //red vga output
	                      output wire o_green, //green vga output
	                      output wire o_blue //blue vga output
	                      );

   wire                             clk_25MHz;
   wire [2:0]                       rgb;
   wire [9:0]                       x, y;

   clk_25MHz_generator clk_36MHz_generator1(
					                                  .i_clk_12MHz(i_clk_12MHz),
					                                  .o_clk_25MHz(clk_25MHz)
					                                  );

   vga_controller vga_controller1(
				                          .i_clk_25MHz(clk_25MHz),
				                          .i_rgb(rgb),
				                          .o_hsync(o_hsync),
				                          .o_vsync(o_vsync),
				                          .o_red(o_red),
				                          .o_green(o_green),
				                          .o_blue(o_blue),
				                          .o_x(x),
				                          .o_y(y)
				                          );

   matrix matrix1(
		              .i_x(x),
		              .i_y(y),
		              .o_rgb(rgb)
		              );

endmodule
