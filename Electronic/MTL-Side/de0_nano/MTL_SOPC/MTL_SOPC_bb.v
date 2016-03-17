
module MTL_SOPC (
	clk_clk,
	from_key_export,
	maptransfer_map_map_line0,
	maptransfer_map_map_line1,
	maptransfer_map_map_line2,
	maptransfer_map_map_line3,
	maptransfer_map_map_line4,
	maptransfer_map_map_line5,
	maptransfer_map_map_line6,
	maptransfer_map_map_line7,
	mtl_interface_irq_0_mtl_interface_mtl_irq,
	mtl_interface_irq_0_mtl_interface_mtl_reset,
	mtl_interface_irq_0_mtl_interface_mtl_mode,
	mtl_interface_irq_0_mtl_interface_mtl_counter,
	reset_reset_n,
	testled_external_connection_export,
	touchdata_ext_export);	

	input		clk_clk;
	input		from_key_export;
	output	[15:0]	maptransfer_map_map_line0;
	output	[15:0]	maptransfer_map_map_line1;
	output	[15:0]	maptransfer_map_map_line2;
	output	[15:0]	maptransfer_map_map_line3;
	output	[15:0]	maptransfer_map_map_line4;
	output	[15:0]	maptransfer_map_map_line5;
	output	[15:0]	maptransfer_map_map_line6;
	output	[15:0]	maptransfer_map_map_line7;
	input		mtl_interface_irq_0_mtl_interface_mtl_irq;
	output		mtl_interface_irq_0_mtl_interface_mtl_reset;
	output	[3:0]	mtl_interface_irq_0_mtl_interface_mtl_mode;
	input	[31:0]	mtl_interface_irq_0_mtl_interface_mtl_counter;
	input		reset_reset_n;
	output	[3:0]	testled_external_connection_export;
	input	[19:0]	touchdata_ext_export;
endmodule
