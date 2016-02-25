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
	
	logic [7:0] theStatus;
	MySPI SPI_inst (
	.theClock(clk), .theReset(reset),
	.MySPI_clk(SPI_clk), .MySPI_cs(SPI_CS), .MySPI_sdi(SPI_SDI),
	.MySPI_sdo(SPI_SDO),
	.Config(Config),
	.Status(theStatus),
	.Led70(),
	.IO_A_Data_In(data_to_send),
	.IO_B_Data_In(8'b01010101),
	.IO_C_Data_In(8'b01010101),
	.IO_D_Data_In(8'b01010101),
	.IO_A_Data_Out(data_out), 
	.IO_B_Data_Out(), 
	.IO_C_Data_Out(), 
	.IO_D_Data_Out(),
	.IO_A_Enable_Out(data_out_enable),
	.IO_B_Enable_Out(),
	.IO_C_Enable_Out(),
	.IO_D_Enable_Out()
);
	reg 	[31:0] avs_s0_readdata_reg;
	assign avs_s0_readdata = avs_s0_readdata_reg;
	reg 	[7:0] data_to_send;

	assign avs_s0_waitrequest = 1'b0;

	assign ins_irq0_irq = 1'b0;
	assign spi_irq = avs_s0_write;
	
	always @(posedge clk)begin
		if(avs_s0_read)begin
			avs_s0_readdata_reg <= {24'b0 , data_out};
		end
		if(avs_s0_write)
			data_to_send <= avs_s0_writedata[7:0];
	end
	

endmodule
