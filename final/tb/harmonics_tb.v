`timescale 1ns/1ps

module harmonics_tb();

    reg clk, reset, play_enable, generate_next_sample;
    reg [5:0] note_to_load;
    reg [5:0] duration_to_load;
    reg load_new_note;
    wire done_with_note, new_sample_ready, beat;
    wire [15:0] sample_out;

    note_player  #(.INSTRUMENT(3'b100)) np(
        .clk(clk),
        .reset(reset),

        .play_enable(play_enable),
        .note_to_load(note_to_load),
        .duration_to_load(duration_to_load),
        .load_new_note(load_new_note),
        .done_with_note(done_with_note),

        .beat(beat),
        .generate_next_sample(generate_next_sample),
        .sample_out(sample_out),
        .new_sample_ready(new_sample_ready)
    );
	


    beat_generator #(.WIDTH(17), .STOP(30)) beat_generator(
        .clk(clk),
        .reset(reset),
        .en(1'b1),
        .beat(beat)
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
		  #10
        generate_next_sample = 1'b1;
        #10
        generate_next_sample = 1'b0;
		  end
	end

    // Tests
    initial begin
		reset = 1'b1;
		play_enable = 1;
		{note_to_load, duration_to_load} = {6'd57, 6'd5};
		
		load_new_note = 1;
		#50
		reset = 1'b0;
		load_new_note = 0;
		#2000
		play_enable = 0;
		#200;
		play_enable = 1;
		#500
		load_new_note = 1'b1;
		{note_to_load, duration_to_load} = {6'd1, 6'd8};
		#10
		load_new_note = 1'b0;
		#1000
		load_new_note = 1'b1;
		{note_to_load, duration_to_load} = {10'd009, 10'd395};
		#10
		load_new_note = 1'b0;
		#4000
		
		play_enable = 0;
		#4000
		play_enable = 1;
		
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
