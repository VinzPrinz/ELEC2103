//=======================================================

module MySPI (
	input  logic		 theClock, theReset,
	input  logic       MySPI_clk, MySPI_cs, MySPI_sdi,
	output logic  		 MySPI_sdo,
	output logic [8:0] Config,
	input  logic [8:0] Status,
	output logic [8:0] Led70,
	input  logic [8:0] IO_Counter,IO_PosX , IO_PosY, ReadAddr, IO_Snake_Winner,
	output logic [8:0] IO_ImagePixel_R_Out , IO_ImagePixel_G_Out , IO_ImagePixel_B_Out,
	output logic		 irq
);

//--- Registers Address ---------------------------------

parameter A_Config				= 7'h00;
parameter RetreiveAddr    		= 7'h01;
parameter Counter     			= 7'h02;
parameter PosX						= 7'h03;
parameter PosY						= 7'h04;
parameter ImagePixel_R   		= 7'h12;
parameter ImagePixel_G  		= 7'h13;
parameter ImagePixel_B			= 7'h14;
parameter A_Led70					= 7'h16;
parameter Snake_Winner			= 7'h08;
	
//--- FSM States ----------------------------------------

typedef enum logic [3:0] {
	S_Wait, 
	S_Addr, S_Addr_00, S_Addr_01, S_Addr_11,
	S_Data, S_Data_00, S_Data_01, S_Data_11,
	S_End} statetype;

//--- Declarations --------------------------------------

statetype	SPI_state, SPI_nextstate;
logic			SPI_CLK0, SPI_CLK;
logic			SPI_CS0, SPI_CS;
logic [2:0] SPI_counter;
logic			SPI_counter_reset, SPI_counter_inc;	 
logic [7:0] SPI_address, SPI_data;
logic			SPI_address_shift;
logic			SPI_data_shift, SPI_data_load, SPI_data_update;

//--- SPI Output ----------------------------------------

assign MySPI_sdo = SPI_data[7];

//--- SPI Double Synchronization ------------------------

always @ (posedge theClock)
begin
	SPI_CLK0 <= MySPI_clk;	SPI_CLK  <= SPI_CLK0;
	SPI_CS0  <= MySPI_cs;	SPI_CS   <= SPI_CS0;
end


//--- SPI FSM -------------------------------------------

always_ff @ (posedge theClock)
	SPI_state <= SPI_nextstate;
	
always_comb
begin
	SPI_nextstate = SPI_state;
	case (SPI_state)
		S_Wait	 : if (SPI_CS) SPI_nextstate = S_Wait;
							else SPI_nextstate = S_Addr;
					
		S_Addr	 : SPI_nextstate = S_Addr_00;
		S_Addr_00 : if (SPI_CLK) SPI_nextstate = S_Addr_01;
		S_Addr_01 : SPI_nextstate = S_Addr_11;
		S_Addr_11 : if (SPI_CLK) SPI_nextstate = S_Addr_11;
							else if (SPI_counter == 3'b000) SPI_nextstate = S_Data;
								else SPI_nextstate = S_Addr_00;
		S_Data	 : SPI_nextstate = S_Data_00;
		S_Data_00 : if (SPI_CLK) SPI_nextstate = S_Data_01;
		S_Data_01 : SPI_nextstate = S_Data_11;
		S_Data_11 : if (SPI_CLK) SPI_nextstate = S_Data_11;
							else if (SPI_counter == 3'b000) SPI_nextstate = S_End;
								else SPI_nextstate = S_Data_00;
		S_End     : SPI_nextstate = S_Wait; 
	endcase
	if (SPI_CS) SPI_nextstate = S_Wait;
	case(SPI_state)
		S_End : irq = 1'b1;
		default: irq = 1'b0;
	endcase
end

assign SPI_counter_reset = ((SPI_state == S_Addr)    | (SPI_state == S_Data));
assign SPI_counter_inc   = ((SPI_state == S_Addr_01) | (SPI_state == S_Data_01));
assign SPI_address_shift = (SPI_state == S_Addr_01);
assign SPI_data_shift	 = (SPI_state == S_Data_01);
assign SPI_data_load		 = (SPI_state == S_Data);
assign SPI_data_update   = ((SPI_state == S_End) & SPI_address[7]);

//--- On the positive edge of the clock -----------------

always_ff @ (posedge theClock)
begin
	
	if (SPI_counter_reset) SPI_counter <= 3'b000;
		else if (SPI_counter_inc) SPI_counter <= SPI_counter + 1;
		
	if (SPI_address_shift) SPI_address <= { SPI_address[6:0], MySPI_sdi };
	
	if (SPI_data_shift) SPI_data <= { SPI_data[6:0], MySPI_sdi };
		else if (SPI_data_load)
			case (SPI_address[6:0])
				RetreiveAddr    	: SPI_data <= ReadAddr;
				Counter     		: SPI_data <= IO_Counter;
				ImagePixel_R   	: SPI_data <= IO_ImagePixel_R_Out;
				ImagePixel_G  		: SPI_data <= IO_ImagePixel_G_Out;
				ImagePixel_B		: SPI_data <= IO_ImagePixel_B_Out;
				PosX					: SPI_data <= IO_PosX;
				PosY					: SPI_data <= IO_PosY;
				Snake_Winner 		: SPI_data <= IO_Snake_Winner;
				default: SPI_data <= 8'hff;
			endcase
		
	if (theReset) Config <= 8'h00;
		else if ((SPI_data_update) & (SPI_address[6:0] == A_Config)) Config <= SPI_data;
		
	if (theReset) Led70 <= 8'h00;
		else if ((SPI_data_update) & (SPI_address[6:0] == A_Led70)) Led70 <= SPI_data;	

	if (theReset) IO_ImagePixel_R_Out <= 8'h00;
		else if ((SPI_data_update) & (SPI_address[6:0] == ImagePixel_R)) IO_ImagePixel_R_Out <= SPI_data;	
	if (theReset) IO_ImagePixel_G_Out <= 8'h00;
	else if ((SPI_data_update) & (SPI_address[6:0] ==	ImagePixel_G)) IO_ImagePixel_G_Out <= SPI_data;	
	if (theReset) IO_ImagePixel_B_Out <= 8'h00;
	else if ((SPI_data_update) & (SPI_address[6:0] == ImagePixel_B)) IO_ImagePixel_B_Out <= SPI_data;	
		
/*	if (theReset) IO_Counter <= 8'h00;
		else if ((SPI_data_update) & (SPI_address[6:0] == IO_Counter)) IO_Counter <= SPI_data;	
	if (theReset) IO_PosX <= 8'h00;
		else if ((SPI_data_update) & (SPI_address[6:0] == IO_PosX)) IO_PosX <= SPI_data;
	if (theReset) IO_PosY <= 8'h00;
		else if ((SPI_data_update) & (SPI_address[6:0] == IO_PosY)) IO_PosY <= SPI_data;
*/
end

endmodule

//=======================================================