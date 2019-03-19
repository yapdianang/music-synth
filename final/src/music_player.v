

//
//  music_player module
//
//  This music_player module connects up the MCU, song_reader, note_player,
//  beat_generator, and codec_conditioner. It provides an output that indicates
//  a new sample (new_sample_generated) which will be used in lab 5.
//

  module music_player(
    // Standard system clock and reset
    input clk,
    input reset,

    // Our debounced and one-pulsed button inputs.
    input play_button,
    input next_button,

    // The raw new_frame signal from the ac97_if codec.
    input new_frame,

    // This output must go high for one cycle when a new sample is generated.
    output wire new_sample_generated,

    // Our final output sample to the codec. This needs to be synced to
    // new_frame.
    output wire [15:0] sample_out,
	 input [3:0] instruments,
	 input new_instrument,
	 output [15:0] wave1_out, 
	 output [15:0] wave2_out, 
	 output [15:0] wave3_out
);
    // The BEAT_COUNT is parameterized so you can reduce this in simulation.
    // If you reduce this to 100 your simulation will be 10x faster.
    parameter BEAT_COUNT = 1000;


//
//  ****************************************************************************
//      Master Control Unit
//  ****************************************************************************
//   The reset_player output from the MCU is run only to the song_reader because
//   we don't need to reset any state in the note_player. If we do it may make
//   a pop when it resets the output sample.
//
 
    wire play;
    wire reset_player;
    wire [1:0] current_song;
    wire song_done;
    mcu mcu(
        .clk(clk),
        .reset(reset),
        .play_button(play_button),
        .next_button(next_button),
        .play(play),
        .reset_player(reset_player),
        .song(current_song),
        .song_done(song_done)
    );

//  ****************************************************************************
//      Song Reader
//  ****************************************************************************
	 wire beat;
    wire [5:0] note_to_play;
    wire [5:0] duration_for_note;
    wire new_note1, new_note2, new_note3;
    wire note_done1, note_done2, note_done3;
	 wire np1_busy, np2_busy, np3_busy;
    song_reader song_reader(
        .clk(clk),
        .reset(reset | reset_player),
        .play(play),
		  .beat(beat),
        .song(current_song),
        .song_done(song_done),
        .note(note_to_play),
        .duration(duration_for_note),
        .new_note1(new_note1),
		  .new_note2(new_note2),
		  .new_note3(new_note3),
        .note_done1(note_done1),
		  .note_done2(note_done2),
		  .note_done3(note_done3),
		  .np1_busy(np1_busy),
		  .np2_busy(np2_busy),
		  .np3_busy(np3_busy)
    );

//   
//  ****************************************************************************
//      Note Player
//  ****************************************************************************
//  Making three note players

   
    wire generate_next_sample;
    wire [15:0] note_sample, note_sample1, note_sample2, note_sample3;
    wire note_sample_ready, note_sample_ready1, note_sample_ready2, note_sample_ready3;
	 wire [5:0] note_np1, duration_np1;
	 wire [5:0] note_np2, duration_np2;
	 wire [5:0] note_np3, duration_np3;
	// wire [15:0] out1, out2;
	// wire play_note1, play_note2, play_note3;
	 
	 // dffs to keep track of which note player gets the new note and duration
	 dffre #(.WIDTH(6)) np1_note_dff(
    .clk(clk),
    .r(reset),
    .en(new_note1),
    .d(note_to_play),
    .q(note_np1)
	);

	dffre #(.WIDTH(6)) np1_duration_dff(
    .clk(clk),
    .r(reset),
    .en(new_note1),
    .d(duration_for_note),
    .q(duration_np1)
	);
	
	 dffre #(.WIDTH(6)) np2_note_dff(
    .clk(clk),
    .r(reset),
    .en(new_note2),
    .d(note_to_play),
    .q(note_np2)
	);

	dffre #(.WIDTH(6)) np2_duration_dff(
    .clk(clk),
    .r(reset),
    .en(new_note2),
    .d(duration_for_note),
    .q(duration_np2)
	);
	
	 dffre #(.WIDTH(6)) np3_note_dff(
    .clk(clk),
    .r(reset),
    .en(new_note3),
    .d(note_to_play),
    .q(note_np3)
	);

	dffre #(.WIDTH(6)) np3_duration_dff(
    .clk(clk),
    .r(reset),
    .en(new_note3),
    .d(duration_for_note),
    .q(duration_np3)
	);
	
	// dffs to keep track of which note players will be busy
	/*
	dffre #(.WIDTH(1)) busy_np1_dff(
    .clk(clk),
    .r(reset),
    .en(new_note1 | note_done1),
    .d(~play_note1),
    .q(play_note1)
	);
	
	dffre #(.WIDTH(1)) busy_np2_dff(
    .clk(clk),
    .r(reset),
    .en(new_note2 | note_done2),
    .d(~play_note2),
    .q(play_note2)
	);
	
	dffre #(.WIDTH(1)) busy_np3_dff(
    .clk(clk),
    .r(reset),
    .en(new_note3 | note_done3),
    .d(~play_note3),
    .q(play_note3)
	);
	*/
	 
	wire [3:0] delayed_instr_1, delayed_instr_2, delayed_instr_3;
	
	dffre #(.WIDTH(4)) hold_instr_dff1(
    .clk(clk),
    .r(reset),
    .en(new_instrument),
    .d(instruments), 
    .q(delayed_instr_1)
	);
	
	dffre #(.WIDTH(4)) hold_instr_dff2(
    .clk(clk),
    .r(reset),
    .en(new_instrument),
    .d(delayed_instr_1),
    .q(delayed_instr_2)
	);
	
	dffre #(.WIDTH(4)) hold_instr_dff3(
    .clk(clk),
    .r(reset),
    .en(new_instrument),
    .d(delayed_instr_2),
    .q(delayed_instr_3)
	);
	
	
    note_player note_player1(
        .clk(clk),
        .reset(reset),
        .play_enable(play),
        .note_to_load(note_np1),
        .duration_to_load(duration_np1),
        .load_new_note(new_note1),
        .done_with_note(note_done1),
        .beat(beat),
        .generate_next_sample(generate_next_sample),
        .sample_out(note_sample1),
        .new_sample_ready(note_sample_ready1),
		 // .instrument(instruments)
		 .instrument(delayed_instr_1)
    );
	 
	   note_player  note_player2(
        .clk(clk),
        .reset(reset),
        .play_enable(play),
        .note_to_load(note_np2),
        .duration_to_load(duration_np2),
        .load_new_note(new_note2),
        .done_with_note(note_done2),
        .beat(beat),
        .generate_next_sample(generate_next_sample),
        .sample_out(note_sample2),
        .new_sample_ready(note_sample_ready2),
		  //.instrument(instruments)
		  .instrument(delayed_instr_2)
    );
	 
	   note_player note_player3(
        .clk(clk),
        .reset(reset),
        .play_enable(play),
        .note_to_load(note_np3),
        .duration_to_load(duration_np3),
        .load_new_note(new_note3),
        .done_with_note(note_done3),
        .beat(beat),
        .generate_next_sample(generate_next_sample),
        .sample_out(note_sample3),
        .new_sample_ready(note_sample_ready3),
		  //.instrument(instruments)
		  .instrument(delayed_instr_3)
    );
	 
	 
	 wire [15:0] delay_note_sample1, delay_note_sample2, delay_note_sample3;
	 wire [15:0] delay_note_sample1two, delay_note_sample2two, delay_note_sample3two;
	 wire [15:0] delay_note_sample1three, delay_note_sample2three, delay_note_sample3three;
	 wire delay_note_sample_ready, delay_note_sample_ready2, delay_note_sample_ready3;
// delay set 1	 

	 dffr #(.WIDTH(16)) delay_sample1_dff1(
    .clk(clk),
    .r(reset),
    .d(note_sample1),
    .q(delay_note_sample1)
	);
	
	dffr #(.WIDTH(16)) delay_sample2_dff1(
    .clk(clk),
    .r(reset),
    .d(note_sample2),
    .q(delay_note_sample2)
	);
	
	dffr #(.WIDTH(16)) delay_sample3_dff1(
    .clk(clk),
    .r(reset),
    .d(note_sample3),
    .q(delay_note_sample3)
	);
	
// delay set 2
dffr #(.WIDTH(16)) delay_sample1_dff2(
    .clk(clk),
    .r(reset),
    .d(delay_note_sample1),
    .q(delay_note_sample1two)
	);
	
	dffr #(.WIDTH(16)) delay_sample2_dff2(
    .clk(clk),
    .r(reset),
    .d(delay_note_sample2),
    .q(delay_note_sample2two)
	);
	
	dffr #(.WIDTH(16)) delay_sample3_dff2(
    .clk(clk),
    .r(reset),
    .d(delay_note_sample3),
    .q(delay_note_sample3two)
	);


// delay set 3
dffr #(.WIDTH(16)) delay_sample1_dff3(
    .clk(clk),
    .r(reset),
    .d(delay_note_sample1two),
    .q(delay_note_sample1three)
	);
	
	dffr #(.WIDTH(16)) delay_sample2_dff3(
    .clk(clk),
    .r(reset),
    .d(delay_note_sample2two),
    .q(delay_note_sample2three)
	);
	
	dffr #(.WIDTH(16)) delay_sample3_dff3(
    .clk(clk),
    .r(reset),
    .d(delay_note_sample3two),
    .q(delay_note_sample3three)
	);

// flip flops to account for delayed notes
	
	dffr #(.WIDTH(1)) delay_note_sample_ready_dff1(
    .clk(clk),
    .r(reset),
    .d((note_sample_ready1 | note_sample_ready2 | note_sample_ready3)),
    .q(delay_note_sample_ready)
	);
	
	
	dffr #(.WIDTH(1)) delay_note_sample_ready_dff2(
    .clk(clk),
    .r(reset),
    .d(delay_note_sample_ready),
    .q(delay_note_sample_ready2)
	);
	
	dffr #(.WIDTH(1)) delay_note_sample_ready_dff3(
    .clk(clk),
    .r(reset),
    .d(delay_note_sample_ready2),
    .q(delay_note_sample_ready3)
	);
	
	 assign wave1_out = ($signed(delay_note_sample1)>>>2);
	 assign wave2_out = ($signed(delay_note_sample2)>>>2);
	 assign wave3_out = ($signed(delay_note_sample3)>>>2);
	 
  	 assign note_sample = wave1_out + wave2_out + wave3_out;
	 assign note_sample_ready = delay_note_sample_ready;
	 
/*
//  ****************************************************************************
//      Song Reader
//  ****************************************************************************
//
    wire [5:0] note_to_play;
    wire [5:0] duration_for_note;
    wire new_note;
    wire note_done;
    song_reader song_reader(
        .clk(clk),
        .reset(reset | reset_player),
        .play(play),
        .song(current_song),
        .song_done(song_done),
        .note(note_to_play),
        .duration(duration_for_note),
        .new_note(new_note),
        .note_done(note_done)
    );

//   
//  ****************************************************************************
//      Note Player
//  ****************************************************************************
//  
    wire beat;
    wire generate_next_sample;
    wire [15:0] note_sample;
    wire note_sample_ready;
    note_player note_player(
        .clk(clk),
        .reset(reset),
        .play_enable(play),
        .note_to_load(note_to_play),
        .duration_to_load(duration_for_note),
        .load_new_note(new_note),
        .done_with_note(note_done),
        .beat(beat),
        .generate_next_sample(generate_next_sample),
        .sample_out(note_sample),
        .new_sample_ready(note_sample_ready)
    );
      */
//   
//  ****************************************************************************
//      Beat Generator
//  ****************************************************************************
//  By default this will divide the generate_next_sample signal (48kHz from the
//  codec's new_frame input) down by 1000, to 48Hz. If you change the BEAT_COUNT
//  parameter when instantiating this you can change it for simulation.
//  
    beat_generator #(.WIDTH(10), .STOP(BEAT_COUNT)) beat_generator(
        .clk(clk),
        .reset(reset),
        .en(generate_next_sample),
        .beat(beat)
    );

//  
//  ****************************************************************************
//      Codec Conditioner
//  ****************************************************************************
//  
    assign new_sample_generated = generate_next_sample;
    codec_conditioner codec_conditioner(
        .clk(clk),
        .reset(reset),
        .new_sample_in(note_sample),
        .latch_new_sample_in(note_sample_ready),
        .generate_next_sample(generate_next_sample),
        .new_frame(new_frame),
        .valid_sample(sample_out)
    );

endmodule

