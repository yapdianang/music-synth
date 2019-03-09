`define SONG0 2'b00
`define SONG1 2'b01
`define SONG2 2'b10
`define SONG3 2'b11

module mcu(
    input clk,
    input reset,
    input play_button,
    input next_button,
    output play,
    output reset_player,
    output [1:0] song,
    input song_done
);

reg next_play, reset_player_reg;
reg [1:0] next_song;

dffr play_ff(
	.clk(clk),
	.r(reset),
	.d(next_play),
	.q(play)
);    

dffr #(.WIDTH(2)) song_ff(
	.clk(clk),
	.r(reset),
	.d(next_song),
	.q(song)
); 

always @(*) begin
	if (reset) begin
		next_song = `SONG0;
		next_play = 1'b0;
		reset_player_reg = 1'b1;
	end else if (play_button) begin
		next_song = song;
		next_play = ~play;
		reset_player_reg = 1'b0;
	end else if (next_button | song_done) begin
		next_song = (song == `SONG3)?  `SONG0 : (song + 2'b01);  // cycles back to start
		next_play = 1'b0;
		reset_player_reg = 1'b1;
   /*		
	end else if (song_done) begin
		next_song = (song == `SONG3)? `SONG0 : (song + 2'b01)  ;  // cycles back to start
		next_play = 1'b0;
		reset_player_reg = 1'b1;   //should this be 0 or 1? check later 
	*/
	end else begin
		next_song = song;
		next_play = play;
		reset_player_reg = 1'b0; 
	end
end

assign reset_player = reset_player_reg;

endmodule
