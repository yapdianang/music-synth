`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Avoy Datta
// 
// Create Date:    23:21:01 03/13/2019 
// Module Name:    adsr_tb 
// Project Name: music-synth
// Target Devices: FPGA
// Description: Test-bench for attack-decay-sustain-release
//
// Dependencies: 
// 	adsr.v
//////////////////////////////////////////////////////////////////////////////////
module adsr_tb();

reg clk, reset, generate_next;
wire in_ready, out_ready;
wire [15:0] sample_in, sample_out; 
reg [19:0] step_size;

	
endmodule
