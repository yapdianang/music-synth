`define NORMAL 4'b0000
`define TRIANGLE1 4'b0001
`define SQUARE 4'b0010 
`define TRIANGLE2 4'b0011
`define VIOLIN 4'b0100
`define CLARINET 4'b0101
`define TRUMPET 4'b0110
`define CUSTOM 4'b0111


module  note_player (
    input clk,
    input reset,
    input play_enable,  // When high we play, when low we don't.
    input [5:0] note_to_load,  // The note to play
    input [5:0] duration_to_load,  // The duration of the note to play
    input load_new_note,  // Tells us when we have a new note to load
    output done_with_note,  // When we are done with the note this stays high.
    input beat,  // This is our 1/48th second beat
    input generate_next_sample,  // Tells us when the codec wants a new sample
    output [15:0] sample_out,  // Our sample output
    output new_sample_ready,  // Tells the codec when we've got a sample
	 input [3:0] instrument
);

wire [19:0] fr_out, step_size;

//wire release_note;
wire delay_load_new_note, play_note;
wire rdy_1, rdy_2, rdy_3, rdy_4, rdy_5, rdy_6, rdy_7;
wire [15:0] out_1, out_2, out_3, out_4, out_5, out_6, out_7;
assign step_size = (play_enable && play_note) ? fr_out:20'b0;

dffre #(.WIDTH(1)) load_new_dff(
    .clk(clk),
    .r(reset),
    .en(play_enable),
    .d(load_new_note),
    .q(delay_load_new_note)
);

dffre #(.WIDTH(1)) pause_dff(
    .clk(clk),
    .r(reset),
    .en(load_new_note | done_with_note),
    .d(~play_note),
    .q(play_note)
);

countdown_timer ct(
	.clk(clk),
	.reset(reset),
	.playing(play_enable),
	.load_new(delay_load_new_note),
	.duration(duration_to_load),
	.beat(beat),
	.done(done_with_note)
);

frequency_rom fr(
	.clk(clk),
	.addr(note_to_load),
	.dout(fr_out)
);

sine_reader first_harmonic(
	.clk(clk),
	.reset(reset),
	.step_size(step_size),
	.generate_next(generate_next_sample),
	.sample_ready(rdy_1),
	.sample(out_1)
);

sine_reader second_harmonic(
	.clk(clk),
	.reset(reset),
	.step_size(step_size<< 1),
	.generate_next(generate_next_sample),
	.sample_ready(rdy_2),
	.sample(out_2)
);

sine_reader third_harmonic(
	.clk(clk),
	.reset(reset),
	.step_size((step_size<< 1) + step_size),
	.generate_next(generate_next_sample),
	.sample_ready(rdy_3),
	.sample(out_3)
);

sine_reader forth_harmonic(
	.clk(clk),
	.reset(reset),
	.step_size(step_size<< 2),
	.generate_next(generate_next_sample),
	.sample_ready(rdy_4),
	.sample(out_4)
);

sine_reader fifth_harmonic(
	.clk(clk),
	.reset(reset),
	.step_size((step_size<<2) + (step_size)),
	.generate_next(generate_next_sample),
	.sample_ready(rdy_5),
	.sample(out_5)
);

sine_reader sixth_harmonic(
	.clk(clk),
	.reset(reset),
	.step_size((step_size<<2) + (step_size << 1)),
	.generate_next(generate_next_sample),
	.sample_ready(rdy_6),
	.sample(out_6)
);

sine_reader seventh_harmonic(
	.clk(clk),
	.reset(reset),
	.step_size((step_size<<2) + (step_size << 1) + step_size),
	.generate_next(generate_next_sample),
	.sample_ready(rdy_7),
	.sample(out_7)
);

reg [16:0] sample_out_reg;

always @(*) begin
	case (instrument)
		`NORMAL: begin
			sample_out_reg =  ($signed(out_1) >>> 1);
		end
		`TRIANGLE1: begin
			sample_out_reg = (($signed(out_1) >>> 1) + ($signed(out_2) >>> 2) + ($signed(out_3) >>> 3) + ($signed(out_4) >>> 4) + ($signed(out_5) >>> 25) + ($signed(out_6) >>> 6) + ($signed(out_7) >>> 7) );
		end
		`SQUARE: begin
			sample_out_reg =  ((($signed(out_1) >>> 2) + ($signed(out_1) >>> 4)) + (($signed(out_3) >>> 4) + ($signed(out_3) >>> 5))  + (($signed(out_5) >>> 4) + ($signed(out_5) >>> 9)) + (($signed(out_7) >>> 5) + ($signed(out_7) >>> 6)));
		end
		`TRIANGLE2: begin
			sample_out_reg =  (($signed(out_1) >>> 1) + ($signed(out_2) >>> 2) + (($signed(out_3) >>> 3) + ($signed(out_3) >>> 5)) + ($signed(out_4) >>> 3) + (($signed(out_5) >>> 4) + ($signed(out_5) >>> 5)) + (($signed(out_6) >>> 4) + ($signed(out_6) >>> 6) + ($signed(out_6) >>> 7)) + (($signed(out_7) >>> 4) + ($signed(out_7) >>> 6)));
		end
		`VIOLIN: begin
			sample_out_reg =  (($signed(out_1) >>> 1) + ($signed(out_2) >>> 3) + ($signed(out_3) >>> 5) + ($signed(out_4) >>> 7) + ($signed(out_5) >>> 7) + ($signed(out_6) >>> 8) + ($signed(out_7) >>> 9));
		end
		`CLARINET: begin
			sample_out_reg =  (($signed(out_1) >>> 3) + ($signed(out_2) >>> 6) + ($signed(out_3) >>> 3) + ($signed(out_4) >>> 4) + ($signed(out_5) >>> 3) + ($signed(out_6) >>> 4) + ($signed(out_7) >>> 3));
		end
		`TRUMPET: begin
			sample_out_reg =  (($signed(out_1) >>> 4) + ($signed(out_2) >>> 3) + ($signed(out_3) >>> 3) + ($signed(out_4) >>> 3) + ($signed(out_5) >>> 3) + ($signed(out_6) >>> 3) + ($signed(out_7) >>> 4));
		end
		`CUSTOM: begin
			sample_out_reg =  (($signed(out_1) >>> 3) + ($signed(out_2) >>> 3) + ($signed(out_3) >>> 3) + ($signed(out_4) >>> 5) + ($signed(out_5) >>> 5) + ($signed(out_6) >>> 5) + ($signed(out_7) >>> 4));
		end
		default: begin
			sample_out_reg = out_1;
		end
	endcase
end

assign sample_out = sample_out_reg;

assign new_sample_ready = (rdy_1 & rdy_2 & rdy_3 & rdy_4 & rdy_5 & rdy_6 & rdy_7);

endmodule

