`timescale 1ns / 1ps
`define p1_done 3b'001
`define p2_done 3b'010
`define p3_done 3'b100

module chords(
		input clk,
		input reset,
		input new_note,
		output player_available,
		output [15:0] sample_out
    );
	 
	 reg [2:0] load_d;
	 wire [2:0] load_q;
	 
	 wire player1_done;
	 wire player2_done;
	 wire player3_done;
	 
	 
	 wire [3:0] select = {player3_done, player2_done, player1_done};

dffr #(.WIDTH(3)) (
    .clk(clk),
    .r(reset),
    .d(load_d),
    .q(load_q)
);

always @(*) begin
	case(select)
		p1_done : begin
			load_d = {0, 0, new_note};
		end
		p2_done : begin
			load_d = {0, new_note, 0};
		end
		p3_done : begin
			load_d = {new_note, 0, 0};
		end
		default : begin
			load_d = {0, 0, 0};
		end
	endcase
	
	
end


endmodule
