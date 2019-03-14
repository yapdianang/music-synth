`timescale 1ns / 1ps

module chords_tb(
    );
	 
	 reg clk;
	 reg reset, load_new_note, play_enable, generate_next_sample;
	 //wire player_available, beat;
	 //wire [15:0] sample_out_player;
	 //wire new_sample_ready_player;
	 reg [5:0] note, duration;

module song_reader(
    .clk(clk),
    .reset(reset),
    .play(play),
    .song(song),
    .note_done1(note_done1),
	 .note_done2(note_done2),
	 .note_done3(note_done3),
    .song_done(song_done),
    .note(note), 
    .duration(duration),
    .new_note1(new_note1),
	 .new_note2(new_note2),
	 .new_note3(new_note3)
); 
/*
		// made STOP shorter for testing
    beat_generator #(.WIDTH(17), .STOP(30)) beat_generator(
        .clk(clk),
        .reset(reset),
        .en(1'b1),
        .beat(beat)
    );
	 */
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
		  #10
        generate_next_sample = 1'b1;
        #10
        generate_next_sample = 1'b0;
		  end
	end

    // Tests
    initial begin
		reset = 1'b1;
		play = 1;
		song = 1'b01;
		note_done1 = 0;
		note_done2 = 0;
		note_done3 = 0;
		//{note, duration} = {1'b0, 6'd57, 6'd5, 3'b111};
		//load_new_note = 1;
		//#10
		//reset = 1'b0; 
		//reset = 1'b0;
		//load_new_note = 0;
		#50
		reset = 1'b0;
		note_done1 = 1;
		//{note, duration} = {1'b1, 6'd57, 6'd5, 3'b111};
		//load_new_note = 1;
		#50
		note_done2 = 1;
		#50
		note_done1 = 1;
		//{note, duration} = {1'b0, 6'd57, 6'd5, 3'b111};
		/*
		#50
		//play_enable = 0;
		//#200;
		//play_enable = 1;
		//#500
		load_new_note = 1'b1;
		{note_to_load, duration_to_load} = {6'd1, 6'd8};
		#10
		load_new_note = 1'b0;
		#50
		load_new_note = 1'b1;
		{note_to_load, duration_to_load} = {6'd51, 6'd3};
		#10
		load_new_note = 1'b0;
		#40000
		load_new_note = 1'b1;
		{note_to_load, duration_to_load} = {6'd10, 6'd5};
		
		/*

		forever begin
			#500
        play_enable = 1'b1;
		  #500
        play_enable = 1'b0;
		  
		end	
		*/

    end
	 


endmodule
