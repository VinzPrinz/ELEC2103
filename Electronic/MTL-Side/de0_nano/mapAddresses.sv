// See slides from week 6;
// Module cmputing the address to look in the tile ROMs
// and a control signal to see in wich ROM we have to look

module mapAddresses( 
				input logic [10:0] x_cnt, // syncronization signals from the mtl controller
				input logic [9:0]	y_cnt,
				input logic [255:0] map,
				output logic [18:0] mapAddress, // address for the rom
				output logic [2:0] memoryToLookIn); // first bit = 0 if tile, 1 if menu bar; second and third bits = type of tile (2 types for now)
				

parameter Horizontal_Blank = 46;          //H_SYNC + H_Back_Porch
parameter Vertical_Blank = 23;      	   //V_SYNC + V_BACK_PORCH
				
logic [5:0] xpix,ypix; // x and y value inside a tile
logic [3:0] xtile; // x and y value of the tile itself
logic [2:0] ytile;
mapPixels mapPixelsInst(x_cnt,y_cnt,xpix,ypix,xtile,ytile); // call 2 helpful modules (see below)
mapTiles mapTilesInst(xtile,ytile,map,memoryToLookIn[1:0] );

always_comb
begin
if((y_cnt-Vertical_Blank)<400) // if on the map : show the tiles 
begin
	memoryToLookIn[2] = 1'b0;
	mapAddress = memoryToLookIn[0] ? (49 - xpix + ypix*50) : (xpix + ypix*50);
		
end else begin// end if y_pixel < 400; if we come here we are in the menu bar
	memoryToLookIn[2] = 1'b1;
	mapAddress = ((x_cnt-(Horizontal_Blank-2)) + ((y_cnt-Vertical_Blank)-400)*800);
end // end else
end // end always_comb

				
endmodule


module mapPixels(	input logic [10:0] x_cnt,
						input logic [9:0]	y_cnt,
						output logic [5:0] xpix, // x pos on the tile
						output logic [5:0] ypix,
						output logic [3:0] xtile,
						output logic [2:0] ytile);
						
	parameter Horizontal_Blank = 46;          //H_SYNC + H_Back_Porch
	parameter Vertical_Blank = 23;      	   //V_SYNC + V_BACK_PORCH
						
	assign xpix = ((x_cnt-(Horizontal_Blank-2)) % 50);
	assign ypix = ((y_cnt-Vertical_Blank) % 50);
	assign xtile = ((x_cnt-(Horizontal_Blank)) / 50); // no -2 because... reasons...
	assign ytile = ((y_cnt-Vertical_Blank) / 50);
endmodule


module mapTiles(input logic [3:0] xtile,
					 input logic [2:0] ytile,
					 input logic [255:0] map,
					 output logic [1:0] memoryToLookInMap );
						
//	// to modify to take into account the representation of the map (later)
//		assign memoryToLookInMap = xtile[0] && ytile[0];

	assign memoryToLookInMap[0] = map[2*(xtile + 16*ytile)];
	assign memoryToLookInMap[1] = map[2*(xtile + 16*ytile) + 1];
	  // ??? push quartus to the max  
	//assign memoryToLookInMap = map && 1<<(xtile + 8*ytile); 

endmodule

