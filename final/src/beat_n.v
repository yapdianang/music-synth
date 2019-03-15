`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Avoy Datta, Makena Low, Dian Ang Yap
// 
// Create Date:    22:40:06 03/12/2019 
// Module Name:    beat_n 
// Project Name: music-synth
// Target Devices: FPGA
// Description: 
//		Counts up to a provided parameter, with input count_en signalling each count increment
//    Output out is set to HIGH for exactly 1 clk cycle when count has been reached.
//		SIGNAL_WIDTH is expected to be 16 bits wide
//////////////////////////////////////////////////////////////////////////////////
module beat_n #(parameter SIGNAL_WIDTH = 16, parameter COUNT_TO = 4800)(
	input clk,
	input reset,
	input count_en,
	output out
);
	 
wire [SIGNAL_WIDTH-1:0] next_count, curr_count;
wire curr_toggle, next_toggle;
/*
dffre #(.WIDTH(SIGNAL_WIDTH)) counts_ff(
		.clk(clk),
		.r(reset),
		.en(count_en),
		.d (next_count),
		.q (curr_count)
);
*/

dffre #(.WIDTH(SIGNAL_WIDTH)) counts_ff(
		.clk(clk),
		.r(reset),
		.en(count_en),
		.d (next_count),
		.q (curr_count)
);

dffr #(.WIDTH(1)) toggle_ff(
	.clk(clk),
	.r(reset),
	.d(next_toggle),
	.q(curr_toggle)
);

assign next_toggle = ((curr_toggle == 1'b0) & curr_count == COUNT_TO - 16'd1) ? 1'b1 : 1'b0;
assign next_count = (curr_count == COUNT_TO) ? {SIGNAL_WIDTH{1'b0}} : curr_count + 16'd1;
 
assign out = reset ? 1'b0 : curr_toggle;

endmodule

//Redundant code from beat32
/* 
always @(*) begin 
	casex({reset, toggle}) 
		2'b1x: begin
			next_count = 22'b0;
		end
		2'b01: begin
			next_count = 22'b0;
		end
		2'b00: begin
			next_count = curr_count + 22'b1;
		end 
		default: begin
			next_count = 22'b0;
		end
	endcase
end
*/
