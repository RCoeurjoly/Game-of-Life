//Where are the neighbours?

module neighbours(
                  input wire [9:0] i_x,
	                input wire [9:0] i_y,
	                output reg [3:0] o_sum
		              );

   parameter MAX_i = 14;
   parameter MAX_j = 19;

   always @(*) begin
	    //limit cases
	    if ((i_y == 0) || (i_y == MAX_j) || (i_x == 0) || (i_x == MAX_i))
	      begin
	         //upper border cases
	         if (i_y == 0)
	           begin
		            //upper left corner case
		            if (i_x == 0)
		              begin
		                 upper_cell <= {MAX_j,i_x};
		                 upper_right_cell <= {MAX_j,i_x + 1};
		                 right_cell <= {i_y,i_x + 1};
		                 lower_right_cell <= {i_y + 1,i_x + 1};
		                 lower_cell <= {i_y + 1,i_x};
		                 lower_left_cell <= {i_y + 1,MAX_i};
		                 left_cell <= {i_y,MAX_i};
		                 upper_left_cell <= {MAX_j,MAX_i};
		              end // if (i_x == 0)
		            //upper right corner case
		            else if (i_x == MAX_i)
		              begin
		                 upper_cell <= {MAX_j,i_x};
		                 upper_right_cell <= {MAX_j,i_x + 1};
		                 right_cell <= {i_y,i_x + 1};
		                 lower_right_cell <= {i_y + 1,i_x + 1};
		                 lower_cell <= {i_y + 1,i_x};
		                 lower_left_cell <= {i_y + 1,MAX_i};
		                 left_cell <= {i_y,MAX_i};
		                 upper_left_cell <= {MAX_j,MAX_i};
		              end // if (i_x == MAX_i)
		            // regular upper border case
		            else
		              begin
		                 upper_cell <= {MAX_j,i_x};
		                 upper_right_cell <= {MAX_j,i_x + 1};
		                 right_cell <= {i_y,i_x + 1};
		                 lower_right_cell <= {i_y + 1,i_x + 1};
		                 lower_cell <= {i_y + 1,i_x};
		                 lower_left_cell <= {i_y + 1,i_x - 1};
		                 left_cell <= {i_y,i_x - 1};
		                 upper_left_cell <= {MAX_j,i_x - 1};
		              end // else: !if(i_x == MAX_i)
	           end // if (i_y == 0)
	         //right border cases
	         else if (i_x == MAX_i)
	           begin
		            //lower right corner case
		            if (i_y == MAX_j)
		              begin
		                 upper_cell <= {i_y - 1,i_x};
		                 upper_right_cell <= {i_y + 1,0};
		                 right_cell <= {i_y,0};
		                 lower_right_cell <= {0,0};
		                 lower_cell <= {0,MAX_i};
		                 lower_left_cell <= {0,i_x - 1};
		                 left_cell <= {i_y,MAX_i};
		                 upper_left_cell <= {i_y,MAX_i};
		              end // if (i_y == MAX_j)
		            //regular right border case
		            else //if (i_y != 0)
		              begin
		                 upper_cell <= {i_y - 1,i_x};
		                 upper_right_cell <= {i_y - 1,0};
		                 right_cell <= {i_y,0};
		                 lower_right_cell <= {i_y + 1,0};
		                 lower_cell <= {i_y + 1,i_x};
		                 lower_left_cell <= {i_y + 1,i_x - 1};
		                 left_cell <= {i_y,i_x - 1};
		                 upper_left_cell <= {i_y - 1,i_x - 1};
		              end // if (i_y != 0)
	           end // if (i_x == MAX_i)
	         //lower border cases
	         else if (i_y == MAX_j)
	           begin
		            //lower left corner case
		            if (i_x == 0)
		              begin
		                 upper_cell <= {i_y - 1,i_x};
		                 upper_right_cell <= {i_y + 1,i_x + 1};
		                 right_cell <= {i_y,i_x + 1};
		                 lower_right_cell <= {i_y,i_x + 1};
		                 lower_cell <= {0,i_x};
		                 lower_left_cell <= {0,i_x - 1};
		                 left_cell <= {i_y,MAX_i};
		                 upper_left_cell <= {i_y - 1,MAX_i};
		              end // if (i_x == 0)
		            //regular lower border case
		            else //if (i_x != MAX_i)
		              begin
		                 upper_cell <= {i_y - 1,i_x};
		                 upper_right_cell <= {i_y - 1,i_x + 1};
		                 right_cell <= {i_y,i_x + 1};
		                 lower_right_cell <= {0,i_x + 1};
		                 lower_cell <= {0,i_x};
		                 lower_left_cell <= {0,i_x - 1};
		                 left_cell <= {i_y,i_x - 1};
		                 upper_left_cell <= {i_y - 1,i_x - 1};
		              end // if (i_x != MAX_i)
	           end // if (i_y == MAX_j)
	         //regular left border case
	         else //if (i_x == 0)
	           begin
		            upper_cell <= {i_y - 1,i_x};
		            upper_right_cell <= {i_y - 1,i_x + 1};
		            right_cell <= {i_y,i_x + 1};
		            lower_right_cell <= {i_y + 1,i_x + 1};
		            lower_cell <= {i_y + 1,i_x};
		            lower_left_cell <= {i_y + 1,MAX_i};
		            left_cell <= {i_y,MAX_i};
		            upper_left_cell <= {i_y - 1,MAX_i};
	           end // if (i_x == 0)
	      end // if ((i_y == 0) or (i_y == MAX_j) or (i_x == 0) or (i_x == MAX_i))
	    //normal inner surface
	    else
	      begin
	         upper_cell <= {i_y - 1,i_x};
	         upper_right_cell <= {i_y - 1,i_x + 1};
	         right_cell <= {i_y,i_x + 1};
	         lower_right_cell <= {i_y + 1,i_x + 1};
	         lower_cell <= {i_y + 1,i_x};
	         lower_left_cell <= {i_y + 1,i_x - 1};
	         left_cell <= {i_y,i_x - 1};
	         upper_left_cell <= {i_y - 1,i_x - 1};
	      end // else: !if((i_y == 0) or (i_y == MAX_j) or (i_x == 0) or (i_x == MAX_i))
   end // always @ (i_x)

   wire [3:0] sum_neighbours;
   assign sum_neighbours = upper_cell + upper_right_cell + right_cell + lower_right_cell + lower_cell + lower_left_cell + left_cell + upper_left_cell;

endmodule
