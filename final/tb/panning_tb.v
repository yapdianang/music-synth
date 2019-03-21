`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Avoy Datta
// 
// Create Date:    23:21:01 03/21/2019 
// Module Name:    panning_tb 
// Project Name: music-synth
// Target Devices: FPGA
// Description: Test-bench for attack-decay-sustain-release
//
// Dependencies: 
// 	adsr.v
//////////////////////////////////////////////////////////////////////////////////
module panning_tb();

reg clk, reset; // generate_next;
reg in_ready;
wire out_ready;
reg signed [15:0] sample_in;
wire signed [15:0] sample_out_1; 
wire signed [15:0] sample_out_2; 

panning dut_panning(
   .clk(clk),
	.reset(reset),
	.sample_in(sample_in),
	.in_ready (in_ready),
	.out_L (sample_out_1),
	.out_R(sample_out_2),
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
	  #5
	  forever begin
	  //@(posedge clk);
	  #50
	  in_ready <= 1'b1;
	  sample_in <= 16'b0111111111111111;
	  #10	  
	  in_ready <= 1'b0;
	  //@(posedge clk);
	  #40
	  sample_in <= 16'b0000000000000000;
	  end
end

endmodule
