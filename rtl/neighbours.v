//Where are the neighbours?

module neighbours(
		  );

   always @(posedge clk)
     begin
	//limit cases
	if ((y == 0) || (y == MAX_j) || (x == 0) || (x == MAX_i))
	  begin
	     //upper border cases
	     if (y == 0)
	       begin
		  //upper left corner case
		  if (x == 0)
		    begin
		       upper_cell <= {MAX_j,x};
		       upper_right_cell <= {MAX_j,x + 1};
		       right_cell <= {y,x + 1};
		       lower_right_cell <= {y + 1,x + 1};
		       lower_cell <= {y + 1,x};
		       lower_left_cell <= {y + 1,MAX_i};
		       left_cell <= {y,MAX_i};
		       upper_left_cell <= {MAX_j,MAX_i};
		    end // if (x == 0)
		  //upper right corner case
		  else if (x == MAX_i)
		    begin
		       upper_cell <= {MAX_j,x};
		       upper_right_cell <= {MAX_j,x + 1};
		       right_cell <= {y,x + 1};
		       lower_right_cell <= {y + 1,x + 1};
		       lower_cell <= {y + 1,x};
		       lower_left_cell <= {y + 1,MAX_i};
		       left_cell <= {y,MAX_i};
		       upper_left_cell <= {MAX_j,MAX_i};
		    end // if (x == MAX_i)
		  // regular upper border case
		  else
		    begin
		       upper_cell <= {MAX_j,x};
		       upper_right_cell <= {MAX_j,x + 1};
		       right_cell <= {y,x + 1};
		       lower_right_cell <= {y + 1,x + 1};
		       lower_cell <= {y + 1,x};
		       lower_left_cell <= {y + 1,x - 1};
		       left_cell <= {y,x - 1};
		       upper_left_cell <= {MAX_j,x - 1};
		    end // else: !if(x == MAX_i)
	       end // if (y == 0)
	     //right border cases
	     else if (x == MAX_i)
	       begin
		  //lower right corner case
		  if (y == MAX_j)
		    begin
		       upper_cell <= {y - 1,x};
		       upper_right_cell <= {y + 1,0};
		       right_cell <= {y,0};
		       lower_right_cell <= {0,0};
		       lower_cell <= {0,MAX_i};
		       lower_left_cell <= {0,x - 1};
		       left_cell <= {y,MAX_i};
		       upper_left_cell <= {y,MAX_i};
		    end // if (y == MAX_j)
		  //regular right border case
		  else //if (y != 0)
		    begin
		       upper_cell <= {y - 1,x};
		       upper_right_cell <= {y - 1,0};
		       right_cell <= {y,0};
		       lower_right_cell <= {y + 1,0};
		       lower_cell <= {y + 1,x};
		       lower_left_cell <= {y + 1,x - 1};
		       left_cell <= {y,x - 1};
		       upper_left_cell <= {y - 1,x - 1};
		    end // if (y != 0)
	       end // if (x == MAX_i)
	     //lower border cases
	     else if (y == MAX_j)
	       begin
		  //lower left corner case
		  if (x == 0)
		    begin
		       upper_cell <= {y - 1,x};
		       upper_right_cell <= {y + 1,x + 1};
		       right_cell <= {y,x + 1};
		       lower_right_cell <= {y,x + 1};
		       lower_cell <= {0,x};
		       lower_left_cell <= {0,x - 1};
		       left_cell <= {y,MAX_i};
		       upper_left_cell <= {y - 1,MAX_i};
		    end // if (x == 0)
		  //regular lower border case
		  else //if (x != MAX_i)
		    begin
		       upper_cell <= {y - 1,x};
		       upper_right_cell <= {y - 1,x + 1};
		       right_cell <= {y,x + 1};
		       lower_right_cell <= {0,x + 1};
		       lower_cell <= {0,x};
		       lower_left_cell <= {0,x - 1};
		       left_cell <= {y,x - 1};
		       upper_left_cell <= {y - 1,x - 1};
		    end // if (x != MAX_i)
	       end // if (y == MAX_j)
	     //regular left border case
	     else //if (x == 0)
	       begin
		  upper_cell <= {y - 1,x};
		  upper_right_cell <= {y - 1,x + 1};
		  right_cell <= {y,x + 1};
		  lower_right_cell <= {y + 1,x + 1};
		  lower_cell <= {y + 1,x};
		  lower_left_cell <= {y + 1,MAX_i};
		  left_cell <= {y,MAX_i};
		  upper_left_cell <= {y - 1,MAX_i};
	       end // if (x == 0)
	  end // if ((y == 0) or (y == MAX_j) or (x == 0) or (x == MAX_i))
	//normal inner surface
	else
	  begin
	     upper_cell <= {y - 1,x};
	     upper_right_cell <= {y - 1,x + 1};
	     right_cell <= {y,x + 1};
	     lower_right_cell <= {y + 1,x + 1};
	     lower_cell <= {y + 1,x};
	     lower_left_cell <= {y + 1,x - 1};
	     left_cell <= {y,x - 1};
	     upper_left_cell <= {y - 1,x - 1};
	  end // else: !if((y == 0) or (y == MAX_j) or (x == 0) or (x == MAX_i))
     end // always @ (x)

   wire [3:0] sum_neighbours;
   assign sum_neighbours = upper_cell + upper_right_cell + right_cell + lower_right_cell + lower_cell + lower_left_cell + left_cell + upper_left_cell;
