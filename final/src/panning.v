`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Avoy Datta
// 
// Create Date:    22:21:20 03/21/2019 
// Design Name: 
// Module Name:    panning 
// Project Name: music-synth
// Target Devices: FPGA
// Description: Performs amplitude modulation on 16-bit input using Attack-Decay-Sustain-Release envelope
//
// The codec is expected to request 48k samples per second.
//////////////////////////////////////////////////////////////////////////////////
`define L25R75 2'd0
`define L50R50 2'd1
`define L75R25 2'd2
`define L100R0 2'd3
`define t_state 48000 
`define t_2 4800
`define t_3 4800
`define t_4 4800

module panning(
	input clk,
	input reset,
	input signed [15:0] sample_in,
	input in_ready,
	output signed [15:0] out_L,
	output signed [15:0] out_R,
	output out_ready
  );	
	 
wire [1:0] curr_state;
reg [1:0] next_state;

reg [15:0] out_L_reg;
reg [15:0] out_R_reg;

wire switch_step, flopped_ready;
wire signed [15:0] shift_1, shift_2, shift_3, shift_4, shift_5, shift_6;

dffr #(.WIDTH(1)) ready_ff(
	.clk(clk),
	.r(reset),
	.d(in_ready),
	.q(flopped_ready)
);

assign out_ready = flopped_ready;

wire signed [15:0] pre_shift_1 = $signed(sample_in) >>> 1;
wire signed [15:0] pre_shift_2 = $signed(sample_in) >>> 2;
wire signed [15:0] pre_shift_3 = $signed(sample_in) >>> 3;
wire signed [15:0] pre_shift_4 = $signed(sample_in) >>> 4;
wire signed [15:0] pre_shift_5 = $signed(sample_in) >>> 5;
wire signed [15:0] pre_shift_6 = $signed(sample_in) >>> 6;

dffr #(.WIDTH(16)) shift_1_ff(
	.clk(clk),
	.r(reset),
	.d(pre_shift_1),
	.q(shift_1)
);
dffr #(.WIDTH(16)) shift_2_ff(
	.clk(clk),
	.r(reset),
	.d(pre_shift_2),
	.q(shift_2)
);
dffr #(.WIDTH(16)) shift_3_ff(
	.clk(clk),
	.r(reset),
	.d(pre_shift_3),
	.q(shift_3)
);
dffr #(.WIDTH(16)) shift_4_ff(
	.clk(clk),
	.r(reset),
	.d(pre_shift_4),
	.q(shift_4)
);
dffr #(.WIDTH(16)) shift_5_ff(
	.clk(clk),
	.r(reset),
	.d(pre_shift_5),
	.q(shift_5)
);
dffr #(.WIDTH(16)) shift_6_ff(
	.clk(clk),
	.r(reset),
	.d(pre_shift_6),
	.q(shift_6)
);

wire [15:0] curr_sample_count, curr_sample_count_pre;
reg [15:0] next_sample_count;

dffre #(.WIDTH(16)) sample_count_ff(
	.clk(clk),
	.r(reset),
	.en(flopped_ready),
	.d(next_sample_count),
	.q(curr_sample_count)
);

dffre #(.WIDTH(2)) state_ff(
	.clk(clk),
	.r(reset),
	.en(flopped_ready),
	.d(next_state),
	.q(curr_state)
);

always @(*) begin
	case (curr_state)
		`L25R75: begin
			next_state = (curr_sample_count == `t_state - 16'd1) ? `L50R50 : `L25R75;
			next_sample_count = (curr_sample_count == `t_state - 16'd1) ? 16'd0 : curr_sample_count + 16'd1;
			
			end
		`L50R50: begin
			next_state = ((curr_sample_count == `t_state - 16'd1)) ? `L75R25 : `L50R50;
			next_sample_count = (curr_sample_count == `t_state - 16'd1) ? 16'd0 : curr_sample_count + 16'd1;

			end
		`L75R25: begin
			next_state = (curr_sample_count == `t_state - 16'd1) ? `L100R0 : `L75R25;
			next_sample_count = (curr_sample_count == `t_state - 16'd1) ? 16'd0 : curr_sample_count + 16'd1;

			end
		`L100R0: begin
			next_state = (curr_sample_count == `t_state - 16'd1) ? `L25R75 : `L100R0;
			next_sample_count = (curr_sample_count == `t_state - 16'd1) ? 16'd0 : curr_sample_count + 16'd1;

			end
		default: begin
			next_state = `L25R75; 
			next_sample_count = 16'd0;
		end
	endcase
   
	casex (curr_state)
		`L25R75:begin
			out_L_reg = shift_2;
			out_R_reg = shift_1 + shift_2;
		end
		`L50R50: begin
			out_L_reg = shift_1;
			out_R_reg = shift_1;
		end
		`L75R25: begin
			out_L_reg = shift_1 + shift_2;
			out_R_reg = shift_2;
		end
		`L100R0: begin
			out_L_reg = shift_2;
			out_R_reg = shift_1 + shift_2;
		end
		default: begin
			out_L_reg = 16'd0;
			out_R_reg = 16'd0;

		end
	endcase
	
end

assign out_L = out_L_reg;
assign out_R = out_R_reg;

endmodule
