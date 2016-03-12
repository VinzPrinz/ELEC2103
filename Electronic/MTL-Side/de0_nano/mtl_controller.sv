
// --------------------------------------------------------------------
// Copyright (c) 2007 by Terasic Technologies Inc. 
// --------------------------------------------------------------------
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// --------------------------------------------------------------------
//           
//                     Terasic Technologies Inc
//                     356 Fu-Shin E. Rd Sec. 1. JhuBei City,
//                     HsinChu County, Taiwan
//                     302
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// --------------------------------------------------------------------
//
// Major Functions of V2.0:	MTL controller adapted to a slideshow application
//										on the DE0-Nano board.
//
// --------------------------------------------------------------------
//
// Revision History :
// --------------------------------------------------------------------
//   Ver  :| Author            		:| Mod. Date :| Changes Made:
//   V1.0 :| Johnny Fan					:| 07/06/30  :| Initial Revision
//	  V2.0 :| Charlotte Frenkel      :| 14/08/03  :| Improvements and adaptation to a
//																	 slideshow application on the DE0-Nano
// --------------------------------------------------------------------

module mtl_controller(
	// Host Side
	iCLK, 				// Input LCD control clock
	iRST_n, 				// Input system reset
	iLoading,			// Input signal telling in which loading state is the system
	oNewFrame,			// Output signal being a pulse when a new frame of the LCD begins
	oEndFrame,			// Output signal being a pulse when a frame of the LCD ends
	// SDRAM Side
	iREAD_DATA, 		// Input data from SDRAM (contains R, G and B colors)
	oREAD_SDRAM_EN,	// Output read SDRAM data control signal
	// LCD Side
	oHD,					// Output LCD horizontal sync 
	oVD,					// Output LCD vertical sync 
	oLCD_R,				// Output LCD red color data 
	oLCD_G,           // Output LCD green color data  
	oLCD_B,            // Output LCD blue color data  
	
	// output the pixel being written now
	oXpixel,
	oYpixel,
	
	inR,
	inG,
	inB,
	
	inMapControl // control signal that enables the mtl controller to let the ROM write the screen
);
						
//============================================================================
// PARAMETER declarations
//============================================================================

// All these parameters are given in the MTL datasheet, section 3.2,
// available in the project file folder
parameter H_LINE = 1056; 
parameter V_LINE = 525;
parameter Horizontal_Blank = 46;          //H_SYNC + H_Back_Porch
parameter Horizontal_Front_Porch = 210;
parameter Vertical_Blank = 23;      	   //V_SYNC + V_BACK_PORCH
parameter Vertical_Front_Porch = 22;

//===========================================================================
// PORT declarations
//===========================================================================

input				iCLK;   
input				iRST_n;
input				iLoading;
output			oNewFrame;
output			oEndFrame;
input	 [31:0]	iREAD_DATA;
output			oREAD_SDRAM_EN;
output			oHD;
output			oVD;
output [7:0]	oLCD_R;		
output [7:0]	oLCD_G;
output [7:0]	oLCD_B;
output [10:0]  oXpixel;
output [9:0]   oYpixel;

input [7:0] inR;
input [7:0] inG;
input [7:0] inB;

input inMapControl;



//=============================================================================
// REG/WIRE declarations
//=============================================================================

reg  [10:0] x_cnt;  
reg  [9:0]	y_cnt; 
wire [7:0]	read_red;
wire [7:0]	read_green;
wire [7:0]	read_blue; 
wire			display_area, display_area_prev;
wire [23:0] q_rom,q_rom1;
wire [18:0] mapAddress; // address to display in map case
wire [18:0] loadingAddress; // address to display in loading case
wire [18:0] finalAddress;
wire [18:0] address; // address acually given to the ROM
reg			mhd;
reg			mvd;
reg			loading_buf;
reg			no_data_yet;

wire [1:0]	memoryToLookIn; // 1st bit : 0 if tile, 1 if menu bar; 2nd bit : 0 if tile 0, 1 if tile 1

//=============================================================================
// Structural coding
//=============================================================================

// Assigning current pixel (not useful anymore)
assign oXpixel = x_cnt-(Horizontal_Blank-2);
assign oYpixel = y_cnt-(Vertical_Blank-1);

//--- Assigning the right color data as a function -------------------------
//--- of the current pixel position ----------------------------------------

// This loading ROM contains B/W data to display the loading screen.
// The data is available in the rom.mif file in the project folder.
// Note that it is just a gadget for the demonstration, it is not efficient!
// Indeed, it must contain 1bit x 800 x 480 = 384000 bits of data,
// which is more than 60% of the total memory bits of the FPGA.
// Don't hesitate to suppress it.
//Loading_ROM	Loading_ROM_inst (
//	.address (address),
//	.clock (iCLK),
//	.q (q_rom),
//	//.rden (iLoading) ///////////////////////////////////////////////////////////////////////////////////////
//	.rden (iLoading) // || ~loading_buf
//);

// other ROM :)
//testROM	testROM_inst (
//	.address ( address[17:0] ),
//	.clock ( iCLK ),
//	.rden ( iLoading || inMapControl ),
//	.q ( q_rom )
//	);

// ROM number 3 lol
tile0ROM	tile0ROM_inst (
	.address ( address[11:0] ),
	.clock ( iCLK ),
	.rden ( inMapControl ),
	.q ( q_rom )
	);

tile2	tile2_inst (
	.address ( address[11:0] ),
	.clock ( iCLK ),
	.rden ( inMapControl ),
	.q ( q_rom1 )
	);




// This signal controls read requests to the SDRAM.
// When asserted, new data becomes available in iREAD_DATA
// at each clock cycle.
assign	oREAD_SDRAM_EN = (~loading_buf && display_area_prev);
						
// This signal indicates the LCD active display area shifted back from
// 1 pixel in the x direction. This accounts for the 1-cycle delay
// in the sequential logic.
assign	display_area = ((x_cnt>(Horizontal_Blank-2)&&
						(x_cnt<(H_LINE-Horizontal_Front_Porch-1))&&
						(y_cnt>(Vertical_Blank-1))&& 
						(y_cnt<(V_LINE-Vertical_Front_Porch))));

// This signal indicates the same LCD active display area, now shifted
// back from 2 pixels in the x direction, again for sequential delays.
assign	display_area_prev =	((x_cnt>(Horizontal_Blank-3)&&
						(x_cnt<(H_LINE-Horizontal_Front_Porch-2))&&
						(y_cnt>(Vertical_Blank-1))&& 
						(y_cnt<(V_LINE-Vertical_Front_Porch))));	
						
// This signal updates the ROM address to read from based on the current pixel position.
assign loadingAddress = ((x_cnt-(Horizontal_Blank-2)) + (y_cnt-Vertical_Blank)*800);
// map adress computation by a module :)
mapAddresses mapAddressesInstance(x_cnt,y_cnt,mapAddress,memoryToLookIn);
//assign mapAddress = ((x_cnt-(Horizontal_Blank-2)) + (y_cnt-Vertical_Blank)*800);
assign finalAddress = inMapControl ? mapAddress : loadingAddress;
assign address = display_area_prev ? finalAddress : 19'b0;


// Assigns the right color data.
always_ff @(posedge iCLK) begin
	// If the screen is reset, put at zero the color signals.
	if (!iRST_n) begin
		read_red 	<= 8'b0;
		read_green 	<= 8'b0;
		read_blue 	<= 8'b0;
	// If we are in the active display area...
	end else if (display_area) begin
		// ...and if no data has been sent yet by the PIC32,
		// then display a white screen.
		if (no_data_yet) begin
			read_red 	<= 8'd255;
			read_green 	<= 8'd255;
			read_blue 	<= 8'd255;
		// ...and if the slideshow is currently loading,
		// then display the loading screen.
		// The current pixel is black (resp. white)
		// if a 1 (resp. 0) is written in the ROM.
		///////////////////////////////////////////////////////////////////////////////// TEST!!!
		end else if (loading_buf ) begin
				read_red 	<= 8'd255; // display a yellow screen during loading
				read_green 	<= 8'd255;
				read_blue 	<= 8'b0;

		// NEW : control the screen with the ROM content
		end else if (inMapControl) begin
			if (memoryToLookIn[1]) // if menu is to be shown
			begin 
				read_red 	<= 8'd0;   // the menu bar is a blue bar
				read_green 	<= 8'd100;
				read_blue 	<= 8'd200;
			end else if (~memoryToLookIn[0]) begin // type of tile = tile 0
				read_red 	<= q_rom[23:16];
				read_green 	<= q_rom[15:8];
				read_blue 	<= q_rom[7:0];
			end else begin // type of tile = tile 1 (other rom)
				read_red 	<= q_rom1[23:16];
				read_green 	<= q_rom1[15:8];
				read_blue 	<= q_rom1[7:0];
			end
		// ...and if the slideshow has been loaded,
		// then display the values read from the SDRAM.
		end else begin
			read_red 	<= iREAD_DATA[23:16];
			read_green 	<= iREAD_DATA[15:8];
			read_blue 	<= iREAD_DATA[7:0];
		end
	// If we aren't in the active display area, put at zero
	// the color signals.
	end else begin
		read_red 	<= 8'b0;
		read_green 	<= 8'b0;
		read_blue 	<= 8'b0;
	end
end


//--- Keeping track of x and y positions of the current pixel ------------------
//--- and generating the horiz. and vert. sync. signals ------------------------

always@(posedge iCLK or negedge iRST_n) begin
	if (!iRST_n)
	begin
		x_cnt <= 11'd0;	
		mhd  <= 1'd0;  
	end	
	else if (x_cnt == (H_LINE-1))
	begin
		x_cnt <= 11'd0;
		mhd  <= 1'd0;
	end	   
	else
	begin
		x_cnt <= x_cnt + 11'd1;
		mhd  <= 1'd1;
	end	
end

always@(posedge iCLK or negedge iRST_n) begin
	if (!iRST_n)
		y_cnt <= 10'd0;
	else if (x_cnt == (H_LINE-1))
	begin
		if (y_cnt == (V_LINE-1))
			y_cnt <= 10'd0;
		else
			y_cnt <= y_cnt + 10'd1;	
	end
end

always@(posedge iCLK  or negedge iRST_n) begin
	if (!iRST_n)
		mvd  <= 1'b1;
	else if (y_cnt == 10'd0)
		mvd  <= 1'b0;
	else
		mvd  <= 1'b1;
end	

assign oNewFrame = ((x_cnt == 11'd0)   && (y_cnt == 10'd0)  );	
assign oEndFrame = ((x_cnt == 11'd846) && (y_cnt == 10'd503));	
	
	
//--- Retrieving the current loading state based on the iLoading signal --------
	
// - When iLoading is initially at 0, the PIC32 has not sent anything yet, the 
//   no_data_yet and loading_buf signals are at 1 and a white screen is displayed.
// - When iLoading rises to 1, the slideshow is currently loading and no_data_yet
//   falls at zero: the loading screen is displayed.
// - When iLoading falls back to 0, the loading_buf signal falls at zero at the
//   beginning of the next frame. The SDRAM data is then displayed.
always@(posedge iCLK or negedge iRST_n) begin
	if (!iRST_n) begin
		no_data_yet <= 1'b1;
		loading_buf <= 1'b1;
	end else if (!iLoading && oNewFrame && !no_data_yet) 
		loading_buf <= 1'b0;
	else if (iLoading)
		no_data_yet <= 1'b0;
end	
	

//--- Assigning synchronously the color and sync. signals ------------------

always@(posedge iCLK or negedge iRST_n) begin
	if (!iRST_n)
		begin
			oHD	<= 1'd0;
			oVD	<= 1'd0;
			oLCD_R <= 8'd0;
			oLCD_G <= 8'd0;
			oLCD_B <= 8'd0;
		end
	else
		begin
			oHD	<= mhd;
			oVD	<= mvd;
			oLCD_R <= read_red;
			oLCD_G <= read_green;
			oLCD_B <= read_blue;
		end		
end

	
						
endmodule




