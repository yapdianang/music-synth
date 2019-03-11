// sends a high pulse for one cycle if finished counting down from duration to 0.

`timescale 1ns / 1ps
`define ZEROS 6'b000000

module countdown_timer(
		input clk,
		input reset,
		input playing,      // stays low if we want to pause, pauses the timer
		input load_new,   // high if we want to load a new duration
		input [5:0] duration,
		input beat,      // goes high evert 1/48th of a second
		output wire done
    );

wire [5:0] count;
reg [5:0] next_count;
//reg toggle;

dffre #(.WIDTH(6)) countdown(
	.clk(clk),
	.r(reset),
	.en(playing),
	.d(next_count),
	.q(count)
);
/*
wire next_end, curr_end;
// if ended, then curr_end stays high
dffr ended(
	.clk(clk),
	.r(reset),
	.d(next_end),
	.q(curr_end)
);

always @(*) begin
	next_count = (count == `ZEROS) ? `ZEROS : (load_new ? duration : (count - 6'b000001));

	if (reset) begin
		next_dount = `ZEROS;
	end else if (load_new) begin
		next_count = duration;
	end else if (beat) begin
		next_count = (count == `ZEROS) ? `ZEROS: (count - 6'b000001);
	end else begin
		next_count = count;
	end
	
end
 */
 
wire delay1, delay2;
reg next_delay1, next_delay2;

dffre delay1_dff(
    .clk(clk),
    .r(reset),
    .en(playing),
    .d(next_delay1),
    .q(delay1)
);

dffre delay2_dff(
    .clk(clk),
    .r(reset),
    .en(playing),
    .d(next_delay2),
    .q(delay2)
);

reg next_state;
wire state;
dffre state_dff(
    .clk(clk),
    .r(reset),
    .en(playing),
    .d(next_state),
    .q(state)
);

`define STATE_COUNTING 1'b0
`define STATE_DONE 1'b1

// I think there have to be two clocks here, because the new sine wave will only start after two clock cycles
always @(*) begin
	case (state)  
		`STATE_COUNTING : begin
			
			if (count > `ZEROS && count != 6'b000001) begin
				// check if we are supposed to load new, else count down every 1/48th of a second
				next_state = `STATE_COUNTING;
				next_count = load_new ? duration : (beat ? (count - 6'b000001) : count);
			end else if (count == 6'b000001) begin
				// if not load_new, keep the count down at zero once hits zero
				next_state = beat ? `STATE_DONE : `STATE_COUNTING;
				next_count = load_new ? duration : (beat ? (count - 6'b000001) : count);
			end else begin
				next_state = load_new ? ((duration == `ZEROS) ? `STATE_DONE : `STATE_COUNTING) : `STATE_COUNTING;
				next_count = load_new ? duration : count;
			end
		end
		`STATE_DONE : begin
			//next_count = (count == `ZEROS) ? `ZEROS : (load_new ? duration : (beat ? (count - 6'b000001) : count));
			next_count = (count == `ZEROS) ? `ZEROS : (load_new ? duration : count);
			next_state = `STATE_COUNTING;
		end
		default: begin
			next_count = (count == `ZEROS) ? duration : (beat ? (count - 6'b000001) : count);
			next_state = `STATE_DONE;
			end
	endcase  
	
	// two flip flops to delay timer, because takes two clock cycles to output corresponding sample
	next_delay1 = playing ? (state == `STATE_DONE) : 1'b0;
	next_delay2 = delay1;
end
 
// assign done = playing ? delay2 : 1'b0;
assign done =  playing ? (state == `STATE_DONE) : 1'b0;


// not ended yet if we reset, or count != zeros, or load_new is high
// assign next_end = reset ? 1'b0 : ((count == `ZEROS) & (~load_new));
//assign done = (curr_end == 1'b0) & next_end;

endmodule

