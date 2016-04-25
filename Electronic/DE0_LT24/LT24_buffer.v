//`timescale 1 ps / 1 ps
module LT24_buffer(
	clk,
	rst_n,
	//////////////  LCD LT24 to GPIO1 ////////////////
	LT24_ADC_BUSY_bus,
	LT24_ADC_CS_N_bus,
	LT24_ADC_DCLK_bus,
	LT24_ADC_DIN_bus,
	LT24_ADC_DOUT_bus,
	LT24_ADC_PENIRQ_N_bus,
	LT24_D_bus,
	LT24_WR_N_bus,
	LT24_RD_N_bus,
	LT24_CS_N_bus,
	LT24_RESET_N_bus,
	LT24_RS_bus,
	
	LT24_ADC_BUSY_screen,
	LT24_ADC_CS_N_screen,
	LT24_ADC_DCLK_screen,
	LT24_ADC_DIN_screen,
	LT24_ADC_DOUT_screen,
	LT24_ADC_PENIRQ_N_screen,
	LT24_D_screen,
	LT24_WR_N_screen,
	LT24_RD_N_screen,
	LT24_CS_N_screen,
	LT24_RESET_N_screen,
	LT24_RS_screen,
	
	pic_mem_s2_address,               
	pic_mem_s2_chipselect,            
	pic_mem_s2_clken,                 
	pic_mem_s2_write,                 
	pic_mem_s2_readdata,              
	pic_mem_s2_writedata,             
	pic_mem_s2_byteenable,
	
	lt24_buffer_flag,
	
	background_mem_s2_address,                   
	background_mem_s2_chipselect,               
	background_mem_s2_clken,                     
	background_mem_s2_write,                    
	background_mem_s2_readdata,                 
	background_mem_s2_writedata,                
	background_mem_s2_byteenable, 
	
	snake_mem_address,                   
	snake_mem_chipselect,               
	snake_mem_clken,                     
	snake_mem_write,                    
	snake_mem_readdata,                 
	snake_mem_writedata,                
	snake_mem_byteenable, 
	
	lt24_finish,
	lt24_pattern,
	lt24_counter,
	VX,
	VY,
	lt24_coin_x,
	lt24_coin_y,
	lt24_coin_x0,
	lt24_coin_y0,
	lt24_coin_vx0,
	lt24_coin_vy0,
	lt24_pattern_0
);

input clk;
input rst_n;
wire rst;
assign rst = ~rst_n;

input		          			LT24_ADC_CS_N_bus;
input		          			LT24_ADC_DCLK_bus;
input		          			LT24_ADC_DIN_bus;
output		          		LT24_ADC_BUSY_bus;
output		          		LT24_ADC_DOUT_bus;
output		          		LT24_ADC_PENIRQ_N_bus;
input		    [15:0]			LT24_D_bus;
input		          			LT24_WR_N_bus;
input			          		LT24_RD_N_bus;
input			         		LT24_CS_N_bus;
input		         			LT24_RESET_N_bus;
input			         		LT24_RS_bus;

output		          			LT24_ADC_CS_N_screen;
output		          			LT24_ADC_DCLK_screen;
output			          		LT24_ADC_DIN_screen;
input			          		   LT24_ADC_BUSY_screen;
input		          		   	LT24_ADC_DOUT_screen;
input		          		   	LT24_ADC_PENIRQ_N_screen;
output	reg	    [15:0]		LT24_D_screen;
output	reg	          		LT24_WR_N_screen;
output	reg	          		LT24_RD_N_screen;
output	reg	         		LT24_CS_N_screen;
output	reg	         		LT24_RESET_N_screen;
output	reg	         		LT24_RS_screen;

output  wire [11:0] 	pic_mem_s2_address;               
output  wire        	pic_mem_s2_chipselect;            
output  wire        	pic_mem_s2_clken;                 
output  wire        	pic_mem_s2_write;                 
input 	wire [15:0] pic_mem_s2_readdata;              
output  wire [15:0] 	pic_mem_s2_writedata;             
output  wire [1:0]  	pic_mem_s2_byteenable; 

output  wire [12:0] background_mem_s2_address;                   
output  wire        background_mem_s2_chipselect;               
output  wire        background_mem_s2_clken;                     
output  wire        background_mem_s2_write;                    
input   wire [15:0] background_mem_s2_readdata;                 
output  wire [15:0] background_mem_s2_writedata;                
output  wire [1:0]  background_mem_s2_byteenable; 

output  wire [9:0] snake_mem_address;                   
output  wire        snake_mem_chipselect;               
output  wire        snake_mem_clken;                     
output  wire        snake_mem_write;                    
input   wire [7:0]  snake_mem_readdata;                 
output  wire [7:0]  snake_mem_writedata;                
output  wire [1:0]  snake_mem_byteenable; 


input 	wire				lt24_buffer_flag;
output 	wire				lt24_finish;
input		wire	[11:0]	lt24_pattern;
output	wire	[31:0]	lt24_counter;
input 	wire [31:0]	VX , VY;    

output wire [31:0] lt24_coin_x;
output wire [31:0] lt24_coin_y;
input wire [31:0] lt24_coin_x0;
input wire [31:0] lt24_coin_y0;
input wire [31:0] lt24_coin_vx0;
input wire [31:0] lt24_coin_vy0;
input wire [11:0] lt24_pattern_0;

assign lt24_coin_x = X1;
assign lt24_coin_y = Y1;

reg				lt24_finish_reg;
reg	[31:0]	lt24_counter_reg;
    

reg	    [15:0]		LT24_D_loc;
reg	          		LT24_WR_N_loc;
wire	          		LT24_RD_N_loc;
reg	         		LT24_CS_N_loc;
wire	         		LT24_RESET_N_loc;
reg	         		LT24_RS_loc;	

//buses for the touch control : directly from the screen to the CPU
assign LT24_ADC_CS_N_screen = LT24_ADC_CS_N_bus;
assign LT24_ADC_DCLK_screen = LT24_ADC_DCLK_bus;
assign LT24_ADC_DIN_screen = LT24_ADC_DIN_bus;
assign LT24_ADC_BUSY_bus = LT24_ADC_BUSY_screen;
assign LT24_ADC_DOUT_bus = LT24_ADC_DOUT_screen;
assign LT24_ADC_PENIRQ_N_bus = LT24_ADC_PENIRQ_N_screen;

// assign interface LT24
wire [31:0] lt24_counter_wire;
assign lt24_finish = (lt24_finish_reg && (lt24_pattern[1:0]==2'b01 || lt24_pattern[1:0]==2'b00)) || (lt24_pattern[1:0]==2'b11 && pattern_moving == Case_Reg);
assign lt24_counter = (lt24_counter_reg);
assign lt24_counter_wire = lt24_counter_reg;


//flag that says if the bus is controlled by LT24_buffer or by the CPU
reg bufferFlag;
wire bufferFlag_wire;
assign bufferFlag_wire = bufferFlag;

always @ (posedge clk)
begin
// Clr_BUFFER_FLAG() has been called in software : the CPU must control the screen
if(rst || ((LT24_D_bus == 16'h002c) && (LT24_RS_bus == 1'b0) && (LT24_CS_N_bus == 1'b0) && (lt24_buffer_flag == 1'b0)))
	begin
	bufferFlag <= 1'd0;
	end
// Set_BUFFER_FLAG() has been called in software : the LT24_buffer must control the screen
else if((LT24_D_bus == 16'h002c) && (LT24_RS_bus == 1'b0) && (LT24_CS_N_bus == 1'b0) && (lt24_buffer_flag == 1'b1))
	begin
	bufferFlag <= 1'd1;
	end
else 
	begin
	bufferFlag <= bufferFlag;
	end
end

always 
begin
	//if the screen is to be controlled by LT24_buffer
	if (bufferFlag == 1'd1)
		begin
		LT24_D_screen <= LT24_D_loc;
		LT24_WR_N_screen <= LT24_WR_N_loc;
		LT24_RD_N_screen <= LT24_RD_N_loc;
		LT24_CS_N_screen <= LT24_CS_N_loc;
		LT24_RESET_N_screen <= LT24_RESET_N_loc;
		LT24_RS_screen <= LT24_RS_loc;
		end
	//if the screen is to be controlled by the CPU
	else
		begin
		LT24_D_screen <= LT24_D_bus;
		LT24_WR_N_screen <= LT24_WR_N_bus;
		LT24_RD_N_screen <= LT24_RD_N_bus;
		LT24_CS_N_screen <= LT24_CS_N_bus;
		LT24_RESET_N_screen <= LT24_RESET_N_bus;
		LT24_RS_screen <= LT24_RS_bus;
		end
end
//we never do a read of the screen
assign  LT24_RD_N_loc = 1'b1;
//the cpu always control the reset of the screen
assign  LT24_RESET_N_loc = LT24_RESET_N_bus;

//screenState corresponds to the several states in the FSM used to transfer the data to the screen
//screenState = 0 to screenState = 6 : the cursor is set to the pixel (0,0) of the screen
//screenState > 6 to screenState <= 76806 : each pixel of the screen is written line by line from left to right
reg [17:0] screenState;
always @ (posedge clk)
begin
//if the rst is set or if the cpu controls the screen
if(rst || (bufferFlag == 1'd0))
	begin
	screenState <= 18'd0;
	//no writing by LT24_buffer is allowed
	LT24_WR_N_loc = 1'b0;
	LT24_CS_N_loc = 1'b0;
	end
//toggle the LT24 ChipSelect_N and Write_Enable_N pin after each writing by LT24_buffer, the screenState does not evolve
else if((LT24_WR_N_loc==1'b0) && (LT24_CS_N_loc==1'b0))
	begin
	screenState <= screenState;
	LT24_WR_N_loc = 1'b1;
	LT24_CS_N_loc = 1'b1;
	end
//if the last pixel of the screen (the 320x240=768000th) has already been written : we come back to screenState = 0
else if(screenState>=18'd76806)
	begin
	screenState <= 18'd0;
	LT24_WR_N_loc = 1'b0;
	LT24_CS_N_loc = 1'b0;
	end
//pass to the following state (either the following pixel or the following step to put the cursor to (0,0))
else 
	begin
	screenState <= screenState+18'd1;
	LT24_WR_N_loc = 1'b0;
	LT24_CS_N_loc = 1'b0;
	end
end

//not a good idea to store an image like that, better idea : use an onchip mem instantiated on Qsys
//reg [15:0] RAM[76799:0];
//initial
//     $readmemh("MyImage.hex",RAM);



wire [10:0]  limLowX, limLowY, limHighX, limHighY, characPosX, characPosY;
reg  [10:0] posX, posY, pointerX, pointerY , old_pointerX , old_pointerY;

// Used for the fight game
reg [1:0]	Counter_Reg;
wire [1:0] 	Counter_Wire;
assign Counter_Wire  = Counter_Reg;

reg [7:0]	Counter_X_Reg , Counter_Y_Reg;
wire [7:0]	Counter_Y_Wire, Counter_X_Wire;
assign Counter_X_Wire = Counter_X_Reg;
assign Counter_Y_Wire = Counter_Y_Reg;

reg 	[3:0]	Counter_Case_Reg;
wire 	[3:0] Counter_Case_Wire;
assign 		Counter_Case_Wire = Counter_Case_Reg;

reg	[11:0]	Case_Reg;
wire	[11:0]	Case_Wire;
assign Case_Wire = Case_Reg;



// Used for the coins game


parameter H1 = 20;
parameter L1 = 20;

reg 	col;
wire col_wire;
assign col_wire = col;


reg [10:0]	X1 , Y1;
reg [31:0]  cnt;
wire displayCharact;

wire [31:0] VXC , VYC;
//parameter VXC = 1;
//parameter VYC = 1;
//wire [10:0] VYC , VXC;

assign VXC = lt24_coin_vx0;
assign VYC = lt24_coin_vy0;
reg [10:0]	X1C , Y1C;
//parameter X1C = 100;
//parameter Y1C = 100;
wire displayCoin;


assign displayCharact = (posX >= X1) && (posX < X1+H1) && (posY >= Y1) && (posY < Y1+L1);
assign displayCoin = (posX >= X1C) && (posX < X1C+H1) && (posY >= Y1C) && (posY < Y1C+L1);



//LT24_buffer never write on the background onchip mem
assign 	background_mem_s2_writedata = 16'h0;
assign	background_mem_s2_write = 1'b0;
assign  	background_mem_s2_byteenable = 2'b11;
//the 80x60 pixels image of background is replicated 16 times on the whole screen
assign 	background_mem_s2_address = ({2'b0,posX} % 13'd60) + (13'd60*({2'b0,posY} % 13'd80));
//the background is only read when the screen is browsed
assign 	background_mem_s2_chipselect = (screenState >= 18'd6) && (screenState < 18'd76806);
assign 	background_mem_s2_clken = background_mem_s2_chipselect;


//the limits of the area of the screen where the character is displayed (it is a 64x64 picture)
// ok, let's make some changes here! it is a 30x40 pic
//assign 	limLowX = pointerX - 11'd31;
//assign 	limHighX = pointerX + 11'd32;
//assign 	limLowY = pointerY - 11'd31;
//assign 	limHighY = pointerY + 11'd32;
assign 	limLowX = pointerX - 11'd39;
assign 	limHighX = pointerX + 11'd40;
assign 	limLowY = pointerY - 11'd39;
assign 	limHighY = pointerY + 11'd40;

//LT24_buffer never write on the character onchip mem
assign 	pic_mem_s2_writedata = 16'h0;
assign	pic_mem_s2_write = 1'b0;
assign  	pic_mem_s2_byteenable = 2'b11;

// Let's change here also :)
//The current position within the picture of the character
//assign 	characPosX = posX - (pointerX - 11'd31);
//assign 	characPosY = posY - (pointerY - 11'd31);
assign 	characPosX = posX - (X1C); 
assign 	characPosY = posY - (Y1C);

//The address of the current pixel in the 64x64 picture of the character (picmem)
//assign 	pic_mem_s2_address = {1'b0,characPosX} + (12'd64*{1'b0,characPosY});

assign 	pic_mem_s2_address =  {1'b0,characPosX} + (12 'd20*({1'b0,characPosY}));
//if the current pixel is within the character area : the character is displayed
assign 	pic_mem_s2_chipselect = (characPosX >= 11'd0) && (characPosX < 11'd20) && (characPosY >= 11'd0) && (11'd20 > characPosX);
assign 	pic_mem_s2_clken = pic_mem_s2_chipselect;


always 
begin
//set the cursor to (0,0) (equivalent to LCD_SetCursor(0,0) in software)
if((screenState == 18'd0))
	begin 
	LT24_RS_loc <= 1'b0;
	LT24_D_loc <= 16'h002a;             
	end
else if (screenState == 18'd1)
	begin
	LT24_RS_loc <= 1'b1;
	LT24_D_loc <= 16'h0000;
	end
else if (screenState == 18'd2)
	begin
	LT24_RS_loc <= 1'b1;
	LT24_D_loc <= 16'h0000;
	end
else if (screenState == 18'd3)
	begin
	LT24_RS_loc <= 1'b0;
	LT24_D_loc <= 16'h002b;             
	end
else if (screenState == 18'd4)
	begin 
	LT24_RS_loc <= 1'b1;
	LT24_D_loc <= 16'h0000;             
	end
else if (screenState == 18'd5)
	begin
	LT24_RS_loc <= 1'b1;
	LT24_D_loc <= 16'h0000;              
	end
else if (screenState == 18'd6)
	begin
	LT24_RS_loc <= 1'b0;
	LT24_D_loc <= 16'h002c;                                            
	end
//write the image pixel by pixel (line by line from left to right)
else if ((screenState>18'd6) && (screenState<18'd76806))//&& lt24_pattern[0]==1'b1)
	begin
		LT24_RS_loc <= 1'b1;
		LT24_D_loc <= Game1_Color_wire;
	end 	
//if the last pixel of the screen has already been written
else if (screenState>=18'd76806)
	begin
	LT24_RS_loc <= 1'b1;
	LT24_D_loc <= Game1_Color_wire;            
	end
//should never happen
else
	begin
	LT24_RS_loc <= 1'b0;
	LT24_D_loc <= 16'h002c;              
	end
end

//FSM to compute the X and Y position of the current pixel on the screen
always @ (posedge clk)
	begin
	if((screenState <= 18'd5)||(screenState>=18'd76806) || rst)
		begin
		posX <= 11'd0;
		posY <= 11'd0;
		Counter_Reg <= 2'b00;
		Counter_X_Reg <= 8'b0;
		Counter_Y_Reg <= 8'd0;
		Counter_Case_Reg <= 4'b0;
		pattern_moving <= lt24_pattern_0;
		pattern_err <= 1'b0;
		if(rst)
		begin
			Case_Reg <= 12'hfff;
			lt24_finish_reg <= 1'b0;
		end else if(bufferFlag == 1'b0)
			Case_Reg[11:0] <= 12'hfff;
			
		end
	//new pixel on the next line 
	else if(posX >= 11'd239 && (LT24_CS_N_loc==1'b0))
		begin
		posX <= 11'd0;
		posY <= posY + 11'd1;
		if(Counter_Y_Wire == 8'd79)
			begin
				Counter_Reg[0] <= Counter_Wire[0] + 1'b1;
				Counter_Reg[1] <= Counter_Wire[0] + 1'b1;
				Counter_X_Reg <= 8'd0;
				Counter_Y_Reg <= 8'd0;
				Counter_Case_Reg <= Counter_Case_Wire +4'd1;
				Case_Reg[11:1] <= Case_Wire[10:0];
				Case_Reg[0]	<= Case_Wire[11];
				pattern_moving[11:1]<=pattern_moving[10:0];
				pattern_moving[0] <= pattern_moving[11];
			end
		else if (Counter_X_Wire == 8'd79)
			begin
				Counter_Reg[1] <= Counter_Wire[0]+1'b1;
				Counter_Reg[0] <= Counter_Wire[0];
				Counter_X_Reg <= 8'd0;
				Counter_Y_Reg <= Counter_Y_Wire + 8'd1;
				Counter_Case_Reg <= Counter_Case_Wire - 12'd2;
				Case_Reg[11:10] <= Case_Wire[1:0];
				Case_Reg[9:0]	<= Case_Wire[11:2];
				pattern_moving[11:10] <= pattern_moving[1:0];
				pattern_moving[9:0] <= pattern_moving[11:2];
			end
		else
			Counter_Y_Reg <= Counter_Y_Wire + 8'd1;
		end
	//new pixel on the same line
	else if((LT24_CS_N_loc==1'b0))
		begin
		posX <= posX+11'd1;
		if (Counter_X_Wire == 8'd79)
			begin
				Counter_Reg[1] <= Counter_Wire[1] + 1'b1;
				Counter_X_Reg <= 8'd0;
				Case_Reg[11:1] <= Case_Wire[10:0];
				Case_Reg[0]	<= Case_Wire[11];
				pattern_moving[11:1] <= pattern_moving[10:0];
				pattern_moving[0] <= pattern_moving[11];
				Counter_Case_Reg <= Counter_Case_Wire + 2'd1;
			end
		else
			Counter_X_Reg <= Counter_X_Wire + 8'd1;
			
		posY <= posY;
		end
	else
		begin
		posX <= posX;
		posY <= posY;

		lt24_finish_reg <=  (!lt24_pattern[0] && Case_Reg == 12'b0) || (lt24_pattern[0] && col_wire==1'b1);
		
		if(posX == pointerX && posY == pointerY)
			begin
			pattern_err <= pattern_moving_wire[11];
			
			if(pattern_moving_wire[11] && pattern_state)
				Case_Reg <= 12'hfff;
			else
				Case_Reg[11] <= 1'b0; 
				
			end
		else
			pattern_err <= 1'b0;
			
		end
	end

//FSM to get the position of the last touch on the screen (from the CPU)
always @ (posedge clk)
	begin
	// if reset or if the CPU controls the screen
	if(rst || ~LT24_RESET_N_bus || (bufferFlag == 1'b0) || (!pattern_state && (lt24_pattern[1:0] == 2'b11)))
		begin
		pointerX <= 11'd1024;
		pointerY <= 11'd1024;
		end
	// if the CPU wants to transfer X or Y position to the LT24_buffer and if LT24_buffer controls the screen
	else if(~LT24_CS_N_bus && ~LT24_WR_N_bus && (bufferFlag == 1'b1))
		begin
		//if the LCD_WR_DATA(Y) instruction has been called in software
		if(LT24_RS_bus == 1'b0)
			begin
			pointerX <=  LT24_D_bus;
			pointerY <=  pointerY;
			end
		//if the LCD_WR_REG(X) instruction has been called in software
		else
			begin
			pointerY <=  LT24_D_bus;
			pointerX <= pointerX;
			end
		end
	else 
		begin
			pointerX <= pointerX;
			pointerY <= pointerY;
		end
	end
	
	wire [31:0] Yflag; 
	assign Yflag = VY + 32'd1;
	
	
// FSM to choose the position of jean-didier and the coins

	wire [31:0] negY1;
	assign negY1 = Y1-(~VY+32'd1);
	
	always @ (posedge clk)
		if(rst)
			Y1 <= 10;
		else if (negY1[31] && VY[31])
			Y1 <= 0;
		else if( Y1+VY >= (320-L1) && ~VY[31]) // VX positif
			Y1 <= 320-L1;
		else if ((Y1-(~VY +32'd1) >= 320-L1) && VY[31]) // VX neg
			Y1 <= 320-L1;
		else if( cnt == 32'h000ffffe && ~VY[31]) // VX positif
			Y1 <= Y1+VY;
		else if (cnt == 32'h000ffffe && VY[31]) // VX neg
			Y1 <= Y1-(~VY + 32'd1);
		else	
			Y1 <= Y1;
			
			
	wire [31:0] negX1;
	assign negX1 = (X1) -(~VX+32'd1);
			
	always @ (posedge clk)
		if(rst)
			X1 <= 10;
		else if (negX1[31] && VX[31])
			X1 <= 0;
		else if( X1+VX >= (240-H1) && ~VX[31]) // VX positif
			X1 <= 240-H1;
		else if ((X1-(~VX +32'd1) >= 240-H1) && VX[31]) // VX neg
			X1 <= 240-H1;
		else if( cnt == 32'h000ffffe && ~VX[31]) // VX positif
			X1 <= X1+VX;
		else if (cnt == 32'h000ffffe && VX[31]) // VX neg
			X1 <= X1-(~VX + 32'd1);
		else	
			X1 <= X1;
			
		always @ (posedge clk)
		if (rst || X1C + VXC < 1)
			X1C <= 240-H1 ;
		else if (bufferFlag_wire == 1'b0)
			X1C <= lt24_coin_x0;
		else if( X1C+VXC >= (240-H1)) // VX positif
			X1C <= 1 + H1;
		else if( cnt == 32'h000ffffe) // VX positif
			X1C <= X1C+VXC;
		else
			X1C <= X1C;
			
	always @ (posedge clk)
		if(rst || Y1C + VYC < 1)
			Y1C <= 320-L1;
		else if( bufferFlag_wire == 1'b0)
			Y1C <= lt24_coin_y0;
		else if( Y1C+VYC >= (320-L1))
			Y1C <= 1  + L1;
		else if( cnt == 32'h000ffffe)
			Y1C <= Y1C+VYC;
		else
			Y1C <= Y1C;
			
	always @ (posedge clk)
		if(rst || cnt == 32'h000fffff)
			cnt <= 0;
		else
			cnt <= cnt+1;
			
	always @ (posedge clk)
	if(rst)
		col <= 1'b0;
	else if(displayCharact && displayCoin)
		col <= bufferFlag;
	else if(bufferFlag == 1'b0)
		col <= 1'b0;
	else
		col <= col;
		
reg [15:0] Game1_Color;
wire [15:0] Game1_Color_wire;
assign Game1_Color_wire = Game1_Color;
reg [7:0] snake1 , snake2;

////////////////////////////////// What to shown during the snake /////////////:
always
		if(snakeX % 4 == 0 && snake_mem_readdata[1]==1'b1)
			snake1 <= 8'h0f;
		else if(snakeX % 4 == 1 && snake_mem_readdata[3] == 1'b1)
			snake1 <= 8'h0f;
		else if(snakeX % 6'd4 == 2 && snake_mem_readdata[5] == 1'b1)
			snake1 <= 8'h0f;
		else if(snakeX % 6'd4 == 3 && snake_mem_readdata[7] == 1'b1)
			snake1 <= 8'h0f;
		else 
			snake1 <= 8'hff;
			
always
		if(snakeX % 4 == 0 && snake_mem_readdata[0]==1'b1)
			snake2 <= 8'h0f;
		else if(snakeX % 4 == 1 && snake_mem_readdata[2] == 1'b1)
			snake2 <= 8'h0f;
		else if(snakeX % 6'd4 == 2 && snake_mem_readdata[4] == 1'b1)
			snake2 <= 8'h0f;
		else if(snakeX % 6'd4 == 3 && snake_mem_readdata[6] == 1'b1)
			snake2 <= 8'h0f;
		else 
			snake2 <= 8'hff;
			
			
			
//// Choosing what we set on the screen 
	always 	@ (posedge clk)	
		if(lt24_pattern[1:0] == 2'b10)
				Game1_Color <= {snake2   ,snake1}; // snake show
		else if(lt24_pattern[1:0] == 2'b11) // pattern game
				if(pattern_state) 
					if(Case_Wire[11])
						case(Counter_Wire)
							2'b00: Game1_Color <= bow_q ? 16'h0f00 : 16'h0000; 
							2'b01: Game1_Color <= bow_q ? 16'h0f00 : 16'h0000;
							2'b11: Game1_Color <= bow_q ? 16'h00aa : 16'h0000;
							2'b10: Game1_Color <= bow_q ? 16'h00aa : 16'h0000;
						endcase
					else
						Game1_Color <= target_touched_q ? 16'haa00:16'h0000;
				else
					if(pattern_moving[11])
						case(Counter_Wire)
							2'b00: Game1_Color <= bow_q ? 16'h0f00 : 16'h0000;
							2'b01: Game1_Color <= bow_q ? 16'h0f00 : 16'h0000;
							2'b11: Game1_Color <= bow_q ? 16'h00aa : 16'h0000;
							2'b10: Game1_Color <= bow_q ? 16'h00aa : 16'h0000;
						endcase
					else
						Game1_Color <= target_q ? 16'hf0ff : 16'h0000;
		else if(lt24_pattern[0]) // coin game
			case({displayCharact , displayCoin})
				2'b11: Game1_Color <= 16'h0000;
				2'b10: Game1_Color <= 16'hf0ff;
				2'b01: Game1_Color <= rompiece_q ? background_mem_s2_readdata: 16'h00aa;
				default: Game1_Color <= background_mem_s2_readdata;
			endcase 
		else if(Case_Wire[11]) // speed game
			case(Counter_Wire)
				2'b00: Game1_Color <= shield_q ? 16'h0f00 : 16'h0000;
				2'b01: Game1_Color <= shield_q ? 16'h0f00 : 16'h0000;
				2'b11: Game1_Color <= shield_q ? 16'h00aa : 16'h0000;
				2'b10: Game1_Color <= shield_q ? 16'h00aa : 16'h0000;
			endcase
		else
			Game1_Color <= shield_broken_q ? 16'haa00 : 16'h0000;
			
	parameter ZERO = 32'd0;
	parameter ONE = 32'd1;
	
	
////////////////////////////// SNAKE GAME ///////////////////////////
assign snake_mem_address = (posX +1)/40 + (snakeY)*9'd8;                 
assign snake_mem_chipselect = background_mem_s2_chipselect;           
assign snake_mem_clken  = snake_mem_chipselect;                     
assign snake_mem_write = 1'b0;                                 

assign snake_mem_writedata = 8'h0;
assign snake_mem_byteenable = 2'b11; 

reg [7:0] snake_mem_writedata_reg;
reg [31:0] snakeCnt;
wire [5:0] snakeX , snakeY;
wire newCaseSnake;

assign snakeX = (posX) / 11'd10;
assign snakeY = posY / 11'd10;

assign newCaseSnake = (posX %  11'd10 == 0 && posY % 11'd10 ==0);

///////////////////////// FSM FOR Pattern Game ////////////////////

parameter pattern_0 = 12'hff0;

reg pattern_state;
reg [31:0] pattern_cnt;
reg [11:0] pattern_moving;
wire [11:0] pattern_moving_wire;

assign pattern_moving_wire = pattern_moving;
wire pattern_rst;
reg pattern_err;
assign pattern_rst = pattern_err;

// state 0 -> showing the pattern
// state 1 -> getting data
always @(posedge clk)
		if(rst ||!(lt24_pattern[1:0] == 2'b11)|| (pattern_rst && pattern_state))
			begin
				pattern_state <= 1'b0;
				pattern_cnt <= 32'd0;
			end
		else if(pattern_cnt == 32'h03ffffff)
			begin
				pattern_state <= (lt24_pattern[1:0]==2'b11);
				pattern_cnt <= 32'd0;
			end
		else if(!pattern_state)
			pattern_cnt <= pattern_cnt + 32'd1;
		else
			pattern_cnt <= pattern_cnt;
		
		
wire rompiece_q;
rompiece (
	pic_mem_s2_address,
	clk,
	rompiece_q);

wire [12:0] address_shield;
wire shield_q , shield_broken_q , bow_q  , target_q , target_touched_q;
assign address_shield = ({2'b0,posX} % 13'd80) + (13'd80*({2'b0,posY} % 13'd80));
//assign address_shield_lol = Counter_X_Reg + 80*Counter_Y_Reg; 

shield_rom2 (
	address_shield,
	clk,
	shield_q);
	
shieldB (
	address_shield,
	clk,
	shield_broken_q);
	
bow_rom(
	address_shield,
	clk,
	bow_q);
	
target_rom(
	address_shield,
	clk,
	target_q);

target_touched_rom(
	address_shield,
	clk,
	target_touched_q);

endmodule