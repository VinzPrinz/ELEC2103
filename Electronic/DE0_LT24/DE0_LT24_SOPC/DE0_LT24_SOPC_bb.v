
module DE0_LT24_SOPC (
	alt_pll_areset_conduit_export,
	alt_pll_c1_clk,
	alt_pll_c3_clk,
	alt_pll_locked_conduit_export,
	alt_pll_phasedone_conduit_export,
	background_mem_s2_address,
	background_mem_s2_chipselect,
	background_mem_s2_clken,
	background_mem_s2_write,
	background_mem_s2_readdata,
	background_mem_s2_writedata,
	background_mem_s2_byteenable,
	clk_clk,
	cyclonespi_spi_interface_SPI_clk,
	cyclonespi_spi_interface_SPI_CS,
	cyclonespi_spi_interface_SPI_SDI,
	cyclonespi_spi_interface_SPI_SDO,
	cyclonespi_spi_interface_data_out,
	cyclonespi_spi_interface_data_out_enable,
	cyclonespi_spi_interface_config,
	cyclonespi_spi_interface_spi_irq,
	from_key_export,
	gsensor_int_external_connection_export,
	gsensor_spi_conduit_end_SDIO,
	gsensor_spi_conduit_end_SCLK,
	gsensor_spi_conduit_end_CS_n,
	lt24_buffer_flag_external_connection_export,
	lt24_conduit_cs,
	lt24_conduit_rs,
	lt24_conduit_rd,
	lt24_conduit_wr,
	lt24_conduit_data,
	lt24_conduit_1_finish_flag,
	lt24_conduit_1_counter,
	lt24_conduit_1_pattern,
	lt24_conduit_1_vx,
	lt24_conduit_1_vy,
	lt24_conduit_1_lt24_coin_x0,
	lt24_conduit_1_lt42_coin_y0,
	lt24_conduit_1_lt24_coinx,
	lt24_conduit_1_lt24_coin_y,
	lt24_conduit_1_lt24_coin_vx0,
	lt24_conduit_1_lt24_coin_vy0,
	lt24_conduit_1_lt24_pattern_0,
	lt24_lcd_rstn_export,
	lt24_touch_busy_export,
	lt24_touch_penirq_n_export,
	lt24_touch_spi_MISO,
	lt24_touch_spi_MOSI,
	lt24_touch_spi_SCLK,
	lt24_touch_spi_SS_n,
	pic_mem_s2_address,
	pic_mem_s2_chipselect,
	pic_mem_s2_clken,
	pic_mem_s2_write,
	pic_mem_s2_readdata,
	pic_mem_s2_writedata,
	pic_mem_s2_byteenable,
	reset_reset_n,
	sdram_controler_wire_addr,
	sdram_controler_wire_ba,
	sdram_controler_wire_cas_n,
	sdram_controler_wire_cke,
	sdram_controler_wire_cs_n,
	sdram_controler_wire_dq,
	sdram_controler_wire_dqm,
	sdram_controler_wire_ras_n,
	sdram_controler_wire_we_n,
	snake_mem_address,
	snake_mem_chipselect,
	snake_mem_clken,
	snake_mem_write,
	snake_mem_readdata,
	snake_mem_writedata,
	to_led_export);	

	input		alt_pll_areset_conduit_export;
	output		alt_pll_c1_clk;
	output		alt_pll_c3_clk;
	output		alt_pll_locked_conduit_export;
	output		alt_pll_phasedone_conduit_export;
	input	[12:0]	background_mem_s2_address;
	input		background_mem_s2_chipselect;
	input		background_mem_s2_clken;
	input		background_mem_s2_write;
	output	[15:0]	background_mem_s2_readdata;
	input	[15:0]	background_mem_s2_writedata;
	input	[1:0]	background_mem_s2_byteenable;
	input		clk_clk;
	input		cyclonespi_spi_interface_SPI_clk;
	input		cyclonespi_spi_interface_SPI_CS;
	input		cyclonespi_spi_interface_SPI_SDI;
	output		cyclonespi_spi_interface_SPI_SDO;
	output	[7:0]	cyclonespi_spi_interface_data_out;
	output		cyclonespi_spi_interface_data_out_enable;
	output	[7:0]	cyclonespi_spi_interface_config;
	output		cyclonespi_spi_interface_spi_irq;
	input		from_key_export;
	input		gsensor_int_external_connection_export;
	inout		gsensor_spi_conduit_end_SDIO;
	output		gsensor_spi_conduit_end_SCLK;
	output		gsensor_spi_conduit_end_CS_n;
	output		lt24_buffer_flag_external_connection_export;
	output		lt24_conduit_cs;
	output		lt24_conduit_rs;
	output		lt24_conduit_rd;
	output		lt24_conduit_wr;
	output	[15:0]	lt24_conduit_data;
	input		lt24_conduit_1_finish_flag;
	input	[31:0]	lt24_conduit_1_counter;
	output	[11:0]	lt24_conduit_1_pattern;
	output	[31:0]	lt24_conduit_1_vx;
	output	[31:0]	lt24_conduit_1_vy;
	output	[31:0]	lt24_conduit_1_lt24_coin_x0;
	output	[31:0]	lt24_conduit_1_lt42_coin_y0;
	input	[31:0]	lt24_conduit_1_lt24_coinx;
	input	[31:0]	lt24_conduit_1_lt24_coin_y;
	output	[31:0]	lt24_conduit_1_lt24_coin_vx0;
	output	[31:0]	lt24_conduit_1_lt24_coin_vy0;
	output	[11:0]	lt24_conduit_1_lt24_pattern_0;
	output		lt24_lcd_rstn_export;
	input		lt24_touch_busy_export;
	input		lt24_touch_penirq_n_export;
	input		lt24_touch_spi_MISO;
	output		lt24_touch_spi_MOSI;
	output		lt24_touch_spi_SCLK;
	output		lt24_touch_spi_SS_n;
	input	[8:0]	pic_mem_s2_address;
	input		pic_mem_s2_chipselect;
	input		pic_mem_s2_clken;
	input		pic_mem_s2_write;
	output	[15:0]	pic_mem_s2_readdata;
	input	[15:0]	pic_mem_s2_writedata;
	input	[1:0]	pic_mem_s2_byteenable;
	input		reset_reset_n;
	output	[12:0]	sdram_controler_wire_addr;
	output	[1:0]	sdram_controler_wire_ba;
	output		sdram_controler_wire_cas_n;
	output		sdram_controler_wire_cke;
	output		sdram_controler_wire_cs_n;
	inout	[15:0]	sdram_controler_wire_dq;
	output	[1:0]	sdram_controler_wire_dqm;
	output		sdram_controler_wire_ras_n;
	output		sdram_controler_wire_we_n;
	input	[9:0]	snake_mem_address;
	input		snake_mem_chipselect;
	input		snake_mem_clken;
	input		snake_mem_write;
	output	[7:0]	snake_mem_readdata;
	input	[7:0]	snake_mem_writedata;
	output	[7:0]	to_led_export;
endmodule
