`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: EE108
// Engineer: A.D.
// 
// Create Date:    17:18:06 03/08/2019 
// Design Name: echo
// Module Name:    echo 
// Project Name: music-synth
// Description: Takes in time series and outputs an echoed version of signal
//
// Dependencies: None
//////////////////////////////////////////////////////////////////////////////////

`define DELAY1 15'd4800 
`define DELAY2 15'd9600
`define DELAY3 15'd14400 
`define DELAY4 15'd19200
`define DELAY5 15'd24000

module echo(
	input clk,
	input reset,
	input [15:0] sample_in,
	input ready,
	input next_D,
	input next_H,
	output [15:0] echoed,
	output flopped_ready
);

wire [2:0] next_delay_state, curr_delay_state;
wire [4:0] delay;
dffre #(3) delay_ff(.clk(clk), .r(reset), .en(next_D), .d(next_delay_state), .q(curr_delay_state));

assign next_delay_state = (curr_delay_state == 3'd5) ? 3'd1 : curr_delay_state + 3'd1;

always @(*) begin
	
	case(curr_delay_state)
	 3'd1 : begin
		delay = `DELAY1;
	 end
	 3'd2: begin
		delay = `DELAY1;
	 end
	 3'd3: begin
		delay = `DELAY3;
	 end
	 3'd4: begin
		delay = `DELAY4;
	 end
	 3'd5: begin
		delay = `DELAY5;
	 end
	 default : begin
		delay = `DELAY1;
	 end
	endcase
	
end

endmodule
