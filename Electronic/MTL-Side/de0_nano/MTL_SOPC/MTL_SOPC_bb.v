
module MTL_SOPC (
	clk_clk,
	cyclonespi_0_spi_interface_Config,
	cyclonespi_0_spi_interface_SPI_CS,
	cyclonespi_0_spi_interface_SPI_SDI,
	cyclonespi_0_spi_interface_SPI_SDO,
	cyclonespi_0_spi_interface_SPI_clk,
	cyclonespi_0_spi_interface_data_out,
	cyclonespi_0_spi_interface_data_out_enable,
	cyclonespi_0_spi_interface_spi_irq,
	from_key_export,
	maptransfer_map_map_line0,
	maptransfer_map_map_line1,
	maptransfer_map_map_line2,
	maptransfer_map_map_line3,
	maptransfer_map_map_line4,
	maptransfer_map_map_line5,
	maptransfer_map_map_line6,
	maptransfer_map_map_line7,
	mtl_interface_irq_0_mtl_intreface_mtl_counter,
	mtl_interface_irq_0_mtl_intreface_mtl_irq,
	mtl_interface_irq_0_mtl_intreface_mtl_reset,
	mtl_interface_irq_0_mtl_intreface_mtl_mode,
	reset_reset_n,
	testled_external_connection_export,
	touchdata_ext_export,
	turn_ext_export);	

	input		clk_clk;
	output	[7:0]	cyclonespi_0_spi_interface_Config;
	input		cyclonespi_0_spi_interface_SPI_CS;
	input		cyclonespi_0_spi_interface_SPI_SDI;
	output		cyclonespi_0_spi_interface_SPI_SDO;
	input		cyclonespi_0_spi_interface_SPI_clk;
	output	[7:0]	cyclonespi_0_spi_interface_data_out;
	output		cyclonespi_0_spi_interface_data_out_enable;
	output		cyclonespi_0_spi_interface_spi_irq;
	input		from_key_export;
	output	[31:0]	maptransfer_map_map_line0;
	output	[31:0]	maptransfer_map_map_line1;
	output	[31:0]	maptransfer_map_map_line2;
	output	[31:0]	maptransfer_map_map_line3;
	output	[31:0]	maptransfer_map_map_line4;
	output	[31:0]	maptransfer_map_map_line5;
	output	[31:0]	maptransfer_map_map_line6;
	output	[31:0]	maptransfer_map_map_line7;
	input	[31:0]	mtl_interface_irq_0_mtl_intreface_mtl_counter;
	input		mtl_interface_irq_0_mtl_intreface_mtl_irq;
	output		mtl_interface_irq_0_mtl_intreface_mtl_reset;
	output	[3:0]	mtl_interface_irq_0_mtl_intreface_mtl_mode;
	input		reset_reset_n;
	output	[3:0]	testled_external_connection_export;
	input	[19:0]	touchdata_ext_export;
	output		turn_ext_export;
endmodule
