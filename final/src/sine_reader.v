`define MAX_MEM 10'd1023;

module sine_reader(
    input clk,
    input reset,
    input [19:0] step_size,
    input generate_next,

    output sample_ready,
    output wire [15:0] sample
);


// counter, width 22 bits.  {quadrant (2 bits), raw address (10 bits), precision (10 bits)}
wire [21:0] next_address;
wire [21:0] current_address;
wire [15:0] sine_rom_output, prev_sample;
reg [15:0] sample_reg;
reg [9:0] sine_rom_input_addr;			// 10 bit wide, feed into sine rom
wire [1:0] delayed_current_MSBs;
wire [5:0] six_b = 6'b10;

//Truncated next and curr addresses to monitor signals
wire[9:0] step = step_size[19:10];
wire [9:0] next_addr = next_address[19:10];
wire [9:0] curr_addr = current_address[19:10];

sine_rom local_sine_rom(
	.clk(clk),
	.addr(sine_rom_input_addr),
	.dout(sine_rom_output)
);


// 22 bit flip flop to store address for counter.
dffre #(.WIDTH(22)) counter_ff(
	.clk(clk),
	.r(reset),
	.en(generate_next),
	.d(next_address),
	.q(current_address)
);   

assign next_address = current_address + {2'd0, step_size};

dffr #(.WIDTH(2)) sample_select(
	.clk(clk),
	.r(reset),
	.d(current_address[21:20]),
	.q(delayed_current_MSBs)
); 

dffr #(.WIDTH(16)) sample_state(
	.clk(clk),
	.r(reset),
	.d(sample),
	.q(prev_sample)
);

always @(*) begin
	case (delayed_current_MSBs) 
		2'b00: begin
			sine_rom_input_addr = (current_address[21:20] == 2'b00)? current_address[19:10] : 10'd1023 + (10'b0 - current_address[19:10]);
			sample_reg = sine_rom_output;
			end
		2'b01: begin
			sine_rom_input_addr = (current_address[21:20] == 2'b01)? 10'd1023 + (10'b0 - current_address[19:10]) : current_address[19:10];
			sample_reg = sine_rom_output;
			end
		2'b10: begin 
			sine_rom_input_addr = (current_address[21:20] == 2'b10)? current_address[19:10] : 10'd1023 + (10'b0 - current_address[19:10]);
			sample_reg =  16'b0 - sine_rom_output;
			end
		2'b11:
			begin		
			sine_rom_input_addr = (current_address[21:20] == 2'b11)? 10'd1023 + (10'b0 - current_address[19:10]) : current_address[19:10];
			sample_reg = 16'b0 - sine_rom_output;
			end
		default: begin
			sine_rom_input_addr =  current_address[19:10];
			sample_reg = sine_rom_output;
			end
	endcase
end

assign  sample = sample_reg;
assign sample_ready = ~(prev_sample == sample);

endmodule
