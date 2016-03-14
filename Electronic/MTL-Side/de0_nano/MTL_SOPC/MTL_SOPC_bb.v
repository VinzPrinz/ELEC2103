
module MTL_SOPC (
	clk_clk,
	from_key_export,
	reset_reset_n,
	testled_external_connection_export,
	touchdata_ext_export);	

	input		clk_clk;
	input		from_key_export;
	input		reset_reset_n;
	output	[3:0]	testled_external_connection_export;
	input	[19:0]	touchdata_ext_export;
endmodule
