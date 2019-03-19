
`timescale 1ns / 1ps
// instantiate all the states
// written by makena, not sure if right
//`define INCREMENT_ADDR 3'b01
`define WAITING_ROM 2'b01
`define CHECK_DONE 2'b11
`define INITIAL 2'b00
//`define WAITING_NOTE 2'b11
`define LAST_NOTE 5'd31

module song_reader_old(
    input clk,
    input reset,
    input play,
    input [1:0] song,
    input note_done,
    output song_done,
    output [5:0] note, 
    output [5:0] duration,
    output new_note
); 

// Implementation goes here!

wire [11:0] song_rom_out;
reg [1:0] next_state;
wire [1:0] state;
reg [4:0] next_note;
wire [4:0] current_note;
reg new_note_reg;
reg song_done_reg;
wire [6:0] address = {song, current_note};
wire [11:0] pre_song_rom_out;
song_rom_old local_song_rom (
	 .clk(clk),
    .addr(address),
    .dout(song_rom_out) //12 bits
);
/*
dffr #(.WIDTH(12)) song_rom_out_dff(
    .clk(clk),
    .r(reset),
    .d(pre_song_rom_out),
    .q(song_rom_out)
);
*/

wire delay_new_note, delay_song_done;
reg next_delay_new_note, next_delay_song_done;

// instantiate another clock to account for the delay from ROM
// using an enable so that we only move to the next state when we are playing the song
dffre #(.WIDTH(2)) state_dff(
    .clk(clk),
    .r(reset),
    .en(play),
    .d(next_state),
    .q(state)
);

dffre #(.WIDTH(5)) note_dff(
    .clk(clk),
    .r(reset),
    .en(play & note_done),
    .d(next_note),
    .q(current_note)
);


dffre delay_new_note_dff(
    .clk(clk),
    .r(reset),
    .en(play),
    .d(next_delay_new_note),
    .q(delay_new_note)
);

dffre delay_song_done_dff(
    .clk(clk),
    .r(reset),
    .en(play),
    .d(next_delay_song_done),
    .q(delay_song_done)
);

always @(*) begin

	next_note = (current_note == `LAST_NOTE)? 5'd0 : current_note + 5'd1;

	case(state)
	 `INITIAL : begin
	 	 // default case
	 	next_state = `WAITING_ROM;
		new_note_reg = 1'b0;
		song_done_reg = 1'b0;
	//	$display("INITIAL");
	 end
	 `WAITING_ROM: begin
	  // wait a clock cycle for the rom to catch up
		next_state = `CHECK_DONE;
		new_note_reg = 1'b1; 
		song_done_reg = 1'b0;
	//	$display("WAITING_ROM");
		$display("Playing note %d of song %d, which is note %b duration %b", current_note, song, song_rom_out[11:6], song_rom_out[5:0]);
	 end
	 `CHECK_DONE : begin
		new_note_reg = 1'b0;
	  // check if we are done with the song (hit 32 notes, or if song ended, append notes of length 0)
	  // if we are on the last note, we go back to the waiting state
	  if((current_note == `LAST_NOTE) && note_done) begin
		next_state = `INITIAL;
		song_done_reg = 1'b1;
	 // $display("CHECK_DONE 1");
	  end else if ((current_note != `LAST_NOTE) && note_done) begin
	  // if we aren't on the last note and the note is done, we read in the next note
		next_state = `WAITING_ROM;
		song_done_reg = 1'b0;
		//$display("CHECK_DONE 2");
		$display("Playing note %d of song %d", current_note, song);
	  end else begin
	   // if the note isn't done check on the next cycle
		next_state = state;
		song_done_reg = 1'b0;
	//	$display("CHECK_DONE 3");
	  end
	 end
	 default : begin
		next_state = `INITIAL;
		song_done_reg = 1'b0;
		new_note_reg = 1'b0;
	//	$display("default 3");
	 end
	endcase
	//end
	next_delay_new_note = new_note_reg;
	next_delay_song_done = song_done_reg;
	
	
end

assign song_done = delay_song_done;//
assign {note, duration} = song_rom_out;
assign new_note = delay_new_note;

endmodule

