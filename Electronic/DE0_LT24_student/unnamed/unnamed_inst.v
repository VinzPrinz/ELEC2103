	unnamed u0 (
		.clk                (<connected-to-clk>),                //    clock_sink.clk
		.reset              (<connected-to-reset>),              //    reset_sink.reset
		.SPI_clk            (<connected-to-SPI_clk>),            // SPI_interface.SPI_clk
		.SPI_CS             (<connected-to-SPI_CS>),             //              .SPI_CS
		.SPI_SDI            (<connected-to-SPI_SDI>),            //              .SPI_SDI
		.SPI_SDO            (<connected-to-SPI_SDO>),            //              .SPI_SDO
		.data_out           (<connected-to-data_out>),           //              .data_out
		.data_out_enable    (<connected-to-data_out_enable>),    //              .data_out_enable
		.avs_s0_address     (<connected-to-avs_s0_address>),     //        avs_s0.address
		.avs_s0_read        (<connected-to-avs_s0_read>),        //              .read
		.avs_s0_readdata    (<connected-to-avs_s0_readdata>),    //              .readdata
		.avs_s0_write       (<connected-to-avs_s0_write>),       //              .write
		.avs_s0_writedata   (<connected-to-avs_s0_writedata>),   //              .writedata
		.avs_s0_waitrequest (<connected-to-avs_s0_waitrequest>), //              .waitrequest
		.ins_irq0_irq       (<connected-to-ins_irq0_irq>)        //      ins_irq0.irq
	);

