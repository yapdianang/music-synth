`include "dvi_defines.v"
`timescale 1ns/ 1ps

module wave_display_tb();

reg clk, reset, generate_next, display_idle, valid;
wire sample_ready;
wire write_en, read_index;
wire [8:0] write_address, read_address;
wire [7:0] write_sample, read_sample;
wire [15:0] sample_out; 
reg [19:0] step_size; 
wire chip_data_enable, chip_hsync, chip_vsync, chip_reset, xclk, xclk_n;
wire [11:0] chip_data;
wire [`log2NUM_COLS-1:0] x;
wire [`log2NUM_ROWS-1:0] y;

wire valid_pixel;
wire [7:0] wd_r, wd_g, wd_b;

sine_reader dut_sr(
    .clk (clk),
    .reset (reset),
    .step_size (step_size),
    .generate_next(generate_next),

    .sample_ready(sample_ready),
    .sample (sample_out)
);

wave_capture dut_wc(
    .clk(clk),
    .reset(reset),
    .new_sample_ready(sample_ready),
    .new_sample_in (sample_out),
    .wave_display_idle (display_idle),

    .write_address(write_address),
    .write_enable(write_en),
    .write_sample (write_sample),
    .read_index (read_index)
);

ram_1w2r #(.WIDTH(8), .DEPTH(9)) dut_sample_ram(
	.clka(clk),
	.clkb(clk),
	.wea(write_en),
	.addra(write_address),
	.dina(write_sample),
	.douta(),
	.addrb(read_address),
	.doutb(read_sample)
);
 


wave_display dut_wd(
	.clk(clk),
	.reset(reset),
	.x(x),
	.y(y),
	.valid(valid),
	.read_address(read_address),
	.read_value(read_sample),
	.read_index(read_index),
	.valid_pixel(valid_pixel),
	.r(wd_r), .g(wd_g), .b(wd_b)
);

    
dvi_controller_top dut_dvi_controller(
    .clk(clk),
    .enable(1'b1),
    .reset(reset),
    .r(wd_r),
    .g(wd_g),
    .b(wd_b),
    .chip_data_enable(chip_data_enable),
    .chip_hsync(chip_hsync),
    .chip_vsync(chip_vsync),
    .chip_reset(chip_reset),
    .chip_data(chip_data),
    .x(x),
    .y(y),
    .xclk(xclk),
    .xclk_n(xclk_n)
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
	@(negedge chip_vsync);
	display_idle = 1;
	valid = 1;
	step_size = {10'd159, 10'd062}; //5A#Bb
	#1000
	step_size = {10'd337, 10'd942}; //6B
	#1000
	#200
	step_size = {10'd159, 10'd062}; //5A#Bb
end
	 
endmodule
