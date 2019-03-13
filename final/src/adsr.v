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
//////////////////////////////////////////////////////////////////////////////////
`define ATTACK 2'd0
`define DECAY 2'd1
`define SUSTAIN 2'd2
`define RELEASE 2'd3
`define t_a 4800 
`define t_d 4800
`define t_s 4800
`define t_r 4800

module adsr(
	input clk,
	input signed [15:0] sample_in,
	input in_ready,
	output signed [15:0] sample_out
    );

wire [3:0] curr_state;
reg [3;0] next_state;

curr_state = 
endmodule
