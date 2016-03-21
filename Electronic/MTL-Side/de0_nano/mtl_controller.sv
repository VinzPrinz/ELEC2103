// copyright blablabla

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
	
	// output the pixel being written now (useless, to be deleted)
	oXpixel,
	oYpixel,
	
	inR,
	inG,
	inB,
	
	map, // 128 bit signal containing the map information
	touchX,
	touchY,
	
	mtl_reset,
	mtl_mode,
	mtl_counter,
	mtl_irq
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

parameter mtl_mode_fight = 4'b0000;
parameter mtl_mode_load = 4'b0001;
parameter mtl_mode_map_player0 = 4'b0010;
parameter mtl_mode_map_player1 = 4'b0011;

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

input [255:0] map;
input [10:0] touchX;
input [9:0] touchY;

input [3:0] mtl_mode;
input mtl_reset;

output [31:0] mtl_counter;
output mtl_irq;

assign mtl_irq = (Case_Wire == 12'd0) && ~mtl_reset;

//=============================================================================
// REG/WIRE declarations
//=============================================================================

reg  [10:0] x_cnt;  
reg  [9:0]	y_cnt; 
wire [7:0]	read_red;
wire [7:0]	read_green;
wire [7:0]	read_blue; 
wire			display_area, display_area_prev;
wire [23:0] q_rom,q_rom1,q_rom1aftercolor;
wire [18:0] mapAddress; // address to display in map case
wire [18:0] loadingAddress; // address to display in loading case
wire [18:0] finalAddress;
wire [18:0] address; // address acually given to the ROM
reg			mhd;
reg			mvd;
reg			loading_buf;
reg			no_data_yet;


wire inMapControl; // control signal that enables the mtl controller to let the ROM write the screen
assign inMapControl = (mtl_mode == mtl_mode_map_player0 || mtl_mode == mtl_mode_map_player1);

wire turn;
assign turn = inMapControl ? mtl_mode == mtl_mode_map_player1 : 1'bz; // signal valid only if inmap (for now)

wire [2:0]	memoryToLookIn; // 1st bit : 0 if tile, 1 if menu bar; 2nd bit : 0 if tile 0, 1 if tile 1


reg [31:0] counter;
assign mtl_counter = counter;

//=============================================================================
// Structural coding
//=============================================================================

// Assigning current pixel (not useful anymore)
assign oXpixel = x_cnt-(Horizontal_Blank-2);
assign oYpixel = y_cnt-(Vertical_Blank-1);

//--- Assigning the right color data as a function -------------------------
//--- of the current pixel position ----------------------------------------


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
// map color for peyo
mapPinkColorToTeamColor colormapper(
								.inR(q_rom1[23:16]),
								.inG(q_rom1[15:8]),
								.inB(q_rom1[7:0]),
								.team(memoryToLookIn[0]), //0 = red, 1 = blue
								.outR(q_rom1aftercolor[23:16]),
								.outG(q_rom1aftercolor[15:8]),
								.outB(q_rom1aftercolor[7:0]));



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
mapAddresses mapAddressesInstance(x_cnt,y_cnt,map,mapAddress,memoryToLookIn);
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
		if (mtl_mode == mtl_mode_fight ) begin
			if(Case_Wire[11])begin
			read_red 	<= 8'd255;
			read_green 	<= 8'd255;
			//read_blue 	<= 8'd255;
				case(Counter_Wire)
				2'b00: read_blue <= 8'd0;
				2'b10: read_blue <= 8'd255;
				2'b11: read_blue <= 8'd255;
				2'b01: read_blue <= 8'd0;
				endcase
			end
			else begin
				read_blue <= 8'd0;
				read_red <= 8'd255;
				read_green <= 8'd0;
			end
		// ...and if the slideshow is currently loading,
		// then display the loading screen.
		// The current pixel is black (resp. white)
		// if a 1 (resp. 0) is written in the ROM.
		///////////////////////////////////////////////////////////////////////////////// TEST!!!
		end else if (mtl_mode == mtl_mode_load) begin
				read_red 	<= 8'd0; // display a blue screen during loading
				read_green 	<= 8'd0;
				read_blue 	<= 8'd255;

		// NEW : control the screen with the ROM content
		//end else if (inMapControl) begin
		end else if (inMapControl) begin
			if (memoryToLookIn[2]) // if menu is to be shown
			begin 
				read_red 	<= turn ? 8'd0 : 8'd200;   // the menu bar is the player's color
				read_green 	<= 8'd50;
				read_blue 	<= turn ? 8'd200 : 8'd0;
			end else if (~memoryToLookIn[1]) begin // type of tile = tile 0
				read_red 	<= q_rom[23:16];
				read_green 	<= q_rom[15:8];
				read_blue 	<= q_rom[7:0];
			end else begin// type of tile = tile 1 (other rom) and red or blue
				read_red 	<= q_rom1aftercolor[23:16];
				read_green 	<= q_rom1[15:8];
				read_blue 	<= q_rom1aftercolor[7:0];
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

	// Used for the fight game
reg [1:0]	Counter_Reg;
wire [1:0] 	Counter_Wire;
assign Counter_Wire  = Counter_Reg;

reg [8:0]	Counter_X_Reg , Counter_Y_Reg;
wire [8:0]	Counter_Y_Wire, Counter_X_Wire;
assign Counter_X_Wire = Counter_X_Reg;
assign Counter_Y_Wire = Counter_Y_Reg;


reg	[11:0]	Case_Reg;
wire	[11:0]	Case_Wire;
assign Case_Wire = Case_Reg;

parameter Xlength = 200;
parameter Ylength = 160;


	always_ff @ (posedge iCLK or negedge iRST_n)
		if(!iRST_n)
			begin 
				Counter_Reg <= 2'b0;
				Counter_X_Reg <= 9'b0;
				Counter_Y_Reg <= 9'b0;
				Case_Reg <= 12'hfff;
			end
		else if(mtl_reset && x_cnt==0 && y_cnt==0)
			begin 
				Counter_Reg <= 2'b0;
				Counter_X_Reg <= 9'b0;
				Counter_Y_Reg <= 9'b0;
				Case_Reg <= 12'hfff;
			end
		else if((y_cnt==0 && x_cnt==0))
			begin 
				Counter_Reg <= 2'b0;
				Counter_X_Reg <= 9'b0;
				Counter_Y_Reg <= 9'b0;
			end
		else if(x_cnt>=Horizontal_Blank+10 && x_cnt <Horizontal_Blank+10 + 800  && y_cnt>=Vertical_Blank && y_cnt<Vertical_Blank +480)
			begin
				if(x_cnt==850)
					if(Counter_Y_Wire == Ylength-1)
					begin
						Counter_Reg[0] <= Counter_Wire[0]+1'b1;
						Counter_Reg[1] <= Counter_Wire[0]+1'b1;
						Counter_X_Reg <= 9'd0;
						Counter_Y_Reg <= 9'd0;
						Case_Reg[11:1] <= Case_Wire[10:0];
						Case_Reg[0]	<= Case_Wire[11];		
					end
					else
						begin
							Counter_Reg[0] <= Counter_Wire[0];
							Counter_Reg[1] <= Counter_Wire[0];
							
							Case_Reg[11:9] <= Case_Wire[2:0];
							Case_Reg[8:0]	<= Case_Wire[11:3];
							Counter_X_Reg <= 9'd0;
							Counter_Y_Reg <= Counter_Y_Wire + 9'd1;
						end
						
				else if (Counter_X_Wire == Xlength -1)
						begin
							Counter_Reg[1] <= Counter_Wire[1] + 1'b1;
							Counter_Reg[0] <= Counter_Wire[0];
							Counter_X_Reg <= 9'd0;
							Case_Reg[11:1] <= Case_Wire[10:0];
							Case_Reg[0]	<= Case_Wire[11];
						end
				else
					begin
						Counter_X_Reg <= Counter_X_Wire + 9'd1;
						Case_Reg <= Case_Wire;
						if(x_cnt == touchX_new && y_cnt == touchY_new && newTouch)
							Case_Reg[11] <= 1'b0;
					end
			end
			
		reg [9:0] touchY_new;
		reg [10:0] touchX_new;
		reg newTouch;
		
		always_ff @(posedge iCLK)
			if((touchX_new != touchX || touchY != touchY_new)&& x_cnt==0 && y_cnt==0 && ~mtl_reset && ~inMapControl) // add condition?
				begin
					touchX_new <= touchX;
					touchY_new <= touchY;
					newTouch <= 1'b1;
				end
			else if(x_cnt==0 && y_cnt ==0)
				newTouch <= 1'b0;
			else
				newTouch <= newTouch;
						
		always_ff @(posedge iCLK)
			if(mtl_reset || !iRST_n)
				counter <= 32'd0;
			else if(Case_Reg == 12'd0)
				counter <= counter;
			else 
				counter <= counter + 32'd1;
				
	
						
endmodule


// module to map pink color
module mapPinkColorToTeamColor(
								input logic [7:0] inR,
								input logic [7:0] inG,
								input logic [7:0] inB,
								input logic team, //0 = red, 1 = blue
								output logic [7:0] outR,
								output logic [7:0] outG,
								output logic [7:0] outB);
								
		logic [23:0] inColor, outColor;
		assign inColor = {inR,inG,inB};
		assign {outR,outG,outB} = outColor;
		
		always_comb
		begin
			case(inColor)
				24'h_ff_00_ff : 	outColor = team ? 24'h_00_00_ff : 24'h_ff_00_00;
				24'h_c8_00_c8 : 	outColor = team ? 24'h_00_00_c8 : 24'h_c8_00_00;
				24'h_b4_00_b4 : 	outColor = team ? 24'h_00_00_b4 : 24'h_b4_00_00;
				24'h_ff_00_fd : 	outColor = team ? 24'h_aa_aa_ff : 24'h_ff_aa_aa; // todo : image with better/less nuances
				24'h_ff_00_fb : 	outColor = team ? 24'h_aa_aa_ff : 24'h_ff_aa_aa;
				24'h_ff_00_f3 : 	outColor = team ? 24'h_aa_aa_ff : 24'h_ff_aa_aa;
				default:				outColor = inColor;
			endcase
		end
		
endmodule 


