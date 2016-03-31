// LT24_interface_irq.v

// This file was auto-generated as a prototype implementation of a module
// created in component editor.  It ties off all outputs to ground and
// ignores all inputs.  It needs to be edited to make it do something
// useful.
// 
// This file will not be automatically regenerated.  You should check it in
// to your version control system if you want to keep it.

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

	// TODO: Auto-generated HDL template

	assign avs_s0_readdata = 32'b00000000000000000000000000000000;

	assign avs_s0_waitrequest = 1'b0;

	assign ins_irq0_irq = 1'b0;

	assign vx = 32'b00000000000000000000000000000000;

	assign vy = 32'b00000000000000000000000000000000;

	assign lt24_coin_vy0 = 32'b00000000000000000000000000000000;

	assign lt24_coin_y0 = 32'b00000000000000000000000000000000;

	assign lt24_coin_vx0 = 32'b00000000000000000000000000000000;

	assign pattern = 12'b000000000000;

	assign lt24_coin_x0 = 32'b00000000000000000000000000000000;

	assign lt24_pattern_0 = 12'b000000000000;

endmodule
