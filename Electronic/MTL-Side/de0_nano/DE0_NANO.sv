
/*
 * This file contains the instantiation of the main module for the DE0-Nano board.
 * 
 * It contains a hardware controller to load a slideshow on the SDRAM and display it to the MTL screen.
 * It will receive data via SPI from the MyPic32 board, where BMP files are acquired from an SD Card.
 *
 * Be careful: this controller is intended to work ONLY with 24-bit BMP files with images of 800x480 size.
 * With any other file format, the controller won't work properly.
 * You can however easily extend the controller to any image size by getting more information from the PIC,
 * via SPI, about the BMP files.
 */


module DE0_NANO(

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

	//////////// EPCS //////////
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

	//////////// GPIO_0, GPIO_0 connects to GPIO Default //////////
	GPIO_0,
	GPIO_0_IN,

	//////////// GPIO_1, GPIO_1 connects to the MTL Screen //////////
	MTL_DCLK,
	MTL_HSD,
	MTL_VSD,
	MTL_TOUCH_I2C_SCL,
	MTL_TOUCH_I2C_SDA,
	MTL_TOUCH_INT_n,
	MTL_R,
	MTL_G,
	MTL_B
);

//=======================================================
//  PARAMETER declarations
//=======================================================

//Parameters for the SDRAM Controller
parameter	WR_LENGTH            =	9'h2;
parameter	RD_LENGTH            =	9'h80; /// ???? 9'f80
parameter	RANGE_ADDR_IMG			=  23'd768000;

//- WR_LENGTH is 2 for writing pixel per pixel as soon as one is received via SPI
//				 (it accounts for the fact that the SDRAM has a 16-bit bus and not 32-bit,
//				  please refer to the introductory slides).
//- RD_LENGTH is a high number for acquiring sufficient data from the SDRAM and
//				  storing it in the read FIFO in advance, enough data will then be
//				  available at each clock cycle of CLOCK_33 to update the screen.
//- RANGE_ADDR_IMG is equal to 480x800 times 2 (again for 32-bit vs 16-bit bus).

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
output		          		I2C_SCLK;
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
inout 		    [33:0]		GPIO_0;
input 		     [1:0]		GPIO_0_IN;

//////////// GPIO_1, GPIO_1 connect to the MTL Screen //////////
output							MTL_DCLK;
output							MTL_HSD;
output							MTL_VSD;
output							MTL_TOUCH_I2C_SCL;
inout								MTL_TOUCH_I2C_SDA;
input								MTL_TOUCH_INT_n;
output			  [7:0]		MTL_R;
output			  [7:0]		MTL_G;
output			  [7:0]		MTL_B;


// ----------------- draw type register ----------------
// values and meanings :
// 00 -> draw background
// 01 -> draw rectangle in middle of the screen
logic [7:0] reg_draw_type;


//=======================================================
//   PIC32 Interface
//=======================================================

//--- Declarations --------------------------------------

logic	PIC32_SDO1A, PIC32_SDI1A, PIC32_SCK1A, PIC32_CS_FPGA;
logic	PIC32_INT1, PIC32_INT2;
logic	PIC32_RESET;

logic [7:0] Config;
logic [7:0] Status;
logic [7:0] Led70;
logic [7:0] Red;
logic [7:0] Green;
logic [7:0] Blue;
logic [7:0] ImgNum;
logic			Trigger;

//---- Assign GPIO_2 Header (connected to PIC32) -------

//SPI:
assign PIC32_SDO1A	= GPIO_2[0];  //What the PIC sends to the FPGA
assign GPIO_2[1]		= PIC32_CS_FPGA ? 1'bz : PIC32_SDI1A; //What the FPGA sends back to the PIC
assign PIC32_SCK1A	= GPIO_2[2];  //Comes from master PIC clock
assign PIC32_CS_FPGA	= GPIO_2[3];  //Assigned to CS_FPGA from the PIC

//Interrupts:
assign GPIO_2[4]     = PIC32_INT1;
assign GPIO_2[5]     = PIC32_INT2;

//Reset button:
assign PIC32_RESET	= GPIO_2[10];

//--- Assign Status, INT, Led70 -------------------------

//assign LED[7:0] = Led70[7:0];
//assign LED[3] = loading;
//assign LED[5:4] = {2{newFrame}};
//assign LED[7:6] = {2{reg_draw_type[1]}};



assign PIC32_INT1 = Config[0] ? KEY[0] : 1'b1;
assign PIC32_INT2 = Config[1] ? KEY[1] : 1'b1;

always @ (posedge CLOCK_50)
	Status = {SW, 2'b00, KEY};

//---- 8-bit SPI Interface ------------------------------

logic sdram_write_load;
 
// new register to send gestures
logic [7:0] gestureInfo;
logic isTouchedBuff;
//assign gestureInfo[7] = touch_ready; // MSB = new data
hold_buffer	hold_buffer_tchrdy (
	.clk (CLOCK_50),
	.rst (dly_rst),
	.trigger (touch_ready),
	.pulse (isTouchedBuff)
);

assign gestureInfo[7] = isTouchedBuff;
gestureMapping theGestureMapping(.inGesture(reg_gesture),.outGesture(gestureInfo[6:4])); // map gesture to 3 bits only 
assign gestureInfo[3:2] = reg_x1[9:8];
assign gestureInfo[1] = reg_y1[8];
assign gestureInfo[0] = 1'b0;


/*
 * - Red contains the red data (1 byte) of the current pixel.
 * - Similarly, Green and Blue contain the green and blue data of the current pixel.
 * - ImgNum is the number of images that will be loaded, so one knows the total
 *          number of pixels to wait for.
 * - Trigger is a 1-cycle pulse that happens each time a whole pixel has been
 *           received, so each time the blue data has been received (the PIC sends
 *				 red, then green, then blue data).
 *           Trigger enables writing the pixel to the SDRAM.
 */


MySPI MySPI_instance (
	.theClock(CLOCK_50), .theReset(PIC32_RESET),
	.MySPI_clk(PIC32_SCK1A), .MySPI_cs(PIC32_CS_FPGA), .MySPI_sdi(PIC32_SDO1A), .MySPI_sdo(PIC32_SDI1A),
	.Config(Config),
	.Status(Status),
	.Led70(Led70),
	.Red(Red),
	.Green(Green),
	.Blue(Blue),
	.ImgNum(ImgNum),
	.Trigger(Trigger),
	
	.reg_gesture(gestureInfo),
	.reg_xpos(reg_x1[7:0]),
	.reg_ypos(reg_y1[7:0]),
	
	.draw_type(reg_draw_type),
	.sdram_write_load(sdram_write_load)
);

// ========================================================
//   SOPC INSTANTION !! - see Qsys file
// ========================================================

wire [3:0] mtl_mode;
wire [31:0] mtl_counter;
wire mtl_reset , mtl_irq;

logic [127:0] map;

	MTL_SOPC u0 (
		.clk_clk                            (CLOCK_50),
		.from_key_export                    (KEY[1]),
		.reset_reset_n                      (KEY[0]),
		.testled_external_connection_export (LED[3:0]),
		.touchdata_ext_export               ({reg_x1,reg_y1,isTouchedBuff}),
		
		.maptransfer_map_map_line0              (map[15:0]),
		.maptransfer_map_map_line1              (map[31:16]),
		.maptransfer_map_map_line2              (map[47:32]),
		.maptransfer_map_map_line3              (map[63:48]),
		.maptransfer_map_map_line4              (map[79:64]),
		.maptransfer_map_map_line5              (map[95:80]),
		.maptransfer_map_map_line6              (map[111:96]),
		.maptransfer_map_map_line7              (map[127:112]),
		
		.mtl_interface_irq_0_mtl_interface_mtl_irq     (mtl_irq),     // mtl_interface_irq_0_mtl_interface.mtl_irq
		.mtl_interface_irq_0_mtl_interface_mtl_reset   (mtl_reset),   //                                  .mtl_reset
		.mtl_interface_irq_0_mtl_interface_mtl_mode    (mtl_mode),    //                                  .mtl_mode
		.mtl_interface_irq_0_mtl_interface_mtl_counter (mtl_counter)  //                                  .mtl_counter
	);








//=======================================================
//   MTL - Display and Touch Controls
//=======================================================

//--- PLL's ---------------------------------------------

logic CLOCK_33, iCLOCK_33, CLOCK_100, iCLOCK_100;

//This PLL generates 33 MHz for the LCD screen.
//CLOCK_33 is used to generate the controls while iCLOCK_33
//is connected to the screen. Its phase is 120 so as to
//meet the setup and hold timing constraints of the screen.
MTL_PLL	MTL_PLL_inst (
	.inclk0 (CLOCK_50),
	.c0 (CLOCK_33),			//33MHz clock, phi=0
	.c1 (iCLOCK_33)			//33MHz clock, phi=120
);

//This PLL generates 100 MHz for the SDRAM.
//CLOCK_100 used to generate the controls while iCLOCK_100
//is connected to the SDRAM. Its phase is -108 so as to
//meet the setup and hold timing constraints of the SDRAM.
RAM_PLL	RAM_PLL_inst (
	.inclk0 (CLOCK_50),
	.c0 (CLOCK_100),			//100MHz clock, phi=0
	.c1 (iCLOCK_100)			//100MHz clock, phi=-108
);

/*
 * Note: a critical warning is generated for the MTL_PLL:
 * "input clock is not fully compensated because it is fed by
 * a remote clock pin". In fact, each PLL can compensate the
 * input clock on a set of dedicated pins.
 * The input clock CLOCK_50 should be available on other pins
 * than PIN_R8 so that it can be compensated on each PLL, it is
 * not the case in the DE0-Nano board.
 * Hopefully, it is not important here.
 *
 * You might as well see three other critical warnings about 
 * timing requirements. They are about communication between 
 * CLOCK_50 and CLOCK_33. It is impossible to completely get 
 * rid of them. They can be safely ignored as they aren't
 * related to signals whose timing is critical.
 */ 
 
 
//--- Reset module --------------------------------------
 
logic dly_rstn, rd_rst, dly_rst;

// A good synchronization of all the resets of the different
// components must be carried out. Otherwise, some random bugs
// risk to appear after a reset of the system (see definition
// of the module at the end of this file).
reset_delay	reset_delay_inst (		
	.iRSTN(~PIC32_RESET),
   .iCLK(CLOCK_50),
	.oRSTN(dly_rstn),
	.oRD_RST(rd_rst),
	.oRST(dly_rst)
);

// Drawing controller 
logic [23:0] base_wr_addr, max_wr_addr;
choose_draw_action choose_draw_action_inst(
					.drawreg(reg_draw_type),
					.base_wr_addr(base_wr_addr),
					.max_wr_addr(max_wr_addr));

//--- SDRAM Controller ----------------------------------

logic [31:0] read_data;
logic 		 read_en;
logic [23:0] base_read_addr, max_read_addr;
logic [4:0]  current_img;
logic			 load_new;
logic	[31:0] counter_pix;

// Here is the SDRAM controller.
// If you take a look at the introductory slides,
// its instantiation should be quite self-explaining.
// Note that the long code of the controller itself has not been
// commented in details, knowing the interface is sufficient.
sdram_control     sdram_control_inst (	
   //	HOST Side						
   .RESET_N(dly_rstn),
   .CLK(CLOCK_100),
   //	FIFO Write Side 1
	.WR1_DATA({8'b0, Red, Green, Blue}),
	.WR1(Trigger),
	//.WR1_ADDR(0),
	//.WR1_MAX_ADDR(ImgNum*RANGE_ADDR_IMG),
	.WR1_ADDR(base_wr_addr),
	.WR1_MAX_ADDR(max_wr_addr),
	.WR1_LENGTH(WR_LENGTH),
	.WR1_LOAD(!dly_rstn || sdram_write_load),
	.WR1_CLK(~CLOCK_50),
	//	FIFO Read Side 1
	.RD1_DATA(read_data),
	.RD1(read_en),
	.RD1_ADDR(base_read_addr),
	.RD1_MAX_ADDR(max_read_addr),
	.RD1_LENGTH(RD_LENGTH),
	.RD1_LOAD(!dly_rstn || rd_rst || load_new),
	.RD1_CLK(CLOCK_33),
   //	SDRAM Side
   .SA(DRAM_ADDR),
   .BA(DRAM_BA),
   .CS_N(DRAM_CS_N),
   .CKE(DRAM_CKE),
   .RAS_N(DRAM_RAS_N),
   .CAS_N(DRAM_CAS_N),
   .WE_N(DRAM_WE_N),
   .DQ(DRAM_DQ),
   .DQM(DRAM_DQM)
);

assign DRAM_CLK = iCLOCK_100;

/*
 * Some signals for the controller are generated here.
 * One should be careful with the clock domains and not
 * mix everything.
 */
 
// This always block counts the number of pixels received
// from SPI and is synchronous with it.
// When all the images will have been acquired, it will 
// listen to the (buffered) touch controller signals so
// as to switch images when required by the user.
always_ff @(posedge CLOCK_50) begin

	if (PIC32_RESET) begin
		current_img <= 5'b0;
		counter_pix <= 32'b0;
	end else begin
	
		if (Trigger)
			counter_pix <= counter_pix + 32'b1;
		
		//if ((ImgNum > 0) && (counter_pix == (ImgNum*(32'd384000))))  
		if ((ImgNum > 0) && (counter_pix == (max_wr_addr-base_wr_addr)/2))
			if (pulse_e)
				if (current_img == 5'b0)
					current_img <= ImgNum[4:0] - 5'b1;
				else
					current_img <= current_img - 5'b1;
			else if (pulse_w)
				if (current_img == (ImgNum[4:0] - 5'b1))
					current_img <= 5'b0;
				else
					current_img <= current_img + 5'b1;
					
	end
end

// --------------------------- MAP CONTROLLER ---------------------------------------
// signals
logic tileLoad; // load signal to update the read addresses when we come in a new tileLoad
logic [23:0] map_base_read_addr, map_max_read_addr; // base and max addresses coming out from the map controller
logic [10:0] oXpixel; // outputs of mtl controller, go in map controller
logic [9:0]  oYpixel;
// for test
logic [7:0] testReg;
// instantiate the map controller to produce base and max read addresses as a function of the current pixel position
mapController mapController_inst(.clk(iCLOCK_33), // iCLOCK?
											.reset(dly_rst || PIC32_RESET),
											.newFrame(newFrame),
											.Xpixel(oXpixel),
											.Ypixel(oYpixel),
											.tileLoad(tileLoad),
											.base_read_addr(map_base_read_addr),
											.max_read_addr(map_max_read_addr),
											.test(testReg));

assign LED[6:4] = {reg_draw_type[1],testReg[5:4]};
assign LED[7] = mtl_reset;
// This always block is synchronous with the LCD controller
// and with the read side of the SDRAM controller.
// Based on the current image, the base and max read
// addresses are updated each time a frame ends, the
// read FIFO is emptied as well when a new frame begins.
// The signals endFrame and newFrame come from the LCD controller.
always_ff @(posedge CLOCK_33) begin

	if (PIC32_RESET) begin
		base_read_addr <= 24'b0;
		max_read_addr <= RANGE_ADDR_IMG;
		load_new <= 1'b0;
	end else begin
		if (endFrame) begin
			base_read_addr <= current_img*RANGE_ADDR_IMG;
			max_read_addr <= current_img*RANGE_ADDR_IMG + RANGE_ADDR_IMG;
			
		// ok let's try things
		end else if(tileLoad && reg_draw_type[1]) begin // only if certain draw mode
			base_read_addr <= map_base_read_addr;
			max_read_addr <= map_max_read_addr;
			
		end else begin
			base_read_addr <= base_read_addr;
			max_read_addr <= max_read_addr;
		end
		
		//load_new <= newFrame;
		load_new <= newFrame || (tileLoad && reg_draw_type[1]);
	end
end


//--- LCD controller ------------------------------------

logic 		 loading;
logic			 newFrame;
logic			 endFrame;
logic			 wait_dly;
logic [5:0]  counter_dly;

// Here is the LCD controller.
// Note that the read_en signal is an output from this module:
// it triggers reading when it needs data.
mtl_controller mtl_controller_inst (
	// Host Side
	.iCLK(CLOCK_33),
	.iRST_n(~dly_rst),
	.iLoading(loading),
	.oNewFrame(newFrame),
	.oEndFrame(endFrame),
	// SDRAM Side
	.iREAD_DATA(read_data),
	.oREAD_SDRAM_EN(read_en),
	// LCD Side
	.oLCD_R(MTL_R),
	.oLCD_G(MTL_G),
	.oLCD_B(MTL_B),
	.oHD(MTL_HSD),
	.oVD(MTL_VSD),
	.oXpixel(oXpixel),
	.oYpixel(oYpixel),
	.inR(Red),
	.inG(Green),
	.inB(Blue),
	.inMapControl(reg_draw_type[1]),
	.map(map),
	.touchX(reg_x1),
	.touchY(reg_y1),
	.mtl_reset(mtl_reset),
	.mtl_mode(mtl_mode),
	.mtl_counter(mtl_counter),
	.mtl_irq(mtl_irq),
);

assign MTL_DCLK = iCLOCK_33;

// The loading signal tells the LCD controller where it should
// take its inputs from (see the code of the controller for details).
// 1.  loading is at 0, no valid data has been received yet from
//     the PIC32.
// 2.  loading is put at 1, the acquisition of the images of the
//		 slideshow has begun.
// 3.  loading is put back at 0, acquisition is over.
always_ff @ (posedge CLOCK_33) begin
	if (PIC32_RESET) begin
		loading <= 1'b0;
		wait_dly <= 1'b0;
		counter_dly <= 6'b0;
	end else begin
		if ((ImgNum > 0) && (counter_pix == (max_wr_addr-base_wr_addr)/2))
		//if ((ImgNum > 0) && (counter_pix == (ImgNum*(32'd384000))))
			wait_dly <= 1'b1;
		else if (counter_pix > 32'b0)
			loading <= 1'b1;
			// should I add wait_dly <= 1'b0; ?
			
		if (wait_dly)
			if (counter_dly <= 6'd50)
				counter_dly <= counter_dly + 1'b1;
			else
				loading <= 1'b0;
	end
end


//--- Touch controller -------------------------

logic [9:0] reg_x1, reg_x2, reg_x3, reg_x4, reg_x5;
logic [8:0] reg_y1, reg_y2, reg_y3, reg_y4, reg_y5;
logic [1:0] reg_touch_count;
logic [7:0] reg_gesture;
logic			touch_ready;	
logic 		pulse_w, pulse_e;


// This touch controller is given by Terasic and is encrypted.
// To be able to use it, a license must be added to the Quartus
// project (Tools > License Setup...).
// The license file 'license_multi_touch.dat' is given
// in the folder DE0_Nano/License.
// For details about the inputs and outputs, you can refer to
// section 3.3 of the MTL datasheet available in the project
// file folder.
i2c_touch_config i2c_touch_config_inst(
    .iCLK(CLOCK_50),
    .iRSTN(~dly_rst),
    .INT_n(!MTL_TOUCH_INT_n),
    .oREADY(touch_ready),
    .oREG_X1(reg_x1),                                
    .oREG_Y1(reg_y1),                                
    .oREG_X2(reg_x2),                                
    .oREG_Y2(reg_y2),    
    .oREG_X3(reg_x3),
    .oREG_Y3(reg_y3),
    .oREG_X4(reg_x4),
    .oREG_Y4(reg_y4),    
    .oREG_X5(reg_x5),
    .oREG_Y5(reg_y5),        
    .oREG_TOUCH_COUNT(reg_touch_count),                                
    .oREG_GESTURE(reg_gesture),                                
    .I2C_SCLK(MTL_TOUCH_I2C_SCL),
    .I2C_SDAT(MTL_TOUCH_I2C_SDA)
); 


// These two modules are small buffers for the touch
// controller outputs.
// The first one is for the sliding "west" gesture,
// the second one for the sliding "east" gesture.
// More details are given while defining the module, please see below.

touch_buffer	touch_buffer_west (
	.clk (CLOCK_50),
	.rst (dly_rst),
	.trigger (touch_ready && (reg_gesture == 8'h1C)),
	.pulse (pulse_w)
);

touch_buffer	touch_buffer_east (
	.clk (CLOCK_50),
	.rst (dly_rst),
	.trigger (touch_ready && (reg_gesture == 8'h14)),
	.pulse (pulse_e)
);


endmodule




/*
 * This small counting module generates a one-cycle
 * pulse 0.2 secs after the rising edge of a trigger.
 * This module cannot be reactivated until 0.5 secs
 * have passed.
 * The time values are given for a 50 MHz input clock.
 * - 0.2 secs is short enough to bufferize the input of
 *   the touch controller while giving a fast response,
 * - 0.5 secs is for avoiding to skip two slides with
 *   a single touch.
 */
module touch_buffer (
	input  logic	clk,
	input  logic	rst,
	input  logic	trigger,
	output logic	pulse
	);

	logic active;
	logic [31:0] count;
	
	always_ff @ (posedge clk) begin
	
		if (rst) begin
			active <= 1'b0;
			count <= 32'd0;
		end else begin
			if (trigger && !active)
				active <= 1'b1;
			else if (active && (count < 32'd25000000))
				count <= count + 32'b1;
			else if (count >= 32'd25000000) begin
				active <= 1'b0;
				count <= 32'd0;
			end
		end
		
	end

	assign pulse = (count==32'd10000000); 
	
endmodule


/*
 * This small module contains everything needed to synchronize
 * all the components after a reset.
 * If you don't use it, you can meet some random bugs after a reset.
 */
module	reset_delay (
	input  logic iRSTN,
	input  logic iCLK,
	output logic oRSTN,
	output logic oRD_RST,
	output logic oRST
	);
     
	reg  [26:0] cont;

	assign oRSTN = |cont[26:20]; 
	assign oRD_RST = cont[26:25] == 2'b01;      
	assign oRST = !cont[26];  	

	always_ff @(posedge iCLK or negedge iRSTN)
		if (!iRSTN) 
			cont     <= 27'b0;
		else if (!cont[26]) 
			cont     <= cont + 27'b1;
  
endmodule

// Little helpful module
// Maps the 8-bit gesture to a 3-bit gesture
module gestureMapping(
				input logic [7:0] inGesture,
				output logic [2:0] outGesture
				);
				
	always_comb
		case(inGesture)
			8'h10: outGesture = 3'b001; // move up
			8'h14: outGesture = 3'b010; // move left
			8'h18: outGesture = 3'b011; // move down
			8'h1c: outGesture = 3'b100; // move right
			8'h48: outGesture = 3'b101; // zoom in
			8'h49: outGesture = 3'b110; // zoom out
			default: outGesture = 3'b000; // no gesture
		endcase
endmodule

// like the other buffer, but other timings and stuff
module hold_buffer (
	input  logic	clk,
	input  logic	rst,
	input  logic	trigger,
	output logic	pulse
	);

	logic active;
	logic [31:0] count;
	
	always_ff @ (posedge clk) begin
	
		if (rst) begin
			active <= 1'b0;
			count <= 32'd0;
		end else begin
			if (trigger && !active)
				active <= 1'b1;
			else if (active && (count < 32'd25000000))
				count <= count + 32'b1;
			else if (count >= 32'd250000) begin
				active <= 1'b0;
				count <= 32'd0;
			end
		end
		
	end

	assign pulse = ((count<=32'd1000000) && (count>32'd0)); // TODO : ajuster la periode
	
endmodule

// module controlling what we write in the SDRAM !! lol
// values and meanings :
// 00 -> draw background (default)
// 01 -> draw rectangle in middle of the screens
// 
module choose_draw_action (
					input logic [7:0] drawreg,
					output logic [23:0] base_wr_addr,
					output logic [23:0] max_wr_addr);
	always_comb
		case(drawreg)
			8'h00: begin 
				base_wr_addr = 24'b0;
				max_wr_addr = 24'd768000; // number of pixels
				end
			8'h01: begin 
				base_wr_addr = 24'd500; // try something random 
				max_wr_addr = 24'd65000; 
				end
			8'h02: begin 
				base_wr_addr = 24'd76800; // go far far 
				max_wr_addr = 24'd768000; 
				end
			default: begin 
				base_wr_addr = 24'b0;
				max_wr_addr = 24'd768000; // number of pixels
				end
		endcase
		
endmodule
	
