// new_component.v

// This file was auto-generated as a prototype implementation of a module
// created in component editor.  It ties off all outputs to ground and
// ignores all inputs.  It needs to be edited to make it do something
// useful.
// 
// This file will not be automatically regenerated.  You should check it in
// to your version control system if you want to keep it.

//`timescale 1 ps / 1 ps
module MyCycloneSPI (
		input  wire        clk,                //    clock_sink.clk
		input  wire        reset,              //    reset_sink.reset
		input  wire        SPI_clk,            // SPI_interface.SPI_clk
		input  wire        SPI_CS,             //              .SPI_CS
		input  wire        SPI_SDI,            //              .SPI_SDI
		output wire        SPI_SDO,            //              .SPI_SDO
		output wire [7:0]  data_out,           //              .data_out
		output wire        data_out_enable,    //              .data_out_enable
		input  wire [7:0]  avs_s0_address,     //        avs_s0.address
		input  wire        avs_s0_read,        //              .read
		output wire [31:0] avs_s0_readdata,    //              .readdata
		input  wire        avs_s0_write,       //              .write
		input  wire [31:0] avs_s0_writedata,   //              .writedata
		output wire        avs_s0_waitrequest, //              .waitrequest
		output wire        ins_irq0_irq,        //      ins_irq0.irq
		output wire [7:0]	 Config,
		output wire 		 spi_irq
	);
	
	logic [8:0] theStatus;
	MySPI SPI_inst (
	.theClock(clk), .theReset(reset),
	.MySPI_clk(SPI_clk), .MySPI_cs(SPI_CS), .MySPI_sdi(SPI_SDI),
	.MySPI_sdo(SPI_SDO),
	.Config(Config),
	.Status(theStatus),
	.Led70(),
	.IO_Counter(IO_Counter),
	.IO_PosX(IO_PosX), 
	.IO_PosY(IO_PosY), 
	.ReadAddr(ReadAddr),
	.IO_ImagePixel_R_Out(IO_ImagePixel_R_Out), 
	.IO_ImagePixel_G_Out(IO_ImagePixel_G_Out), 
	.IO_ImagePixel_B_Out(IO_ImagePixel_B_Out),
	.irq(ins_irq0_irq)
);


	wire [7:0] IO_Counter , IO_PosX , IO_PosY, ReadAddr;
	wire [7:0] IO_ImagePixel_R_Out , IO_ImagePixel_G_Out , IO_ImagePixel_B_Out;
	reg  [7:0] IO_Counter_reg , IO_PosX_reg , IO_PosY_reg, ReadAddr_reg;
	reg  [31:0] avs_s0_readdata_reg;
	reg 		avs_s0_waitrequest_reg;
	reg  [1:0] irq_count;

	// register address
	parameter A_Config				= 7'h00;
	parameter RetreiveAddr    		= 7'h01;
	parameter Counter     			= 7'h02;
	parameter PosX						= 7'h03;
	parameter PosY						= 7'h04;
	parameter ImagePixel_R   		= 7'h12;
	parameter ImagePixel_G  		= 7'h13;
	parameter ImagePixel_B			= 7'h14;
	parameter A_Led70					= 7'h16;
	
	assign avs_s0_waitrequest = avs_s0_waitrequest_reg ;
	assign avs_s0_readdata = avs_s0_readdata_reg;
	
	assign IO_Counter = IO_Counter_reg;
	assign IO_PosX = IO_PosX_reg;
	assign IO_PosY = IO_PosY_reg;
	assign ReadAddr = ReadAddr_reg;
	assign spi_irq = avs_s0_write;
	
	always @(posedge clk)begin
		if(reset)
			begin
				avs_s0_waitrequest_reg <= 1'b0;
				IO_PosX_reg <= 8'b0;
				IO_PosY_reg <= 8'b0;
				IO_Counter_reg <= 8'b0;
				ReadAddr_reg <= 8'b0;
				theStatus <= 8'b0;
				irq_count <= 2'b0;
			end
		else if(avs_s0_write & !avs_s0_waitrequest_reg)
			begin
				avs_s0_waitrequest_reg <= 1'b1;
				ReadAddr_reg <= avs_s0_address[6:0];
				case(avs_s0_address[6:0])
					Counter 	: IO_Counter_reg 	<= avs_s0_writedata[7:0];
					PosX	  	: IO_PosX_reg 		<= avs_s0_writedata[7:0];
					PosY		: IO_PosY_reg		<= avs_s0_writedata[7:0];
				endcase
			end
		else
			case(avs_s0_address[6:0])
				Counter 	: avs_s0_readdata_reg <= IO_Counter;
				PosX		: avs_s0_readdata_reg <= IO_PosX;
				PosY		: avs_s0_readdata_reg <= IO_PosY;
				ImagePixel_B : avs_s0_readdata_reg <= IO_ImagePixel_B_Out;
				ImagePixel_G : avs_s0_readdata_reg <= IO_ImagePixel_G_Out;
				ImagePixel_R : avs_s0_readdata_reg <= IO_ImagePixel_R_Out;
				default: avs_s0_readdata_reg <= avs_s0_address[7:0];
			endcase
			
		if(ins_irq0_irq && irq_count==1)
			avs_s0_waitrequest_reg <= 1'b0;;
		
		if(ins_irq0_irq)
			irq_count <= irq_count +1;
			
		if(irq_count==2)
		begin
			avs_s0_waitrequest_reg <= 1'b0;
			irq_count <= 2'b0;
		end
	end
	

endmodule
