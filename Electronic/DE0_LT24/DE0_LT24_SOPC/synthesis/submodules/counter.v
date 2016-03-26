// new_component.v

// This file was auto-generated as a prototype implementation of a module
// created in component editor.  It ties off all outputs to ground and
// ignores all inputs.  It needs to be edited to make it do something
// useful.
// 
// This file will not be automatically regenerated.  You should check it in
// to your version control system if you want to keep it.

`timescale 1 ps / 1 ps
module counter (
		input  wire [7:0]  avs_s0_address,     // avs_s0.address
		input  wire        avs_s0_read,        //       .read
		output wire [31:0] avs_s0_readdata,    //       .readdata
		input  wire        avs_s0_write,       //       .write
		input  wire [31:0] avs_s0_writedata,   //       .writedata
		output wire        avs_s0_waitrequest, //       .waitrequest
		input  wire        clock_clk,          //  clock.clk
		input  wire        reset_reset         //  reset.reset
	);

	// TODO: Auto-generated HDL template
	reg [31:0] avs_s0_readdata_reg, counter;
	assign avs_s0_readdata = counter;
	assign avs_s0_waitrequest = 1'b0;
	
	always @(posedge clock_clk)
		if(reset_reset)
			begin
				counter <= 32'd0;
			end
		else if (avs_s0_write && avs_s0_address[1:0] == 2'b10)
			counter <= 32'd1;
		else
			begin
				counter <= counter +  32'd1;
			end

	
	

endmodule
