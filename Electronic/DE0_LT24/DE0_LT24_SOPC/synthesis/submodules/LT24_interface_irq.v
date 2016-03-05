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
		input  wire        finish_flag,        // conduit_end.new_signal
		input  wire [31:0] counter,            //            .new_signal_1
		output wire [11:0] pattern             //            .new_signal_2
	);

	// TODO: Auto-generated HDL template
	wire ins_riq_wire;
	assign ins_irq0_irq = (finish_flag & !irq_down_wire);
	//assign ins_irq0_irq = ins_riq_wire;
	//shorter  shoter_dut( reset_reset , clock_clk , finish_flag, ins_riq_wire);
	wire irq_down_wire;
	reg irq_down;
	
	assign irq_down_wire = irq_down;
	reg [31:0]	avs_s0_readdata_reg;
	assign avs_s0_readdata = avs_s0_readdata_reg;
	
	// never ask avalon bus to wait
	assign avs_s0_waitrequest = 1'b0;

	reg [11:0] pattern_reg;
	assign pattern = pattern_reg;
	
	
	always @(*)
	if(reset_reset)
		irq_down <= 1'b0;
	else if(avs_s0_read)
		case(avs_s0_address[1:0])
			2'b00: avs_s0_readdata_reg <= {31'b0 , finish_flag};
			2'b01: avs_s0_readdata_reg <= {20'b0 , counter};
			2'b10: avs_s0_readdata_reg <= {20'b0 , pattern};
		endcase
	else if(avs_s0_write)
		case(avs_s0_address[1:0])
			2'b10: pattern_reg <= avs_s0_writedata[11:0];
			default: begin irq_down <= 1'b1; pattern_reg <= avs_s0_writedata[11:0];end
		endcase
	else if(!finish_flag)
		irq_down <= 1'b0;
endmodule

module shorter(
				input wire reset , clk , 
				input wire in,
				output wire shorter);
		
		reg inPre;
		reg shorter_reg;
		reg [3:0] Counter;
		assign shorter = shorter_reg;
		
		wire inPre_Wire;
		assign inPre_Wire = inPre;

		wire [15:0] Counter_Wire;
		assign Counter_Wire = Counter;
		
		always @(clk)
			inPre <= in;
			
		always @(clk)
			if(reset)
				begin
					shorter_reg <= 1'b0;
					Counter <= 16'b0;
				end
			else if(inPre_Wire == 1'b0 && in == 1'b1)
			begin
				shorter_reg <= 1'b1;
				Counter  <= 8'b0;
			end
			else if (Counter_Wire==16'hffff)
				shorter_reg <= 1'b0;
			else
				Counter <= Counter_Wire +1;

endmodule
