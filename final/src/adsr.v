`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Avoy Datta
// 
// Create Date:    22:21:20 03/12/2019 
// Design Name: 
// Module Name:    adsr 
// Project Name: music-synth
// Target Devices: FPGA
// Description: Performs amplitude modulation on 16-bit input using Attack-Decay-Sustain-Release envelope
//
// The codec is expected to request 48k samples per second.
//////////////////////////////////////////////////////////////////////////////////
`define ATTACK 2'd0
`define DECAY 2'd1
`define SUSTAIN 2'd2
`define RELEASE 2'd3
`define t_a 4800 
`define t_d 4800
`define t_s 4800
`define t_r 4800
`define STEP 480
//Time constants need to be multiples of step

`define S0 4'd0
`define S1 4'd1
`define S2 4'd2
`define S3 4'd3
`define S4 4'd4
`define S5 4'd5
`define S6 4'd6
`define S7 4'd7
`define S8 4'd8
`define S9 4'd9

module adsr(
	input clk,
	input_reset,
	input signed [15:0] sample_in,
	input in_ready,
	output signed [15:0] sample_out
    );
	 
wire [3:0] curr_state;
reg [3:0] next_state;

wire [1:0] step;
wire [1:0] next_step;

wire [15:0] curr_sample_count;
reg [15:0] next_sample_count;
wire switch_step;
reg [3:0] state;

/*
The STEP size is assumed constant for all stages, as well as the step count.
*/
beat_n #(.SIGNAL_WIDTH(16), .COUNT_TO(STEP)) beat_STEP(
	.clk(clk),
	.reset(reset),
	.count_en(in_ready),
	.out(switch_step)
);

dffre #(.WIDTH(4)) step_ff(
	.clk(clk),
	.reset(reset),
	.en(switch_step),
	.d(next_step),
	.q(step)
);

dffre #(.WIDTH(16)) sample_count_ff(
	.clk(clk),
	.reset(reset),
	.en(in_ready),
	.d(next_sample_count),
	.q(curr_sample_count)
);

dffre #(.WIDTH(2)) state_ff(
	.clk(clk),
	.reset(reset),
	.en(in_ready),
	.d(next_state),
	.q(curr_state)
);

assign next_step = (step == `S9) ? 4'd0 : step + 4'd1;

always @(*) begin
	case (state)
		`ATTACK: begin
			next_state = (curr_sample_count == `t_a) ? `DECAY : `ATTACK;
			next_sample_count = (curr_sample_count == `t_a) ? 16'd0 : curr_sample_count + 16'd1;
			
			end
		`DECAY: begin
			next_state = (curr_sample_count == `t_d) ? `SUSTAIN : `DECAY;
			next_sample_count = (curr_sample_count == `t_d) ? 16'd0 : curr_sample_count + 16'd1;

			end
		`SUSTAIN: begin
			next_state = (curr_sample_count == `t_s) ? `RELEASE : `SUSTAIN;
			next_sample_count = (curr_sample_count == `t_s) ? 16'd0 : curr_sample_count + 16'd1;

			end
		`RELEASE: begin
			next_state = (curr_sample_count == `t_r) ? `ATTACK : `RELEASE;
			next_sample_count = (curr_sample_count == `t_r) ? 16'd0 : curr_sample_count + 16'd1;

			end
		default: begin
			next_state = `ATTACK;
			next_sample_count = 16'd0;
		end
	endcase

	case ({state, step})
		{`ATTACK, `S0}:begin
			out_reg = (sample_in >>> 4) + (sample_in >>> 5);
		end
		{`ATTACK, `S1}: begin
			out_reg = (sample_in >>> 3) + (sample_in >>> 4) + (sample_in >>> 6);
		end
		{`ATTACK, `S2}: begin
			out_reg = (sample_in >>> 2) + (sample_in >>> 5) +(sample_in >>> 6) ;
		end
		{`ATTACK, `S3}: begin
			out_reg = (sample_in >>> 2) + (sample_in >>> 3) + (sample_in >>> 5);
		end
		{`ATTACK, `S4}: begin
			out_reg = sample_in >>> 1;
		end
		{`ATTACK, `S5}: begin
			out_reg = (sample_in >>> 1) + (sample_in >>> 4) + (sample_in >>> 5);
		end
		{`ATTACK, `S6}: begin
			out_reg = (sample_in >>> 1) + (sample_in >>> 3) + (sample_in >>> 4) + (sample_in >>> 6);
		end
		{`ATTACK, `S7}: begin
			out_reg = (sample_in >>> 1) + (sample_in >>> 2) + (sample_in >>> 5) + (sample_in >>> 6);
		end
		{`ATTACK, `S8}: begin
			out_reg = (sample_in >>> 1) + (sample_in >>> 2) + (sample_in >>> 3) + (sample_in >>> 5);
		end
		{`ATTACK, `S9}: begin
			out_reg = sample_in;
		end
		{`DECAY, `S0}: begin
			out_reg = (sample_in >>> 1) + (sample_in >>> 2) + (sample_in >>> 3) + (sample_in >>> 4);
		end
		{`DECAY, `S1}: begin
			out_reg = (sample_in >>> 1) + (sample_in >>> 2) + (sample_in >>> 3);
		end
		{`DECAY, `S2}: begin
			out_reg = (sample_in >>> 1) + (sample_in >>> 2) + (sample_in >>> 4);
		end
		{`DECAY, `S3}: begin
			out_reg = (sample_in >>> 1) + (sample_in >>> 2); 
		end
		{`DECAY, `S4}: begin
			out_reg = (sample_in >>> 1) + (sample_in >>> 3) + (sample_in >>> 4) + (sample_in >>> 6);
		end
		{`DECAY, `S5}: begin
			out_reg = (sample_in >>> 1) + (sample_in >>> 3) + (sample_in >>> 5);
		end
		{`DECAY, `S6}: begin
			out_reg = (sample_in >>> 1) + (sample_in >>> 3); 
		end
		{`DECAY, `S7}: begin
			out_reg = (sample_in >>> 1) + (sample_in >>> 4) + (sample_in >>> 6);
		end
		{`DECAY, `S0}: begin
			out_reg = (sample_in >>> 1) + (sample_in >>> 5);
		end
		{`DECAY, `S0}: begin
			out_reg = (sample_in >>> 1);
		end
		default: begin
			out_reg = 16'b0;
		end
	endcase
	
end
assign out = out_reg;

endmodule
