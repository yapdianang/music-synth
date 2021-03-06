`define NORMAL 4'b0000
`define TRIANGLE1 4'b0001 // 1
`define SQUARE 4'b0010 //2
`define MYSTERY 4'b0011 //2
`define VIOLIN 4'b0100 //4
`define CLARINET 4'b0101 //5
`define TRUMPET 4'b0110 //6
`define CUSTOM 4'b0111 //7
`define FLUTE 4'b1000
`define PIANO 4'b1001


module  note_player (
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
    output new_sample_ready,  // Tells the codec when we've got a sample
	 input [3:0] instrument
);

wire [19:0] fr_out, step_size;

//wire release_note;
wire delay_load_new_note, play_note;
wire rdy_1, rdy_2, rdy_3, rdy_4, rdy_5, rdy_6, rdy_7;
wire [15:0] out_1, out_2, out_3, out_4, out_5, out_6, out_7;
assign step_size = (play_enable && play_note) ? fr_out:20'b0;

dffre #(.WIDTH(1)) load_new_dff(
    .clk(clk),
    .r(reset),
    .en(play_enable),
    .d(load_new_note),
    .q(delay_load_new_note)
);

dffre #(.WIDTH(1)) pause_dff(
    .clk(clk),
    .r(reset),
    .en(load_new_note | done_with_note),
    .d(~play_note),
    .q(play_note)
);

countdown_timer ct(
	.clk(clk),
	.reset(reset),
	.playing(play_enable),
	.load_new(delay_load_new_note),
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
	.sample_ready(rdy_1),
	.sample(out_1)
);

sine_reader second_harmonic(
	.clk(clk),
	.reset(reset),
	.step_size(step_size<< 1),
	.generate_next(generate_next_sample),
	.sample_ready(rdy_2),
	.sample(out_2)
);

sine_reader third_harmonic(
	.clk(clk),
	.reset(reset),
	.step_size((step_size<< 1) + step_size),
	.generate_next(generate_next_sample),
	.sample_ready(rdy_3),
	.sample(out_3)
);

sine_reader forth_harmonic(
	.clk(clk),
	.reset(reset),
	.step_size(step_size<< 2),
	.generate_next(generate_next_sample),
	.sample_ready(rdy_4),
	.sample(out_4)
);

sine_reader fifth_harmonic(
	.clk(clk),
	.reset(reset),
	.step_size((step_size<<2) + (step_size)),
	.generate_next(generate_next_sample),
	.sample_ready(rdy_5),
	.sample(out_5)
);

sine_reader sixth_harmonic(
	.clk(clk),
	.reset(reset),
	.step_size((step_size<<2) + (step_size << 1)),
	.generate_next(generate_next_sample),
	.sample_ready(rdy_6),
	.sample(out_6)
);

sine_reader seventh_harmonic(
	.clk(clk),
	.reset(reset),
	.step_size((step_size<<2) + (step_size << 1) + step_size),
	.generate_next(generate_next_sample),
	.sample_ready(rdy_7),
	.sample(out_7)
);

// dffrs to delay and break the max path
wire [15:0] delay_out_1, delay_out_2, delay_out_3, delay_out_4, delay_out_5, delay_out_6, delay_out_7;
wire delay_rdy_1, delay_rdy_2, delay_rdy_3, delay_rdy_4, delay_rdy_5, delay_rdy_6, delay_rdy_7;

dffre #(.WIDTH(17)) delay_out_and_ready1(
    .clk(clk),
    .r(reset),
	 .en(play_enable),
    .d({out_1, rdy_1}),
    .q({delay_out_1, delay_rdy_1})
	);
	
	dffre #(.WIDTH(17)) delay_out_and_ready2(
    .clk(clk),
    .r(reset),
	 .en(play_enable),
    .d({out_2, rdy_2}),
    .q({delay_out_2, delay_rdy_2})
	);
	
	dffre #(.WIDTH(17)) delay_out_and_ready3(
    .clk(clk),
    .r(reset),
	 .en(play_enable),
    .d({out_3, rdy_3}),
    .q({delay_out_3, delay_rdy_3})
	);	
	
	dffre #(.WIDTH(17)) delay_out_and_ready4(
    .clk(clk),
    .r(reset),
	 .en(play_enable),
    .d({out_4, rdy_4}),
    .q({delay_out_4, delay_rdy_4})
	);	
	
	dffre #(.WIDTH(17)) delay_out_and_ready5(
    .clk(clk),
    .r(reset),
	 .en(play_enable),
    .d({out_5, rdy_5}),
    .q({delay_out_5, delay_rdy_5})
	);	

dffre #(.WIDTH(17)) delay_out_and_ready6(
    .clk(clk),
    .r(reset),
	 .en(play_enable),
    .d({out_6, rdy_6}),
    .q({delay_out_6, delay_rdy_6})
	);

dffre #(.WIDTH(17)) delay_out_and_ready7(
    .clk(clk),
    .r(reset),
	 .en(play_enable),
    .d({out_7, rdy_7}),
    .q({delay_out_7, delay_rdy_7})
	);	

reg [15:0] sample_out_reg;

wire signed [15:0] out1_shift_1 = $signed(delay_out_1) >>> 1;
wire signed [15:0] out1_shift_2 = $signed(delay_out_1) >>> 2;
wire signed [15:0] out1_shift_3 = $signed(delay_out_1) >>> 3;
wire signed [15:0] out1_shift_4 = $signed(delay_out_1) >>> 4;
wire signed [15:0] out2_shift_2 = $signed(delay_out_2) >>> 2;
wire signed [15:0] out2_shift_3 = $signed(delay_out_2) >>> 3;
wire signed [15:0] out2_shift_4 = $signed(delay_out_2) >>> 4;
wire signed [15:0] out2_shift_5 = $signed(delay_out_2) >>> 5;
wire signed [15:0] out2_shift_6 = $signed(delay_out_2) >>> 6;
wire signed [15:0] out3_shift_3 = $signed(delay_out_3) >>> 3;
wire signed [15:0] out3_shift_4 = $signed(delay_out_3) >>> 4;
wire signed [15:0] out3_shift_5 = $signed(delay_out_3) >>> 5;
wire signed [15:0] out4_shift_2 = $signed(delay_out_4) >>> 2;
wire signed [15:0] out4_shift_3 = $signed(delay_out_4) >>> 3;
wire signed [15:0] out4_shift_4 = $signed(delay_out_4) >>> 4;
wire signed [15:0] out4_shift_5 = $signed(delay_out_4) >>> 5;
wire signed [15:0] out4_shift_7 = $signed(delay_out_4) >>> 7;
wire signed [15:0] out5_shift_5 = $signed(delay_out_5) >>> 5;
wire signed [15:0] out5_shift_3 = $signed(delay_out_5) >>> 3;
wire signed [15:0] out5_shift_4 = $signed(delay_out_5) >>> 4;
wire signed [15:0] out5_shift_7 = $signed(delay_out_5) >>> 7;

// out 6
wire signed [15:0] out6_shift_2 = $signed(delay_out_6) >>> 2;
wire signed [15:0] out6_shift_3 = $signed(delay_out_6) >>> 3;
wire signed [15:0] out6_shift_4 = $signed(delay_out_6) >>> 4;
wire signed [15:0] out6_shift_5 = $signed(delay_out_6) >>> 5;
wire signed [15:0] out6_shift_6 = $signed(delay_out_6) >>> 6;
wire signed [15:0] out6_shift_8 = $signed(delay_out_6) >>> 8;

// out 7
wire signed [15:0] out7_shift_3 = $signed(delay_out_7) >>> 3;
wire signed [15:0] out7_shift_4 = $signed(delay_out_7) >>> 4;
wire signed [15:0] out7_shift_5 = $signed(delay_out_7) >>> 5;
wire signed [15:0] out7_shift_7 = $signed(delay_out_7) >>> 7;
wire signed [15:0] out7_shift_9 = $signed(delay_out_7) >>> 9;


always @(*) begin
	case (instrument)
		`NORMAL: begin
			sample_out_reg =  out1_shift_1;
		end
		`TRIANGLE1: begin
			sample_out_reg = ((out1_shift_1) + (out2_shift_2) + (out3_shift_3) + (out4_shift_4) + (out5_shift_5) + (out6_shift_6) + (out7_shift_7) );
		end
		`SQUARE: begin
			sample_out_reg =  (((out1_shift_2) + (out1_shift_4)) + ((out3_shift_4) + (out3_shift_5))  + (out5_shift_4) + ((out7_shift_5)));
		end
		`MYSTERY: begin
			sample_out_reg =  ((out1_shift_2) + (out2_shift_2) + (out4_shift_2) + (out6_shift_2));
		end
		`VIOLIN: begin
			sample_out_reg =  ((out1_shift_1) + (out2_shift_3) + (out3_shift_5) + (out4_shift_7) + (out5_shift_7) + (out6_shift_8) + (out7_shift_9));
		end
		`CLARINET: begin
			sample_out_reg =  ((out1_shift_3) + (out2_shift_6) + (out3_shift_3) + (out4_shift_4) + (out5_shift_3) + (out6_shift_4) + (out7_shift_3));
		end
		`TRUMPET: begin
			sample_out_reg =  ((out1_shift_4) + (out2_shift_3) + (out3_shift_3) + (out4_shift_3) + (out5_shift_3) + (out6_shift_3) + (out7_shift_4));
		end
		`CUSTOM: begin
			sample_out_reg =  ((out1_shift_3) + (out2_shift_3) + (out3_shift_3) + (out4_shift_5) + (out5_shift_5) + (out6_shift_5) + (out7_shift_4));
		end
		`FLUTE: begin
			sample_out_reg = (out1_shift_4 + out2_shift_2 + out2_shift_3 + out2_shift_4 + out3_shift_3 + out3_shift_4 + out4_shift_4 + out4_shift_5);
		end
		`PIANO: begin
			sample_out_reg = out1_shift_1 + out2_shift_5 + out2_shift_6 + out3_shift_3 + out3_shift_5 + out4_shift_5 + out5_shift_5 + out6_shift_5;
		end
		
		default: begin
			sample_out_reg = out1_shift_1;
		end
	endcase
end

// TODO : add a flip flop here if timing is not met

assign sample_out = sample_out_reg;

assign new_sample_ready = (delay_rdy_1 & delay_rdy_2 & delay_rdy_3 & delay_rdy_4 & delay_rdy_5 & delay_rdy_6 & delay_rdy_7);

endmodule

