`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Avoy Datta
// 
// Create Date:    16:00:33 03/09/2019 
// Module Name:    echo_tb 
// Project Name: music-synth

// Description: 
//		Test bench for echo
//////////////////////////////////////////////////////////////////////////////////
module echo_tb();

reg clk, reset, in_ready, next_D, next_H;
wire out_ready;
reg [15:0] sample_in; 
wire [15:0] sample_out; 

echo dut_echo(
	.clk(clk),
	.reset(reset),
	.sample_in(sample_in),
	.in_ready(in_ready),
	.next_D(next_D),
	.next_H(next_H),
	.out(sample_out),
	.out_ready(out_ready)
);

// Clock and reset
 initial begin
	  clk = 1'b0;
	  reset = 1'b1;
	  repeat (4) #5 clk = ~clk;
	  reset = 1'b0;
	  forever #5 clk = ~clk;
 end

initial begin
	next_D = 1'b0;
	next_H = 1'b0;
	in_ready = 1'b1;
	sample_in = 16'd1;
	forever #255 sample_in = sample_in ? 16'd0 : 16'd1;
end

	 
endmodule
