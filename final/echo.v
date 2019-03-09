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
module echo(
	input clk;
	input reset;
	input [15:0] sample_in;
	input ready;
	output [15:0] echoed;
	output flopped_ready
    );



endmodule
