`timescale 1 ps / 1 ps
module LT24_interface_irq (
		input  wire [7:0]  avs_s0_address,     //      avs_s0.address
		input  wire        avs_s0_read,        //            .read
		output wire [31:0] avs_s0_readdata,    //            .readdata
		input  wire        avs_s0_write,       //            .write
		input  wire [31:0] avs_s0_writedata,   //            .writedata
		output wire        avs_s0_waitrequest, //            .waitrequest
		input  wire        clock_clk,          //       clock.clk
		input  wire        reset_reset,        //       reset.reset
		output wire        ins_irq0_irq,       //    ins_irq0.irq
		input  wire        finish_flag,        // conduit_end.finish_flag
		input  wire [31:0] counter,            //            .counter
		output wire [11:0] pattern,            //            .pattern
		output wire [31:0] vx,                 //            .vx
		output wire [31:0] vy,                 //            .vy
		output wire [31:0] lt24_coin_x0,       //            .lt24_coin_x0
		output wire [31:0] lt24_coin_y0,       //            .lt42_coin_y0
		input  wire [31:0] lt24_coin_x,        //            .lt24_coinx
		input  wire [31:0] lt24_coin_y,        //            .lt24_coin_y
		output wire [31:0] lt24_coin_vx0,      //            .lt24_coin_vx0
		output wire [31:0] lt24_coin_vy0,      //            .lt24_coin_vy0
		output wire [11:0] lt24_pattern_0      //            .lt24_pattern_0
	);

	parameter finish_flag_addr = 4'b0000;
	parameter counter_addr = 4'b0001;
	parameter pattern_addr = 4'b0010;
	parameter vx_addr = 4'b0011;
	parameter vy_addr = 4'b0100;
	parameter lt24_coin_x_addr = 4'b0101;
	parameter lt24_coin_y_addr = 4'b0110;
	parameter lt24_coin_x0_addr = 4'b0111;
	parameter lt24_coin_y0_addr = 4'b1000;
	parameter lt24_coin_vx0_addr = 4'b1001;
	parameter lt24_coin_vy0_addr = 4'b1010;
	parameter lt24_pattern_0_addr = 4'b1011;
	 
	reg [31:0] my_counter;
	wire [31:0] my_counter_wire;
	
	wire read_wire;
	wire [2:0] addr_wire;
	
	assign read_wire = avs_s0_read;
	assign addr_wire = avs_s0_readdata[2:0];
	
	assign my_counter_wire = my_counter;
	
	assign ins_irq0_irq = finish_flag && irq_flag;
	reg irq_flag;
	
	reg finish_flag_delay;
	wire finish_flag_delay_wire;
	assign finish_flag_delay_wire = finish_flag_delay;

	
	reg [31:0]	avs_s0_readdata_reg;
	assign avs_s0_readdata = avs_s0_readdata_reg;
	
	// never ask avalon bus to wait
	assign avs_s0_waitrequest = 1'b0;

	reg [11:0] pattern_reg , lt24_pattern_0_reg;
	assign pattern = pattern_reg;
	assign lt24_pattern_0 = lt24_pattern_0_reg;
	
	reg [31:0] vx_reg , vy_reg ,lt24_coin_x0_reg ,lt24_coin_y0_reg , lt24_coin_vx0_reg , lt24_coin_vy0_reg;
	assign vx =  vx_reg;
	assign vy = vy_reg;
	assign lt24_coin_x0 = lt24_coin_x0_reg;
	assign lt24_coin_y0 =  lt24_coin_y0_reg;
	assign lt24_coin_vx0 = lt24_coin_vx0_reg;
	assign lt24_coin_vy0 = lt24_coin_vy0_reg;
	
	always @(clock_clk)
	if(reset_reset)
		begin
			avs_s0_readdata_reg <= 32'b0;
			lt24_coin_x0_reg <= 32'b0;
			lt24_coin_y0_reg <= 32'b0;
			lt24_coin_vx0_reg <= 32'b0;
			lt24_coin_vy0_reg <= 32'b0;
			pattern_reg <= 12'b0;
			lt24_pattern_0_reg <= 12'b0;
		end
	else if(avs_s0_read)
		begin
			case(avs_s0_address[3:0])
				pattern_addr: avs_s0_readdata_reg <= {20'b0 , pattern_reg};
				finish_flag_addr: avs_s0_readdata_reg <= {31'b0 , finish_flag};
				counter_addr: avs_s0_readdata_reg <= my_counter;
				vx_addr: avs_s0_readdata_reg <= vx_reg;
				vy_addr: avs_s0_readdata_reg <= vy_reg;
				lt24_coin_x0_addr: avs_s0_readdata_reg <= lt24_coin_x0_reg;
				lt24_coin_y0_addr: avs_s0_readdata_reg <= lt24_coin_y0_reg;
				lt24_coin_vx0_addr: avs_s0_readdata_reg <= lt24_coin_vx0_reg;
				lt24_coin_vy0_addr: avs_s0_readdata_reg <= lt24_coin_vy0_reg;
				lt24_pattern_0_addr: avs_s0_readdata_reg <= lt24_pattern_0;
				default:avs_s0_readdata_reg <= 32'b1;
			endcase
		end
	else if(avs_s0_write)
		begin
			case(avs_s0_address[3:0])
				pattern_addr: pattern_reg <= avs_s0_writedata[11:0];
				vx_addr: vx_reg <= avs_s0_writedata;
				vy_addr: vy_reg <= avs_s0_writedata;
				lt24_coin_x0_addr: lt24_coin_x0_reg <= avs_s0_writedata;
				lt24_coin_y0_addr: lt24_coin_y0_reg <= avs_s0_writedata;
				lt24_coin_vx0_addr: lt24_coin_vx0_reg <= avs_s0_writedata;
				lt24_coin_vy0_addr: lt24_coin_vy0_reg <= avs_s0_writedata;
				lt24_pattern_0_addr: lt24_pattern_0_reg <= avs_s0_writedata[11:0];
				default:avs_s0_readdata_reg <= 32'b0;
			endcase
		end
	else
		begin
			avs_s0_readdata_reg <= 32'b0;
		end
	
	/*always @(clock_clk)
	if(reset_reset)
		begin
			pattern_reg <= 12'b0;
			vy_reg <= 32'b0;
			vx_reg <= 32'b0;
			lt24_coin_x0_reg <= 32'b0;
			lt24_coin_y0_reg <= 32'b0;
			lt24_coin_vx0_reg <= 32'b0;
			lt24_coin_vy0_reg <= 32'b0;
			//avs_s0_readdata_reg <= 32'b0;
		end
	else if(avs_s0_write)
		case(avs_s0_address[3:0])
			pattern_addr: pattern_reg <= avs_s0_writedata[11:0];
		 //lt24_pattern_0_addr: lt24_pattern_0_reg <= avs_s0_writedata[11:0];
			vx_addr: vx_reg <= avs_s0_writedata;
			vy_addr: vy_reg <= avs_s0_writedata;
			lt24_coin_x0_addr:  lt24_coin_x0_reg <= avs_s0_writedata;
			lt24_coin_y0_addr:  lt24_coin_y0_reg <= avs_s0_writedata;
			lt24_coin_vx0_addr:  lt24_coin_vx0_reg <= avs_s0_writedata;
			lt24_coin_vy0_addr:  lt24_coin_vy0_reg <= avs_s0_writedata;			
		endcase
	else
		case(avs_s0_address[3:0])
			finish_flag_addr: avs_s0_readdata_reg <= {31'b0 , finish_flag};
			counter_addr: avs_s0_readdata_reg <= my_counter;
			lt24_coin_x_addr: avs_s0_readdata_reg <= lt24_coin_x;
			lt24_coin_y_addr: avs_s0_readdata_reg <= lt24_coin_y;
		endcase
	/*else
		begin
			avs_s0_readdata_reg <= avs_s0_readdata_reg;
			lt24_coin_x0_reg <= lt24_coin_x0_reg;
			lt24_coin_y0_reg <= lt24_coin_y0_reg;
			lt24_coin_vx0_reg <= lt24_coin_vx0_reg;
			lt24_coin_vy0_reg <= lt24_coin_vy0_reg;
			vx_reg <= vx_reg;
			vy_reg <= vy_reg;
			pattern_reg <= pattern_reg;
		end*/
		
		
	always @ (posedge clock_clk)
		if(reset_reset || ~finish_flag)
			irq_flag <= 1'b1;
		else if (avs_s0_write && avs_s0_address[2:0] == 3'b111)
			irq_flag <= 1'b0;
		else
			irq_flag <= irq_flag;
			
	always @ (posedge clock_clk)
		if(reset_reset)// || finish_flag_delay_wire == 1'b1 && finish_flag==1'b0 )
			my_counter <= 32'b0;
		else if (read_wire)
			my_counter <= 32'b0;
		else if (finish_flag)
			my_counter <= my_counter_wire + 32'b0;
		else
			my_counter <= my_counter_wire + 32'b1;
	
	always @ (posedge clock_clk)
		if(reset_reset)
			finish_flag_delay <= 1'b0;
		else
			finish_flag_delay <= finish_flag;
			
endmodule