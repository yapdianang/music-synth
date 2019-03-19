`timescale 1ns / 1ps
// instantiate all the states
// written by makena, not sure if right
//`define INCREMENT_ADDR 3'b01
`define WAIT_ROM 2'b00
`define INCREMENT_ADDR 2'b01
`define WAIT 2'b10
`define CHECK_DONE 2'b11
//`define WAITING_NOTE 2'b11
`define LAST_NOTE 7'd127
//`define ALL_BUSY 3'b111

module song_reader(
    input clk,
    input reset,
    input play,
	 input beat,
    input [1:0] song,
    input note_done1,
	 input note_done2,
	 input note_done3,
    output song_done,
    output [5:0] note, 
    output [5:0] duration,
    output new_note1,
	 output new_note2,
	 output new_note3,
	 output np1_busy,
	 output np2_busy,
	 output np3_busy
); 

// Implementation goes here!

wire [15:0] song_rom_out;
reg [1:0] next_state;
wire [1:0] state;
reg [6:0] next_note;
wire [6:0] current_note;
reg new_note_reg;
reg song_done_reg;
wire [8:0] address = {song, current_note};


//wire np1_busy, np2_busy, np3_busy;
wire [2:0] busy_players = {np1_busy, np2_busy, np3_busy};

song_rom local_song_rom (
	 .clk(clk),
    .addr(address),		// 9 bits
    .dout(song_rom_out) //16 bits
);

wire delay_new_note, delay_song_done;
reg next_delay_new_note, next_delay_song_done;
reg next_stop_button;
wire stop_button;
//reg load_note;

// instantiate another clock to account for the delay from ROM
// using an enable so that we only move to the next state when we are playing the song
dffre #(.WIDTH(2)) state_dff(
    .clk(clk),
    .r(reset), 
    .en(play),
    .d(next_state),
    .q(state)
); 
 
dffre #(.WIDTH(7)) note_dff(
    .clk(clk),
    .r(reset),
    //.en(play & note_done),
	 .en(play),
    .d(next_note),
    .q(current_note)
); 

dffr #(.WIDTH(1)) stop_dff(
    .clk(clk),
    .r(reset),
    //.en(stop_button),
    .d(next_stop_button),
    .q(stop_button)
); 


reg [5:0] next_count;
wire [5:0] count;
dffre #(.WIDTH(6)) count_dff(
    .clk(clk),
    .r(reset),
    .en(beat | (state == `INCREMENT_ADDR)),
    .d(next_count),
    .q(count)
); 

//
//  ****************************************************************************
//      Note player availability flip flops
//  ****************************************************************************
//	keeps track of which note players are available, will say busy when new_note goes in and not busy when note is done

dffre np1_dff(
    .clk(clk),
    .r(reset),
    .en(new_note1 | note_done1),
    .d(~np1_busy),
    .q(np1_busy)
);

dffre np2_dff(
    .clk(clk),
    .r(reset),
    .en(new_note2 | note_done2),
    .d(~np2_busy),
    .q(np2_busy)
);

dffre np3_dff(
    .clk(clk),
    .r(reset),
    .en(new_note3 | note_done3),
    .d(~np3_busy),
    .q(np3_busy)
);

// *******

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
	case(state)
	 `WAIT : begin
	 	 // default case -- do counter
	//	$display("INITIAL");
		// TODO : implement counter to know when to move on to the next state
		if(stop_button == 1) begin
			next_state = `WAIT;
			new_note_reg = 1'b0;
			song_done_reg = 1'b0;
			next_note = current_note;
			
			if(count == (duration)) begin
				next_count = 0;
				next_stop_button = 0;
			end else begin
				next_count = count + 6'd1;
				next_stop_button = 1;
			end
			
		end else begin
			next_count = 0;
			next_state = `INCREMENT_ADDR;
			new_note_reg = 1'b0;
			song_done_reg = 1'b0;
			next_note = current_note;
			next_stop_button = 0;
		end
		
	 end
	 `INCREMENT_ADDR: begin
	  // wait a clock cycle for the rom to catch up
		next_state = (current_note == `LAST_NOTE)? `WAIT :`WAIT_ROM;
		new_note_reg = 1'b0;
		song_done_reg = (current_note == `LAST_NOTE)? 1'b1 : 1'b0;
		next_note = (current_note == `LAST_NOTE)? 5'd0 : current_note + 5'd1;
		next_stop_button = 0;
		next_count = 0;
	//	$display("WAITING_ROM");
		$display("Playing note %d of song %d, which is note %b duration %b", current_note, song, song_rom_out[11:6], song_rom_out[5:0]);
	 end
	 `WAIT_ROM : begin
		next_state = `CHECK_DONE;
		new_note_reg = 1'b1;
		song_done_reg = 1'b0;
		next_note = current_note;
		next_stop_button = 0;
		next_count = 0;
	 end
	 `CHECK_DONE : begin
		new_note_reg = 1'b0;
		song_done_reg = 1'b0;
		next_note = current_note;
	  // check if we are done with the song (hit 32 notes, or if song ended, append notes of length 0)
	  // if we are on the last note, we go back to the waiting state
	  if(song_rom_out[15] == 1) begin
		next_state = `WAIT;
		next_stop_button = 1;
		next_count = 0;
	 // song_done_reg = 1'b1;
	 // $display("CHECK_DONE 1");
	  end else begin
	  // if we aren't on the last note and the note is done, we read in the next note
		next_state = `INCREMENT_ADDR;
		next_stop_button = 0;
		next_count = 0;
		//song_done_reg = 1'b0;
		//$display("CHECK_DONE 2");
		$display("Playing note %d of song %d", current_note, song);
	  end
	 end
	 default : begin
		next_state = `WAIT;
		song_done_reg = 1'b0;
		new_note_reg = 1'b0;
		next_note = current_note;
		next_stop_button = 0;
		next_count = 0;
	//	$display("default 3");
	 end
	endcase
	//end
	next_delay_new_note = new_note_reg;
	next_delay_song_done = song_done_reg;

end

assign song_done = delay_song_done;//
assign {note, duration} = song_rom_out[14:3];
//assign new_note = delay_new_note; 
//assign new_note1 = (busy_players == (3'b000||3'b001||3'b010||3'b011)) ? delay_new_note : 1'b0;
assign new_note1 = (((busy_players == 3'b000) || (busy_players == 3'b001) || (busy_players == 3'b010) || (busy_players == 3'b011))&&(song_rom_out[15] != 1)) ?  delay_new_note : 1'b0;
assign new_note2 = (((busy_players == 3'b100)||(busy_players ==3'b101))&&(song_rom_out[15] != 1)) ? delay_new_note : 1'b0;
assign new_note3 = ((busy_players == 3'b110)&&(song_rom_out[15] != 1)) ? delay_new_note : 1'b0;

endmodule



/*
`timescale 1ns / 1ps
// instantiate all the states
// written by makena, not sure if right
//`define INCREMENT_ADDR 3'b01
`define WAITING_ROM 2'b01
`define CHECK_DONE 2'b11
`define INITIAL 2'b00
//`define WAITING_NOTE 2'b11
`define LAST_NOTE 5'd31

module song_reader(
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
song_rom local_song_rom (
	 .clk(clk),
    .addr(address),
    .dout(song_rom_out) //12 bits
);


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

*/
