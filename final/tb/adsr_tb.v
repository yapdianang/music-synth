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

reg clk, reset; // generate_next;
reg in_ready;
wire out_ready;
reg signed [15:0] sample_in;
wire signed [15:0] sample_out; 

adsr dut_adsr(
   .clk(clk),
	.reset(reset),
	.sample_in(sample_in),
	.in_ready (in_ready),
	.sample_out (sample_out),
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
/*
// Test with varying notes
initial begin
		reset = 1'b1;
		play_enable = 1;
		{note_to_load, duration_to_load} = {6'd57, 6'd5};
		load_new_note = 1;
		#50
		reset = 1'b0;
		load_new_note = 0;
		#2000
		play_enable = 0;
		#200;
		play_enable = 1;
		#500
		load_new_note = 1'b1;
		{note_to_load, duration_to_load} = {6'd1, 6'd8};
		#10
		load_new_note = 1'b0;
		#1000
		load_new_note = 1'b1;
		{note_to_load, duration_to_load} = {6'd51, 6'd50};
		#10
		load_new_note = 1'b0;
		#4000
		
		play_enable = 0;
end
*/
endmodule
