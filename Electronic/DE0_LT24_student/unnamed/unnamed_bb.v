
module unnamed (
	clk,
	reset,
	SPI_clk,
	SPI_CS,
	SPI_SDI,
	SPI_SDO,
	data_out,
	data_out_enable,
	avs_s0_address,
	avs_s0_read,
	avs_s0_readdata,
	avs_s0_write,
	avs_s0_writedata,
	avs_s0_waitrequest,
	ins_irq0_irq);	

	input		clk;
	input		reset;
	input		SPI_clk;
	input		SPI_CS;
	input		SPI_SDI;
	output		SPI_SDO;
	output	[7:0]	data_out;
	output		data_out_enable;
	input	[7:0]	avs_s0_address;
	input		avs_s0_read;
	output	[31:0]	avs_s0_readdata;
	input		avs_s0_write;
	input	[31:0]	avs_s0_writedata;
	output		avs_s0_waitrequest;
	output		ins_irq0_irq;
endmodule
