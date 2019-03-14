`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: EE108
// Engineer: A.D.
// 
// Create Date:    17:18:06 03/08/2019 
// Design Name: echo
// Module Name:    echo 
// Project Name: music-synth
// Description: Takes in time series and outputs an echoed version of signal
//
// Dependencies: None
//////////////////////////////////////////////////////////////////////////////////

`define DELAY1 15'd4800 
`define DELAY2 15'd9600
`define DELAY3 15'd14400 
`define DELAY4 15'd19200
`define DELAY5 15'd24000
`define MAX_ADDR 15'd32767
`define RAM_WIDTH 16
`define RAM_DEPTH 15 //RAM is capable of storing 2^15 addresses

/*
next_D and next_H go HIGH for one clk cycle when user desires to increase delay and attenuation respectively.
Delay varies between 100 ms (4800 samples) and 500 ms (240000) samples
Attenuation varies between x1 and x(1/8) 
*/
module echo(
	input clk,
	input reset,
	input signed [15:0] sample_in,
	input in_ready,
	input next_D,
	input next_H,
	output signed [15:0] out,
	output out_ready
);

assign out_ready = in_ready;


wire [2:0] next_delay_state, curr_delay_state;
reg [14:0] delay;
wire signed [15:0] echo, delayed;
wire [14:0] next_read_addr, curr_read_addr, curr_write_addr;
wire [1:0] curr_att_state, next_att_state;

dffre #(3) delay_ff(.clk(clk), .r(reset), .en(next_D), .d(next_delay_state), .q(curr_delay_state));
dffre #(2) att_ff(.clk(clk), .r(reset), .en(next_H), .d(next_att_state), .q(curr_att_state));
//dffr #(15) write_ff(.clk(clk), .r(reset), .d(next_write_addr), .q(curr_write_addr));
dffre #(15) read_ff(.clk(clk), .r(reset), .en(in_ready), .d(next_read_addr), .q(curr_read_addr));


assign next_delay_state = (curr_delay_state == 3'd4) ? 3'd0 : curr_delay_state + 3'd1;

assign next_att_state = curr_att_state + 2'd1;

//assign next_write_addr = (curr_write_addr == MAX_ADDR) ? 15'd0 : (next_D ? delay : curr_write_addr + 15'd1);
assign next_read_addr = ((curr_read_addr == `MAX_ADDR) | next_D) ? 15'd0 : curr_read_addr + 15'd1;
assign curr_write_addr = (curr_read_addr + delay > `MAX_ADDR) ? 
								  curr_read_addr + delay - (1 + `MAX_ADDR) : curr_read_addr + delay;

always @(*) begin
	case(curr_delay_state)
	 3'd0 : begin
		delay = `DELAY1;
	 end
	 3'd1: begin
		delay = `DELAY2;
	 end
	 3'd2: begin
		delay = `DELAY3;
	 end
	 3'd3: begin
		delay = `DELAY4;
	 end
	 3'd4: begin
		delay = `DELAY5;
	 end
	 default : begin
		delay = `DELAY1;
	 end
	endcase
end

/*
RAM that stores delayed values. Write address should ALWAYS lead read_addr by `delay' addresses, assuming both 
read_addr and write_addr increment by 1 at each step.
We use port A only to write, and port B to read. We don't care about value returned from addr_A.
*/
ram_1w2r #(`RAM_WIDTH, `RAM_DEPTH) RAM  (
    .clka(clk), //Read-write port a, only used to write
    .wea(1), //Port a used to write to RAM
    .addra(curr_write_addr), 
    .dina(sample_in),
    .douta(),
    .clkb(clk), // Read-only port B 
    .addrb(curr_read_addr),
    .doutb (delayed)
);

shifter #(16) attenuator(
	.in(delayed), //width 16
	.distance(curr_att_state), //width 2
	.direction(1), //Shifts right, preserves sign 
	.out(echo) //width 16
);

signed_add #(16) adder (
	.inA (sample_in),
	.inB (echo),
	.out(out)
);

endmodule
