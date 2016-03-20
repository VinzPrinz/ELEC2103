
module DE0_Nano(

	//////////// CLOCK //////////
	CLOCK_50,

	//////////// LED //////////
	LED,

	//////////// KEY //////////
	KEY,

	//////////// SW //////////
	SW,

	//////////// SDRAM //////////
	DRAM_ADDR,
	DRAM_BA,
	DRAM_CAS_N,
	DRAM_CKE,
	DRAM_CLK,
	DRAM_CS_N,
	DRAM_DQ,
	DRAM_DQM,
	DRAM_RAS_N,
	DRAM_WE_N,
	
	//////////// ECPS //////////
	EPCS_ASDO,
	EPCS_DATA0,
	EPCS_DCLK,
	EPCS_NCSO,

	//////////// Accelerometer and EEPROM //////////
	G_SENSOR_CS_N,
	G_SENSOR_INT,
	I2C_SCLK,
	I2C_SDAT,

	//////////// ADC //////////
	ADC_CS_N,
	ADC_SADDR,
	ADC_SCLK,
	ADC_SDAT,

	//////////// 2x13 GPIO Header //////////
	GPIO_2,
	GPIO_2_IN,

	//////////// GPIO_0, GPIO_0 connect to GPIO Default //////////
	GPIO_0,
	GPIO_0_IN,
	
	//////////////  LCD LT24 to GPIO1 ////////////////
	LT24_ADC_BUSY,
	LT24_ADC_CS_N,
	LT24_ADC_DCLK,
	LT24_ADC_DIN,
	LT24_ADC_DOUT,
	LT24_ADC_PENIRQ_N,
	LT24_D,
	LT24_WR_N,
	LT24_RD_N,
	LT24_CS_N,
	LT24_RESET_N,
	LT24_RS,
	LT24_LCD_ON
);

//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================

//////////// CLOCK //////////
input 		          		CLOCK_50;

//////////// LED //////////
output		     [7:0]		LED;

//////////// KEY //////////
input 		     [1:0]		KEY;

//////////// SW //////////
input 		     [3:0]		SW;

//////////// SDRAM //////////
output		    [12:0]		DRAM_ADDR;
output		     [1:0]		DRAM_BA;
output		          		DRAM_CAS_N;
output		          		DRAM_CKE;
output		          		DRAM_CLK;
output		          		DRAM_CS_N;
inout 		    [15:0]		DRAM_DQ;
output		     [1:0]		DRAM_DQM;
output		          		DRAM_RAS_N;
output		          		DRAM_WE_N;

//////////// EPCS //////////
output		          		EPCS_ASDO;
input 		          		EPCS_DATA0;
output		          		EPCS_DCLK;
output		          		EPCS_NCSO;

//////////// Accelerometer and EEPROM //////////
output		          		G_SENSOR_CS_N;
input 		          		G_SENSOR_INT;
output							I2C_SCLK;
inout 		          		I2C_SDAT;

//////////// ADC //////////
output		          		ADC_CS_N;
output		          		ADC_SADDR;
output		          		ADC_SCLK;
input 		          		ADC_SDAT;

//////////// 2x13 GPIO Header //////////
inout 		    [12:0]		GPIO_2;
input 		     [2:0]		GPIO_2_IN;

//////////// GPIO_0, GPIO_0 connect to GPIO Default //////////
output 		    [33:0]		GPIO_0;
input 		     [1:0]		GPIO_0_IN;

//////////// GPIO_1 to LT24 //////////
output		          		LT24_ADC_CS_N;
output		          		LT24_ADC_DCLK;
output		          		LT24_ADC_DIN;
input		          		   LT24_ADC_BUSY;
input		          		   LT24_ADC_DOUT;
input		          		   LT24_ADC_PENIRQ_N;
output		    [15:0]		LT24_D;
output		          		LT24_WR_N;
output		          		LT24_RD_N;
output		         		LT24_CS_N;
output		         		LT24_RESET_N;
output		         		LT24_RS;
output		         		LT24_LCD_ON;

wire		          			LT24_ADC_CS_N_bus;
wire		          			LT24_ADC_DCLK_bus;
wire		          			LT24_ADC_DIN_bus;
wire		          			LT24_ADC_BUSY_bus;
wire	          		   	LT24_ADC_DOUT_bus;
wire	          		   	LT24_ADC_PENIRQ_N_bus;
wire		    	[15:0]		LT24_D_bus;
wire		          			LT24_WR_N_bus;
wire		          			LT24_RD_N_bus;
wire		         			LT24_CS_N_bus;
wire		         			LT24_RESET_N_bus;
wire		         			LT24_RS_bus;
wire  	         			LT24_LCD_ON_bus;


wire [11:0] pic_mem_s2_address;
wire        pic_mem_s2_chipselect; 
wire        pic_mem_s2_clken;     
wire        pic_mem_s2_write;          
wire [15:0] pic_mem_s2_readdata;    
wire [15:0] pic_mem_s2_writedata;           
wire [1:0]  pic_mem_s2_byteenable;

wire [12:0] background_mem_s2_address;                   
wire        background_mem_s2_chipselect;               
wire        background_mem_s2_clken;                     
wire        background_mem_s2_write;                    
wire [15:0] background_mem_s2_readdata;                 
wire [15:0] background_mem_s2_writedata;                
wire [1:0]  background_mem_s2_byteenable; 

wire 			lt24_buffer_flag;           

wire			LT24_finish;
wire [31:0]	LT24_counter , LT24_coin_x , LT24_coin_x0 , LT24_coin_y , LT24_coin_y0 , LT24_coin_vx0 , LT24_coin_vy0;
wire [11:0] LT24_pattern;
wire [31:0] VX , VY;

assign LED = LT24_coin_vx0[7:0];
//=======================================================
//  REG/WIRE declarations
//=======================================================

wire RST_N;

// NEW SPI signals

wire SPI_MISO, SPI_MOSI, SPI_CLK, SPI_SS;



//=======================================================
//   PIC32 Interface
//=======================================================

//--- Declarations --------------------------------------

logic	PIC32_SDO1A, PIC32_SDI1A, PIC32_SCK1A, PIC32_CS_FPGA;
logic	PIC32_INT1, PIC32_INT2;
logic	PIC32_C1TX, PIC32_C1RX;
logic	PIC32_SCL3A, PIC32_SDA3A;
logic	PIC32_RESET;

logic [7:0] Config;
logic [7:0] Status;
logic [7:0] Led70;
logic [7:0] IO_A_Data_In, IO_A_Data_Out, IO_A_Enable_Out;
logic [7:0] IO_B_Data_In, IO_B_Data_Out, IO_B_Enable_Out;
logic [7:0] IO_C_Data_In, IO_C_Data_Out, IO_C_Enable_Out;
logic [7:0] IO_D_Data_In, IO_D_Data_Out, IO_D_Enable_Out;

genvar i;

//---- Assign GPIO_2 Header (connected to PIC32) --------

assign PIC32_SDO1A	= GPIO_2[0];
assign GPIO_2[1]		= PIC32_CS_FPGA ? 1'bz : PIC32_SDI1A;
assign PIC32_SCK1A	= GPIO_2[2];
assign PIC32_CS_FPGA	= GPIO_2[3];

//assign GPIO_2[4]     = PIC32_INT1;
assign GPIO_2[5]     = PIC32_INT2;

assign PIC32_C1TX		= GPIO_2[6];
assign GPIO_2[7]		= Config[6] ? PIC32_C1RX : 1'bz;

assign PIC32_SCL3A	= GPIO_2[8];
assign PIC32_SDA3A	= GPIO_2[9];

//assign PIC32_RESET	= GPIO_2[10];
assign PIC32_RESET	= ~KEY[0];



//--- Assign Status, INT, Led70 -------------------------

logic [7:0] theLED7;  // the Led controlled by MyMips

assign PIC32_INT1 = Config[0] ? KEY[0] : 1'b1;
assign PIC32_INT2 = Config[1] ? KEY[1] : 1'b1;

always @ (posedge CLOCK_50)
	Status = {SW, 2'b00, KEY};


//=======================================================
//  Structural coding
//=======================================================

assign RST_N       = KEY[1];
assign LT24_LCD_ON = 1'b1; //default on

wire pll_clk;

sdram_pll lol (
	.inclk0(CLOCK_50),
	.c0(pll_clk));

assign DRAM_CLK = pll_clk;


DE0_LT24_SOPC DE0_LT24_SOPC_inst(
		.clk_clk(CLOCK_50),          							//        clk.clk
		.reset_reset_n(RST_N),    								//      reset.reset_n
		
		// KEY
		.from_key_export(KEY[0]),  							//   from_key.export
		
		// LEDS
		.to_led_export(),                 				//   to_led.export
		
		// LT24 - LCD
		.lt24_conduit_cs(LT24_CS_N_bus),      					//  lt24_conduit.cs
		.lt24_conduit_rs(LT24_RS_bus),     						//              .rs
		.lt24_conduit_rd(LT24_RD_N_bus),      					//              .rd
		.lt24_conduit_wr(LT24_WR_N_bus),      					//              .wr
		.lt24_conduit_data(LT24_D_bus),    	   				//              .data
		.lt24_lcd_rstn_export(LT24_RESET_N_bus),				//       lt24_lcd_rstn.export
		
		// LT24 - TOUCH
		.lt24_touch_spi_MISO(LT24_ADC_DOUT_bus),        		//      lt24_touch_spi.MISO
		.lt24_touch_spi_MOSI(LT24_ADC_DIN_bus),        		//                    .MOSI
		.lt24_touch_spi_SCLK(LT24_ADC_DCLK_bus),        		//                    .SCLK
		.lt24_touch_spi_SS_n(LT24_ADC_CS_N_bus),       		//                    .SS_n
		.lt24_touch_penirq_n_export(LT24_ADC_PENIRQ_N_bus), // lt24_touch_penirq_n.export
		.lt24_touch_busy_export(LT24_ADC_BUSY_bus),         //           lt24_touch_busy.export
		
		// PLL
		.alt_pll_c4_conduit_export(),        				//        alt_pll_c4_conduit.export
		.alt_pll_c3_conduit_export(),        				//        alt_pll_c3_conduit.export
		.alt_pll_areset_conduit_export(),    				//    alt_pll_areset_conduit.export
		.alt_pll_locked_conduit_export(),    				//    alt_pll_locked_conduit.export
		.alt_pll_phasedone_conduit_export(),  				// alt_pll_phasedone_conduit.export
		.alt_pll_c1_clk(),                      //                alt_pll_c1.clk  
		
		.pic_mem_s2_address(pic_mem_s2_address),               //                pic_mem_s2.address
		.pic_mem_s2_chipselect(pic_mem_s2_chipselect),            //                          .chipselect
		.pic_mem_s2_clken(pic_mem_s2_clken),                 //                          .clken
		.pic_mem_s2_write(pic_mem_s2_write),                 //                          .write
		.pic_mem_s2_readdata(pic_mem_s2_readdata),              //                          .readdata
		.pic_mem_s2_writedata(pic_mem_s2_writedata),             //                          .writedata
		.pic_mem_s2_byteenable(pic_mem_s2_byteenable),            //                          .byteenable
		
		.lt24_buffer_flag_external_connection_export(lt24_buffer_flag),
		
		.background_mem_s2_address(background_mem_s2_address),                   
		.background_mem_s2_chipselect(background_mem_s2_chipselect),                
		.background_mem_s2_clken(background_mem_s2_clken),                     
		.background_mem_s2_write(background_mem_s2_write),                     
		.background_mem_s2_readdata(background_mem_s2_readdata),                  
		.background_mem_s2_writedata(background_mem_s2_writedata),                 
		.background_mem_s2_byteenable(background_mem_s2_byteenable),
		
		// NEW FOR SPI
		.cyclonespi_spi_interface_SPI_clk(PIC32_SCK1A),            //             cyclonespi_spi_interface.SPI_clk
		.cyclonespi_spi_interface_SPI_CS(PIC32_CS_FPGA),             //                                     .SPI_CS
		.cyclonespi_spi_interface_SPI_SDI(PIC32_SDO1A),            //                                     .SPI_SDI
		.cyclonespi_spi_interface_SPI_SDO(PIC32_SDI1A),            //                                     .SPI_SDO
		.cyclonespi_spi_interface_data_out(),           //                                     .data_out
		.cyclonespi_spi_interface_data_out_enable(IO_A_Enable_Out),     //                                     .data_out_enable
		.cyclonespi_spi_interface_config(Config),
		.cyclonespi_spi_interface_spi_irq(GPIO_2[4]),
		
		.lt24_conduit_0_finish_flag           (LT24_finish),           //         lt24_interface_0_conduit_end.done
		.lt24_conduit_0_pattern              (LT24_pattern),              //                                     .a
		.lt24_conduit_0_counter         (LT24_counter),          //                                     .result
		.lt24_conduit_0_vx     (VX),                           //                                     .vx
		.lt24_conduit_0_vy	(VY),
		.lt24_conduit_0_lt24_coin_x0                 (LT24_coin_x0),                 //                                     .lt24_coin_x0
		.lt24_conduit_0_lt42_coin_y0                 (LT24_coin_y0),                 //                                     .lt42_coin_y0
		.lt24_conduit_0_lt24_coinx                   (LT24_coin_x),                   //                                     .lt24_coinx
		.lt24_conduit_0_lt24_coin_y                  (LT24_coin_y),                  //                                     .lt24_coin_y
		.lt24_conduit_0_lt24_coin_vx0                (LT24_coin_vx0),                //                                     .lt24_coin_vx0
		.lt24_conduit_0_lt24_coin_vy0                (LT24_coin_vy0),                //                                     .lt24_coin_vy0


		.gsensor_int_external_connection_export (G_SENSOR_INT), // gsensor_init_external_connection.export
		.gsensor_spi_conduit_end_SDIO            (I2C_SDAT),            //          gsensor_spi_conduit_end.SDIO
		.gsensor_spi_conduit_end_SCLK            (I2C_SCLK),            //                                 .SCLK
		.gsensor_spi_conduit_end_CS_n            (G_SENSOR_CS_N), 
		
		.sdram_controler_wire_addr                   (DRAM_ADDR),//                 sdram_controler_wire.addr
		.sdram_controler_wire_ba                     (DRAM_BA),                     //                                     .ba
		.sdram_controler_wire_cas_n                  (DRAM_CAS_N),                  //                                     .cas_n
		.sdram_controler_wire_cke                    (DRAM_CKE),                    //                                     .cke
		.sdram_controler_wire_cs_n                   (DRAM_CS_N),                   //                                     .cs_n
		.sdram_controler_wire_dq                     (DRAM_DQ),                     //                                     .dq
		.sdram_controler_wire_dqm                    (DRAM_DQM),                    //                                     .dqm
		.sdram_controler_wire_ras_n                  (DRAM_RAS_N),                  //                                     .ras_n
		.sdram_controler_wire_we_n                   (DRAM_WE_N)
	);
	
	
	LT24_buffer lt24_buf(
		.clk(CLOCK_50),          							
		.rst_n(RST_N),
		.LT24_ADC_BUSY_bus(LT24_ADC_BUSY_bus),
		.LT24_ADC_CS_N_bus(LT24_ADC_CS_N_bus),
		.LT24_ADC_DCLK_bus(LT24_ADC_DCLK_bus),
		.LT24_ADC_DIN_bus(LT24_ADC_DIN_bus),
		.LT24_ADC_DOUT_bus(LT24_ADC_DOUT_bus),
		.LT24_ADC_PENIRQ_N_bus(LT24_ADC_PENIRQ_N_bus),
		.LT24_D_bus(LT24_D_bus),
		.LT24_WR_N_bus(LT24_WR_N_bus),
		.LT24_RD_N_bus(LT24_RD_N_bus),
		.LT24_CS_N_bus(LT24_CS_N_bus),
		.LT24_RESET_N_bus(LT24_RESET_N_bus),
		.LT24_RS_bus(LT24_RS_bus),
		
		.LT24_ADC_BUSY_screen(LT24_ADC_BUSY),
		.LT24_ADC_CS_N_screen(LT24_ADC_CS_N),
		.LT24_ADC_DCLK_screen(LT24_ADC_DCLK),
		.LT24_ADC_DIN_screen(LT24_ADC_DIN),
		.LT24_ADC_DOUT_screen(LT24_ADC_DOUT),
		.LT24_ADC_PENIRQ_N_screen(LT24_ADC_PENIRQ_N),
		.LT24_D_screen(LT24_D),
		.LT24_WR_N_screen(LT24_WR_N),
		.LT24_RD_N_screen(LT24_RD_N),
		.LT24_CS_N_screen(LT24_CS_N),
		.LT24_RESET_N_screen(LT24_RESET_N),
		.LT24_RS_screen(LT24_RS),
		
		.pic_mem_s2_address(pic_mem_s2_address),             //                pic_mem_s2.address
		.pic_mem_s2_chipselect(pic_mem_s2_chipselect),       //                .chipselect
		.pic_mem_s2_clken(pic_mem_s2_clken),                 //                .clken
		.pic_mem_s2_write(pic_mem_s2_write),                 //                          .write
		.pic_mem_s2_readdata(pic_mem_s2_readdata),           //                          .readdata
		.pic_mem_s2_writedata(pic_mem_s2_writedata),         //                          .writedata
		.pic_mem_s2_byteenable(pic_mem_s2_byteenable),       //                          .byteenable
		
		.lt24_buffer_flag(lt24_buffer_flag),
		
		.background_mem_s2_address(background_mem_s2_address),                   
		.background_mem_s2_chipselect(background_mem_s2_chipselect),                
		.background_mem_s2_clken(background_mem_s2_clken),                     
		.background_mem_s2_write(background_mem_s2_write),                     
		.background_mem_s2_readdata(background_mem_s2_readdata),                  
		.background_mem_s2_writedata(background_mem_s2_writedata),                 
		.background_mem_s2_byteenable(background_mem_s2_byteenable),
		
		.lt24_finish(LT24_finish),
		.lt24_pattern(LT24_pattern),
		.lt24_counter(LT24_counter),
		.VX(VX),
		.VY(VY),
		.lt24_coin_x(LT24_coin_x),
		.lt24_coin_y(LT24_coin_y),
		.lt24_coin_x0(LT24_coin_x0),
		.lt24_coin_y0(LT24_coin_y0),
		.lt24_coin_vx0(LT24_coin_vx0),
		.lt24_coin_vy0(LT24_coin_vy0)
	);
	
				 
endmodule
