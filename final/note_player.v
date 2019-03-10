`define NORMAL 3'b000
`define ADD1 3'b001
`define ADD2 3'b010
`define ADD3 3'b011
`define VIOLIN 3'b100
`define CLARINET 3'b101
`define TRUMPET 3'b110
`define CUSTOM 3'b111


module #(parameter INSTRUMENT = 3'b000) note_player(
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

wire [19:0] fr_out, step_size;

wire release_note;
wire 1_rdy, 2_rdy, 3_rdy, 4_rdy, 5_rdy, 6_rdy, 7_rdy, 8_rdy;
wire [19:0] 1_out, 2_out, 3_out, 4_out, 5_out, 6_out, 7_out, 8_out;
assign step_size = play_enable ? fr_out:20'b0;

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

sine_reader first_harmonic(
	.clk(clk),
	.reset(reset),
	.step_size(step_size),
	.generate_next(generate_next_sample),
	.sample_ready(1_rdy),
	.sample(1_out)
);

sine_reader second_harmonic(
	.clk(clk),
	.reset(reset),
	.step_size(step_size>>1),
	.generate_next(generate_next_sample),
	.sample_ready(2_rdy),
	.sample(2_out)
);

sine_reader third_harmonic(
	.clk(clk),
	.reset(reset),
	.step_size(step_size>>1 + step_size),
	.generate_next(generate_next_sample),
	.sample_ready(3_rdy),
	.sample(3_out)
);

sine_reader forth_harmonic(
	.clk(clk),
	.reset(reset),
	.step_size(step_size>>2),
	.generate_next(generate_next_sample),
	.sample_ready(4_rdy),
	.sample(4_out)
);

sine_reader fifth_harmonic(
	.clk(clk),
	.reset(reset),
	.step_size(step_size>>2 + step_size),
	.generate_next(generate_next_sample),
	.sample_ready(5_rdy),
	.sample(5_out)
);

sine_reader sixth_harmonic(
	.clk(clk),
	.reset(reset),
	.step_size(step_size>>2 + step_size + step_size),
	.generate_next(generate_next_sample),
	.sample_ready(6_rdy),
	.sample(6_out)
);

sine_reader seventh_harmonic(
	.clk(clk),
	.reset(reset),
	.step_size(step_size>>2 + step_size + step_size + step_size),
	.generate_next(generate_next_sample),
	.sample_ready(7_rdy),
	.sample(7_out)
);

sine_reader eighth_harmonic(
	.clk(clk),
	.reset(reset),
	.step_size(step_size>>3),
	.generate_next(generate_next_sample),
	.sample_ready(8_rdy),
	.sample(8_out)
);

`define NORMAL 3'b000
`define ADD1 3'b001
`define ADD2 3'b010
`define ADD3 3'b011
`define VIOLIN 3'b100
`define FLUTE 3'b101
`define TRUMPET 3'b110
`define CUSTOM 3'b111

reg [16:0] sample_out_reg;

always @(*) begin
	case (INSTRUMENT)
		`NORMAL: begin
			sample_out_reg =  ($signed(1_out) >>> 1);
		end
		`ADD1: begin
			sample_out_reg = (($signed(1_out) >>> 1) + ($signed(2_out) >>> 2));
		end
		`ADD2: begin
			sample_out_reg =  (($signed(1_out) >>> 1) + ($signed(2_out) >>> 2) + ($signed(3_out) >>> 3));
		end
		`ADD3: begin
			sample_out_reg =  (($signed(1_out) >>> 1) + ($signed(2_out) >>> 2) + ($signed(3_out) >>> 3) + ($signed(4_out) >>> 3));
		end
		`VIOLIN: begin
			sample_out_reg =  (($signed(1_out) >>> 1) + ($signed(2_out) >>> 3) + ($signed(3_out) >>> 5) + ($signed(4_out) >>> 7) + ($signed(5_out) >>> 7) + ($signed(6_out) >>> 8) + ($signed(7_out) >>> 9));
		end
		`CLARINET: begin
			sample_out_reg =  (($signed(1_out) >>> 3) + ($signed(2_out) >>> 6) + ($signed(3_out) >>> 3) + ($signed(4_out) >>> 4) + ($signed(5_out) >>> 3) + ($signed(6_out) >>> 4) + ($signed(7_out) >>> 3));
		end
		`TRUMPET: begin
			sample_out_reg =  (($signed(1_out) >>> 4) + ($signed(2_out) >>> 3) + ($signed(3_out) >>> 3) + ($signed(4_out) >>> 3) + ($signed(5_out) >>> 3) + ($signed(6_out) >>> 3) + ($signed(7_out) >>> 4));
		end
		`CUSTOM: begin
			sample_out_reg =  (($signed(1_out) >>> 3) + ($signed(2_out) >>> 2) + ($signed(3_out) >>> 3) + ($signed(4_out) >>> 5) + ($signed(5_out) >>> 5) + ($signed(6_out) >>> 4) + ($signed(7_out) >>> 4));
		end

	endcase
end

assign sample_out = sample_out_reg;

assign new_sample_ready = (1_rdy & 2_rdy & 3_rdy & 4_rdy & 5_rdy & 6_rdy & 7_rdy & 8_rdy);

endmodule
