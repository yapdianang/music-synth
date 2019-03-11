`timescale 1ns / 1ps

module wave_capture_tb();

reg clk, reset, display_idle;
reg generate_next;
wire sample_ready;
wire write_en, read_index;
wire [8:0] RAM_address;
wire [7:0] write_sample;
wire [15:0] sample_out; 
reg [19:0] step_size;


wave_capture dut_wc(
    .clk(clk),
    .reset(reset),
    .new_sample_ready(sample_ready),
    .new_sample_in (sample_out),
    .wave_display_idle (display_idle), // set to 1 always
    .write_address(RAM_address),
    .write_enable(write_en),
    .write_sample (write_sample),
    .read_index (read_index)
);

sine_reader dut_sr(
    .clk (clk),
    .reset (reset),
    .step_size (step_size),
    .generate_next(generate_next),
	 
    .sample_ready(sample_ready),
    .sample (sample_out)
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
	forever begin
	  @(negedge clk);
	  generate_next = 1'b1;
	  @(negedge clk);
	  generate_next = 1'b0;
	end
end 

initial begin
	display_idle = 0;
	step_size = {10'd337, 10'd942};
	#200
	display_idle = 1;
	@(negedge reset);
	@(negedge clk);
	//forever #2 addr = addr + 1;
	#10000000
	display_idle = 0;
	$finish;
	
	
end
	 
endmodule
