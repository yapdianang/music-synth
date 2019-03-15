`define ZEROS 8'b00000000
`define FINAL_COUNT 8'b11111111
`define ARMED 2'b00
`define ACTIVE 2'b01
`define WAIT 2'b10

module wave_capture (
    input clk,
    input reset,
    input new_sample_ready,
    input [15:0] new_sample_in,
    input wave_display_idle,
    output wire [8:0] write_address,
    output wire write_enable,
    output wire [7:0] write_sample,
    output wire read_index
);
reg [7:0] next_count;
wire [7:0] count;
//reg read_idx_reg;
reg [1:0] next_state;
wire [1:0] state;
wire [15:0] prev_sample;

//DFFRE allows count to only be incremented when new sample is ready
dffre #(.WIDTH(8)) count_up_ff(
	.clk(clk),
	.r(reset),
	.en(new_sample_ready),
	.d(next_count),
	.q(count)
);

dffr #(.WIDTH(2)) state_ff(
	.clk(clk),
	.r(reset),
	.d(next_state),
	.q(state)
);

//DFF used to keep track of previous sample
dffr #(.WIDTH(16)) sample_state_ff(
	.clk(clk),
	.r(reset),
	.d(new_sample_in),
	.q(prev_sample)
);

dffre #(.WIDTH(1)) read_idx_ff(
	.clk(clk),
	.r(reset),
	.en(state == `WAIT & wave_display_idle == 1'b1),
	.d(~read_index),
	.q(read_index)
);

//Detects the positive zero crossing
wire pos_crossing = (prev_sample[15] == 1) & (new_sample_in[15] == 0);

always @ (*) begin
	case (state)
		`ARMED: begin
			next_state =  pos_crossing ? `ACTIVE : state;
			next_count = 8'b0;
			//read_idx_reg = reset ? 1'b0 : read_idx_reg;
		end
		`ACTIVE: begin
			next_state = (count == `FINAL_COUNT) ? `WAIT : state;
			next_count = count + 8'd1;
			//read_idx_reg = reset ? 1'b0 : read_idx_reg;
		end
		`WAIT: begin
			next_count = 8'b0;
			if (wave_display_idle == 1'b1) begin
				//read_idx_reg = reset ? 1'b0 : ~read_idx_reg;
				next_state = `ARMED;
			end else begin
				//read_idx_reg = reset ? 1'b0 : read_idx_reg;
				next_state = `WAIT;
			end
			 
		end
	default: begin
		next_state = `ARMED;
		next_count = 8'b0;
		//read_idx_reg = reset ? 1'b0 : read_idx_reg;
	end
	endcase
	
end

//assign read_index = read_idx_reg;
assign write_address = {~read_index, count};

//Only write to RAM when state is ACTIVE
assign write_enable = (state == `ACTIVE) ? 1'b1 : 1'b0; 

//To bias the signed format to unsigned, we flip the MSB in new_sample_in
assign write_sample = new_sample_in[15:8] ^ 8'b10000000;

endmodule


//assign write_sample = (new_sample_in[15] == 1'b1) ? {1'b0, new_sample_in[14 : 8]} : {1'b1, new_sample_in[14 : 8]};
