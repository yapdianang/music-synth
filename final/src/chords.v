`timescale 1ns / 1ps
`define p1_done 3'b001
`define p2_done 3'b010
`define p3_done 3'b100

module chords(
		input clk, // input for ff
		input reset, // input for ff 
		input new_note, // from song reader
      input [5:0] note_to_load, // from song reader, from song reader
		input [5:0] duration_to_load, // from song reader
		input play_enable, // from song reader
		input beat,
		input generate_next_sample,
		output player_available, // output for chords
		output [15:0] sample_out_player, // concatenated samples out
		output new_sample_ready_player // from the not player, won't be used? QUESTION
    );
	 
	 
/*	 
	 wire player1_done, player2_done, player3_done;
	 reg [2:0] load_d;
	 wire [2:0] select, load_q;
	 wire [15:0] sample_out_player1, sample_out_player2, sample_out_player3;
	 wire new_sample_ready_player1, new_sample_ready_player2, new_sample_ready_player3;
	
	  
	 // TO DO -- note player instantiations

	note_player note_player1(
    .clk(clk),
    .reset(reset), 
    .play_enable(play_enable),  // When high we play, when low we don't.
    .note_to_load(note_to_load),  // The note to play
    .duration_to_load(duration_to_load),  // The duration of the note to play
    .load_new_note(load_q[1]),//load_q[1]),  // Tells us when we have a new note to load
    .done_with_note(player1_done),  // When we are done with the note this stays high.
    .beat(beat),  // This is our 1/48th second beat
    .generate_next_sample(generate_next_sample),  // Tells us when the codec wants a new sample
    .sample_out(sample_out_player1),  // Our sample output
    .new_sample_ready(new_sample_ready_player1)  // Tells the codec when we've got a sample
);

	note_player note_player2(
    .clk(clk),
    .reset(reset),
    .play_enable(play_enable),  // When high we play, when low we don't.
    .note_to_load(note_to_load),  // The note to play
    .duration_to_load(duration_to_load),  // The duration of the note to play
    .load_new_note(load_q[2]),  // Tells us when we have a new note to load
    .done_with_note(player2_done),  // When we are done with the note this stays high.
    .beat(beat),  // This is our 1/48th second beat
    .generate_next_sample(generate_next_sample),  // Tells us when the codec wants a new sample
    .sample_out(sample_out_player2),  // Our sample output
    .new_sample_ready(new_sample_ready_player2)  // Tells the codec when we've got a sample
);


note_player note_player3(
    .clk(clk),
    .reset(reset),
    .play_enable(play_enable),  // When high we play, when low we don't.
    .note_to_load(note_to_load),  // The note to play
    .duration_to_load(duration_to_load),  // The duration of the note to play
    .load_new_note(load_q[3]),  // Tells us when we have a new note to load
    .done_with_note(player3_done),  // When we are done with the note this stays high.
    .beat(beat),  // This is our 1/48th second beat
    .generate_next_sample(generate_next_sample),  // Tells us when the codec wants a new sample
    .sample_out(sample_out_player3),  // Our sample output
    .new_sample_ready(new_sample_ready_player3)  // Tells the codec when we've got a sample
);


dffr #(.WIDTH(3)) ff_load(
    .clk(clk),
    .r(reset),
    .d(load_d),
    .q(load_q)
);

always @(*) begin
// mux 
	case(select)
		`p1_done : begin
			load_d = {0, 0, new_note};
		end
		`p2_done : begin
			load_d = {0, new_note, 0};
		end
		`p3_done : begin
			load_d = {new_note, 0, 0};
		end
		default : begin
			load_d = {0, 0, 0};
		end
	endcase

end

assign select = {player3_done, player2_done, player1_done}; // mux select
assign player_available = player3_done|player2_done|player1_done;
assign sample_out_player = sample_out_player1 + sample_out_player2 + sample_out_player3;
assign new_sample_ready_player = new_sample_ready_player1|new_sample_ready_player2|new_sample_ready_player3;
*/
endmodule
