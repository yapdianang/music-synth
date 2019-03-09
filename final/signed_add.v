`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Avoy Datta
// 
// Create Date:    01:49:40 03/09/2019 
// Module Name:    signed_add 
// Project Name: music-synth

// Description: Performs addition over two signed inputs, with necessary padding to prevent overflow

//////////////////////////////////////////////////////////////////////////////////
module signed_add #(parameter WIDTH = 16)(
	input signed [WIDTH-1:0] inA,
	input signed [WIDTH-1:0] inB,
	output [WIDTH-1:0] out
);

wire signed [2*WIDTH-1:0] padded_A, padded_B, padded_out; 

assign padded_A = inA[WIDTH-1] ? {1'b1, inA} : {1'b0, inA};
assign padded_B = inB[WIDTH-1] ? {1'b1, inB} : {1'b0, inB};

assign padded_out = padded_A + padded_B;
assign out = padded_out[WIDTH:1];

endmodule
