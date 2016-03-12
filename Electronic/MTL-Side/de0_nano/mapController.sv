module mapController(
				input logic clk,
				input logic reset,
				input logic newFrame, // old version, not used anymore
				input logic [10:0] Xpixel,
				input logic [9:0] Ypixel,
				output logic tileLoad, // update the addresses
				output logic [23:0] base_read_addr,
				output logic [23:0] max_read_addr,
				
				// for testing purposes
				output logic [7:0] test);
				
	// note Xpixel and Ypixel come from mtl controller and are defined as :
	//  assign oXpixel = x_cnt-(Horizontal_Blank-2);
	//  assign oYpixel = y_cnt-(Vertical_Blank-1);

	logic [3:0] row_tile_cnt; // on wich tile we are
	logic [2:0] line_tile_cnt;
	logic [7:0] line_counter; // = where we are within 50x50 image
	
	//assign line_counter = Ypixel - 50*line_tile_cnt; doesn't work :(
	assign line_counter = Ypixel % 50;
	
	// used to check out some values
	assign test = base_read_addr[14:7];
	
	assign base_read_addr = 24'b0 + (100*line_counter); 
	assign max_read_addr  = 24'd100	+ (100*line_counter) ; //?
	//assign max_read_addr  = 24'd98	+ (100*line_counter) ;
					
	
	// always block computing on wich tile we are
	always_ff@(posedge clk, posedge reset)
	begin
		if (reset) begin
			row_tile_cnt <= 4'b0;
			line_tile_cnt <= 3'b0;
			tileLoad <= 1'b0;
		end else begin
		case(Xpixel) // brutal
			11'd0:	begin row_tile_cnt <= 4'b0000; tileLoad <= 1'b1; end
			11'd50:	begin row_tile_cnt <= 4'b0001; tileLoad <= 1'b1; end
			11'd100:	begin row_tile_cnt <= 4'b0010; tileLoad <= 1'b1; end
			11'd150:	begin row_tile_cnt <= 4'b0011; tileLoad <= 1'b1; end
			11'd200:	begin row_tile_cnt <= 4'b0100; tileLoad <= 1'b1; end
			11'd250:	begin row_tile_cnt <= 4'b0101; tileLoad <= 1'b1; end
			11'd300:	begin row_tile_cnt <= 4'b0110; tileLoad <= 1'b1; end
			11'd350:	begin row_tile_cnt <= 4'b0111; tileLoad <= 1'b1; end
			11'd400:	begin row_tile_cnt <= 4'b1000; tileLoad <= 1'b1; end
			11'd450:	begin row_tile_cnt <= 4'b1001; tileLoad <= 1'b1; end
			11'd500:	begin row_tile_cnt <= 4'b1010; tileLoad <= 1'b1; end
			11'd550:	begin row_tile_cnt <= 4'b1011; tileLoad <= 1'b1; end
			11'd600:	begin row_tile_cnt <= 4'b1100; tileLoad <= 1'b1; end
			11'd650:	begin row_tile_cnt <= 4'b1101; tileLoad <= 1'b1; end
			11'd700:	begin row_tile_cnt <= 4'b1110; tileLoad <= 1'b1; end
			11'd750:	begin row_tile_cnt <= 4'b1111; tileLoad <= 1'b1; end
			default:  tileLoad <= 1'b0; 
		endcase
		
		case(Ypixel)
			10'd0: 	line_tile_cnt <= 3'b000;
			10'd50: 	line_tile_cnt <= 3'b001;
			10'd100: line_tile_cnt <= 3'b010;
			10'd150: line_tile_cnt <= 3'b011;
			10'd200: line_tile_cnt <= 3'b100;
			10'd250: line_tile_cnt <= 3'b101;
			10'd300: line_tile_cnt <= 3'b110;
			10'd350: line_tile_cnt <= 3'b111;
		endcase
		end // end if-else
	end // end always_ff

endmodule


// old (bad) version
	// for testing !!
//	logic slow_clk;
//	logic [31:0] slow_clk_cnt;
//	always_ff@(posedge clk, posedge reset)
//		if(reset) slow_clk_cnt <= 32'b0;
//		else slow_clk_cnt <= slow_clk_cnt + 1;
//	assign slow_clk = slow_clk_cnt[23];
				
	// signals
//	logic [7:0] row_counter;
//	logic [7:0] line_counter; // = where we are within 50x50 image
//	logic [3:0] row_tile_cnt; // on wich tile we are
//	logic [2:0] line_tile_cnt;
//	
//	assign test = 3'b0;//{tileLoad,row_tile_cnt[0],row_counter[0]};
//				
//	always_ff@(posedge clk, posedge reset)
//	// always_ff@(posedge slow_clk, posedge reset) // for test
//	begin
//		if(reset)
//		begin
//			tileLoad 		<= 1'b0;
//			base_read_addr <= 24'b0;
//			max_read_addr  <= 24'b0;
//			row_counter 	<= 8'b0;
//			line_counter 	<= 8'b0;
//			row_tile_cnt	<= 4'b0; 
//			line_tile_cnt	<= 3'b0;
//		end
//		
//		else if(newFrame) // if new frame, put all counters to zero
//		begin
//			tileLoad 		<= 1'b1;
//			base_read_addr <= 24'b0;
//			max_read_addr  <= 24'd100;
//			row_counter 	<= 8'b0;
//			line_counter 	<= 8'b0; 
//			row_tile_cnt	<= 4'b0;
//			line_tile_cnt	<= 3'b0;
//		end
//		
//		else // else 1
//		begin 
//			if(row_counter == 8'd49) // ? 50? if we come in a new tile
//			begin // if 2
//				if (row_tile_cnt == 4'b1111) // we have written all the tiles, goto next line!
//				begin // if 3
//					row_tile_cnt <= 4'b0; // put tile back to zero
//					if (line_counter == 8'd49) // if we come in a new line of tiles
//					begin // begin if 4
//						line_counter <= 8'd0; // put line counter back to zero
//						if (line_tile_cnt == 3'b111) // if we have written all the tile lines (finally screen is written)
//						begin
//							line_tile_cnt <= 3'b0; // put tile line back to zero
//						end
//						else // increment tile line
//						line_tile_cnt <= line_tile_cnt + 3'b1;
//					end // end if 4
//					else // we have not yet written all the lines in the tile line, goto next line 
//					line_counter <= line_counter + 8'd1;
//				end // end if 3
//				else begin// we have not yet written all the tiles of the line, goto next tile (begin else 3)
//					row_tile_cnt <= row_tile_cnt + 4'b1;
//					
//					// compute the new addresses (nothing very complicated for now)
//					base_read_addr <= 24'b0		+ (24'd100*line_counter); // RACE CONDITIONS ARE MAYBE POSSIBLE!!!!!!
//					max_read_addr  <= 24'd100	+ (24'd100*line_counter) ;
//					tileLoad <= 1'b1; // load new adresses
//					row_counter <= 8'd0; // put row counter back to zero
//				end // end else 3
//			end // end if 2
//			else //if ()// else : increment row counter (else 2)
//			begin // begin else 2
//				row_counter <= row_counter + 8'd1;
//				tileLoad <= 1'b0; // nothing to load
//			end // end else 2
//		end // end else 1
//	end // end always_ff