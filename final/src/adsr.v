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
/*
module adsr(
	input clk,
	input reset,
	input signed [15:0] predelay_sample_in,
	input in_ready,
	output signed [15:0] sample_out
    );
*/	
module adsr(
	input clk,
	input reset,
	input signed [15:0] pre_sample_in,
	input in_ready,
	output signed [15:0] sample_out,
	output out_ready
    );	
	 
wire [1:0] curr_state;
reg [1:0] next_state;

wire [3:0] step;
wire [3:0] next_step;

wire signed [15:0] sample_in;

reg [15:0] out_reg;
wire switch_step, flopped_ready;
wire signed [15:0] shift_1, shift_2, shift_3, shift_4, shift_5, shift_6;
//wire signed [15:0] pre_shift_1, pre_shift_2, pre_shift_3, pre_shift_4, pre_shift_5, pre_shift_6;


dffr #(.WIDTH(1)) ready_ff(
	.clk(clk),
	.r(reset),
	.d(in_ready),
	.q(flopped_ready)
);

assign out_ready = flopped_ready;

dffre #(.WIDTH(16)) sample(
	.clk(clk),
	.r(reset),
	.en(in_ready),
	.d(pre_sample_in),
	.q(sample_in)
);

wire signed [15:0] pre_shift_1 = $signed(sample_in) >>> 1;
wire signed [15:0] pre_shift_2 = $signed(sample_in) >>> 2;
wire signed [15:0] pre_shift_3 = $signed(sample_in) >>> 3;
wire signed [15:0] pre_shift_4 = $signed(sample_in) >>> 4;
wire signed [15:0] pre_shift_5 = $signed(sample_in) >>> 5;
wire signed [15:0] pre_shift_6 = $signed(sample_in) >>> 6;

dffre #(.WIDTH(16)) shift_1_ff(
	.clk(clk),
	.r(reset),
	.en(in_ready),
	.d(pre_shift_1),
	.q(shift_1)
);
dffre #(.WIDTH(16)) shift_2_ff(
	.clk(clk),
	.r(reset),
	.en(in_ready),
	.d(pre_shift_2),
	.q(shift_2)
);
dffre #(.WIDTH(16)) shift_3_ff(
	.clk(clk),
	.r(reset),
	.en(in_ready),
	.d(pre_shift_3),
	.q(shift_3)
);
dffre #(.WIDTH(16)) shift_4_ff(
	.clk(clk),
	.r(reset),
	.en(in_ready),
	.d(pre_shift_4),
	.q(shift_4)
);
dffre #(.WIDTH(16)) shift_5_ff(
	.clk(clk),
	.r(reset),
	.en(in_ready),
	.d(pre_shift_5),
	.q(shift_5)
);
dffre #(.WIDTH(16)) shift_6_ff(
	.clk(clk),
	.r(reset),
	.en(in_ready),
	.d(pre_shift_6),
	.q(shift_6)
);


/*
The STEP size is assumed constant for all stages, as well as the step count.
*/
beat_n #(.SIGNAL_WIDTH(16), .COUNT_TO(480)) beat_STEP(
	.clk(clk),
	.reset(reset),
	.count_en(in_ready),
	.out(switch_step)
);

dffre #(.WIDTH(4)) step_ff(
	.clk(clk),
	.r(reset),
	.en(switch_step),
	.d(next_step),
	.q(step)
);

wire flopped_switch;

dffre # (.WIDTH(1)) switch_ff(
	.clk(clk),
	.r(reset),
	.en(in_ready),
	.d(switch_step),
	.q(flopped_switch)
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
/*
dffr # (.WIDTH(16)) sample_ff(
	.clk(clk),
	.r(reset),
	.d(predelay_sample_in),
	.q(sample_in)
);
*/
assign next_step = (step == `S9) ? `S0 : step + 4'd1;

always @(*) begin
	case (curr_state)
		`ATTACK: begin
			next_state = (curr_sample_count == `t_a - 16'd1) ? `DECAY : `ATTACK;
			next_sample_count = (curr_sample_count == `t_a - 16'd1) ? 16'd0 : curr_sample_count + 16'd1;
			
			end
		`DECAY: begin
			next_state = ((curr_sample_count == `t_d - 16'd1)) ? `SUSTAIN : `DECAY;
			next_sample_count = (curr_sample_count == `t_d- 16'd1) ? 16'd0 : curr_sample_count + 16'd1;

			end
		`SUSTAIN: begin
			next_state = (curr_sample_count == `t_s - 16'd1) ? `RELEASE : `SUSTAIN;
			next_sample_count = (curr_sample_count == `t_s- 16'd1) ? 16'd0 : curr_sample_count + 16'd1;

			end
		`RELEASE: begin
			next_state = (curr_sample_count == `t_r - 16'd1) ? `ATTACK : `RELEASE;
			next_sample_count = (curr_sample_count == `t_r- 16'd1) ? 16'd0 : curr_sample_count + 16'd1;

			end
		default: begin
			next_state = `ATTACK; 
			next_sample_count = 16'd0;
		end
	endcase
   
	casex ({curr_state, step})
		{`ATTACK, `S0}:begin
			out_reg = (shift_4) + (shift_5);
		end
		{`ATTACK, `S1}: begin
			out_reg = (shift_3) + (shift_4) + (shift_6);
		end
		{`ATTACK, `S2}: begin
			out_reg = (shift_2) + (shift_5) +(shift_6) ;
		end
		{`ATTACK, `S3}: begin
			out_reg = (shift_2) + (shift_3) + (shift_5);
		end
		{`ATTACK, `S4}: begin
			out_reg = shift_1;
		end
		{`ATTACK, `S5}: begin
			out_reg = (shift_1) + (shift_4) + (shift_5);
		end
		{`ATTACK, `S6}: begin
			out_reg = (shift_1) + (shift_3) + (shift_4) + (shift_6);
		end
		{`ATTACK, `S7}: begin
			out_reg = (shift_1) + (shift_2) + (shift_5) + (shift_6);
		end
		{`ATTACK, `S8}: begin
			out_reg = (shift_1) + (shift_2) + (shift_3) + (shift_5);
		end
		{`ATTACK, `S9}: begin
			out_reg = sample_in;
		end
		{`DECAY, `S0}: begin
			out_reg = (shift_1) + (shift_2) + (shift_3) + (shift_4);
		end
		{`DECAY, `S1}: begin
			out_reg = (shift_1) + (shift_2) + (shift_3);
		end
		{`DECAY, `S2}: begin
			out_reg = (shift_1) + (shift_2) + (shift_4);
		end
		{`DECAY, `S3}: begin
			out_reg = (shift_1) + (shift_2); 
		end
		{`DECAY, `S4}: begin
			out_reg = (shift_1) + (shift_3) + (shift_4) + (shift_6);
		end
		{`DECAY, `S5}: begin
			out_reg = (shift_1) + (shift_3) + (shift_5);
		end
		{`DECAY, `S6}: begin
			out_reg = (shift_1) + (shift_3); 
		end
		{`DECAY, `S7}: begin
			out_reg = (shift_1) + (shift_4) + (shift_6);
		end
		{`DECAY, `S8}: begin
			out_reg = (shift_1) + (shift_5);
		end
		{`DECAY, `S9}: begin
			out_reg = (shift_1);
		end
		6'b10xxxx: begin //SUSTAIN
			out_reg = (shift_1);
		end
		{`RELEASE, `S0}: begin
			out_reg = (shift_1);
		end
		{`RELEASE, `S1}: begin
			out_reg = (shift_2) + (shift_3) + (shift_4);
		end
		{`RELEASE, `S2}: begin
			out_reg = (shift_2) + (shift_3) + (shift_5);
		end
		{`RELEASE, `S3}: begin
			out_reg = (shift_2) + (shift_4) + (shift_5);
		end
		{`RELEASE, `S4}: begin
			out_reg = (shift_2) + (shift_4);
		end
		{`RELEASE, `S5}: begin
			out_reg = (shift_2);
		end
		{`RELEASE, `S6}: begin
			out_reg = (shift_3) + (shift_4) + (shift_6);
		end
		{`RELEASE, `S7}: begin
			out_reg = (shift_3) + (shift_5);
		end
		{`RELEASE, `S8}: begin
			out_reg = (shift_4) + (shift_5);
		end
		{`RELEASE, `S9}: begin
			out_reg = (shift_4);
		end
		default: begin
			out_reg = 16'b0;
		end
	endcase
	
end

wire signed [15:0] delay_sample_out;

/*
dffr #(.WIDTH(16)) timing_dffr (
	.clk(clk),
	.r(reset),
	.d(out_reg),
	.q(delay_sample_out)
);
*/

assign sample_out = out_reg;

endmodule
