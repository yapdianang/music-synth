`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Avoy Datta
// 
// Create Date:    16:00:33 03/09/2019 
// Module Name:    echo_tb 
// Project Name: music-synth

// Description: 
//		Test bench for echo module
//////////////////////////////////////////////////////////////////////////////////
module echo_tb();

reg clk, reset, next_D, next_H, generate_next;
wire in_ready, out_ready;
wire [15:0] sample_in, sample_out; 
reg [19:0] step_size;

sine_reader dut_sr(
    .clk (clk),
    .reset (reset),
    .step_size (step_size),
    .generate_next(generate_next),
	 
    .sample_ready(in_ready),
    .sample (sample_in)
);   

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

//Toggles generate_next on and off with period of 2 * clk periods. This is also the time interval for sample requests
initial begin
	forever begin
	  @(negedge clk);
	  generate_next = 1'b1;
	  @(negedge clk);
	  generate_next = 1'b0;
	end
end 

initial begin
	step_size = {10'd337, 10'd942};
	next_D = 1'b0;
	next_H = 1'b0;
	#200
	@(negedge reset);
	@(negedge clk);
	//forever #2 addr = addr + 1;
	#10000000
	$finish;	
end

initial begin
	next_D = 1'b0;
	next_H = 1'b0;
end



endmodule
