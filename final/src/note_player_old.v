module note_player_old(
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
    output new_sample_ready  // Tells the codec when we've got a sample
);

// wire pausing;
wire [19:0] fr_out, step_size;
//wire [15:0] next_sample;
//wire [15:0] sample_out_wire;

wire release_note;
assign step_size = play_enable ? fr_out:20'b0;
/*
assign step_size = (play_enable & release_note)? fr_out:20'b0;
dffre #(.WIDTH(1)) hold_ff(
	.clk(clk),
	.r(reset),
	.en(load_new_note | done_with_note),
	.d(~release_note),
	.q(release_note)
);  
*/

countdown_timer ct(
	.clk(clk),
	.reset(reset),
	.playing(play_enable),
	.load_new(load_new_note),
	.duration(duration_to_load),
	.beat(beat),
	.done(done_with_note)
);

frequency_rom fr(
	.clk(clk),
	.addr(note_to_load),
	.dout(fr_out)
);

sine_reader sr(
	.clk(clk),
	.reset(reset),
	.step_size(step_size),
	.generate_next(generate_next_sample),
	.sample_ready(new_sample_ready),
	.sample(sample_out)
);



endmodule
