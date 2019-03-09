`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Avoy Datta
// 
// Create Date:    00:24:59 03/09/2019 
// Module Name:    shifter 
// Project Name: 	`music-synth

// Description: Arithmetically shifts input left(0) or right (1) based on direction(0/1). 
//	Note that sign is preserved during shifting 
//////////////////////////////////////////////////////////////////////////////////
module shifter #(parameter WIDTH = 16)(
	input wire [WIDTH - 1:0] in,
	input wire [1:0] distance, 
	input wire direction, 
	output wire [WIDTH - 1:0] out
);

// Declarations

wire [WIDTH - 1:0] rot_r;
wire [WIDTH - 1:0] rot_l;

// Rotating logic
assign rot_l = in <<< distance;
assign rot_r = in >>> distance;

assign out = direction ? rot_r : rot_l;

endmodule

