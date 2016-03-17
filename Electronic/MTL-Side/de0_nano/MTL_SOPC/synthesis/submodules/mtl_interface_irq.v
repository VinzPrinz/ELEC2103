// new_component.v

// This file was auto-generated as a prototype implementation of a module
// created in component editor.  It ties off all outputs to ground and
// ignores all inputs.  It needs to be edited to make it do something
// useful.
// 
// This file will not be automatically regenerated.  You should check it in
// to your version control system if you want to keep it.

`timescale 1 ps / 1 ps
module mtl_interface_irq (
		input  wire [7:0]  avs_s0_address,     //        avs_s0.address
		input  wire        avs_s0_read,        //              .read
		output wire [31:0] avs_s0_readdata,    //              .readdata
		input  wire        avs_s0_write,       //              .write
		input  wire [31:0] avs_s0_writedata,   //              .writedata
		output wire        avs_s0_waitrequest, //              .waitrequest
		input  wire        clock_clk,          //         clock.clk
		input  wire        reset_reset,        //         reset.reset
		output wire        ins_irq0_irq,       //      ins_irq0.irq
		input  wire        mtl_irq,            // mtl_interface.mtl_irq
		output wire        mtl_reset,          //              .mtl_reset
		output wire [3:0]  mtl_mode,           //              .mtl_mode
		input  wire [31:0] mtl_counter         //              .mtl_counter
	);

	// TODO: Auto-generated HDL template

	assign avs_s0_readdata = 32'b00000000000000000000000000000000;

	assign avs_s0_waitrequest = 1'b0;

	assign ins_irq0_irq = 1'b0;



	parameter mtl_reset_addr = 2'b00;
	parameter mtl_mode_addr = 2'b01;
	
	reg [3:0] mtl_mode_reg;
	reg mtl_reset_reg;
	
	assign mtl_reset = mtl_reset_reg;
	assign mtl_mode = mtl_mode_reg;
	
	always @(posedge clock_clk)
		if(avs_s0_write)
		case(avs_s0_address[1:0])
			mtl_reset_addr: mtl_reset_reg <= avs_s0_writedata[0];
			mtl_mode_addr: mtl_mode_reg <= avs_s0_writedata[3:0];
		endcase 
endmodule
