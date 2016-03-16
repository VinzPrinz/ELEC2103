// new_component.v

// This file was auto-generated as a prototype implementation of a module
// created in component editor.  It ties off all outputs to ground and
// ignores all inputs.  It needs to be edited to make it do something
// useful.
// 
// This file will not be automatically regenerated.  You should check it in
// to your version control system if you want to keep it.
module mapTransfer (
		output reg [15:0] map_line0, //          map.new_signal
		output reg [15:0] map_line1, //             .map_line1
		output reg [15:0] map_line2, //             .map_line2
		output reg [15:0] map_line3, //             .map_line3
		output reg [15:0] map_line4, //             .map_line4
		output reg [15:0] map_line5, //             .map_line5
		output reg [15:0] map_line6, //             .ap_line6
		output reg [15:0] map_line7, //             .map_line7
		input  wire        write,     // avalon_slave.write
		input  wire [15:0] writedata, //             .writedata
		input  wire [2:0]  address,   //             .address
		input  wire        clock,     //        clock.clk
		input  wire        reset      //        reset.reset
	);
//	reg lol;
//	always @(posedge clock)
//		lol <= 1'b1;
		always @(posedge clock)
		if(reset) // if reset
		begin
			map_line0 <= 16'b1111111111111111;
			map_line1 <= 16'b1111111111111111;
			map_line2 <= 16'b0000000000000000;
			map_line3 <= 16'b1100000011111111;
			map_line4 <= 16'b1111111111111111;
			map_line5 <= 16'b1111111111111111;
			map_line6 <= 16'b1111111111111111;
			map_line7 <= 16'b1111111111111111;
		end // end if reset
		else if (write) // if we try to write the map
		begin
			case(address)
				3'b000 : map_line0 <= writedata;
				3'b001 : map_line1 <= writedata;
				3'b010 : map_line2 <= writedata;
				3'b011 : map_line3 <= writedata;
				3'b100 : map_line4 <= writedata;
				3'b101 : map_line5 <= writedata;
				3'b110 : map_line6 <= writedata;
				3'b111 : map_line7 <= writedata;
			endcase
		end // end else if write
	
	endmodule
