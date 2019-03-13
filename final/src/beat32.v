//`timescale 1ns / 1ps

//`define COUNT_TO 22'd2
`define COUNT_TO 22'd3125000 //  back when synthesizing

module beat32 #(parameter SIGNAL_WIDTH = 22)( input clk,
					input reset,
					output wire out
    );
	 
reg [SIGNAL_WIDTH-1:0] next_value;
reg toggle;
wire [SIGNAL_WIDTH-1:0] value;

dffr #(.WIDTH(SIGNAL_WIDTH)) value_reg(
		.clk(clk),
		.r(reset),
		.d (next_value),
		.q (value)
);

always @(*) begin 
	casex({reset, toggle}) 
		2'b1x: begin
			toggle = 1'b0;
			next_value = 22'b0;
		end
		2'b01: begin
			toggle = 1'b0;
			next_value = 22'b0;
		end
		2'b00: begin
			toggle = (next_value == `COUNT_TO - 1)? 1'b1:1'b0;
			next_value = value + 22'b1;
		end 
		default: begin
			toggle = 1'b0;
			next_value = 22'b0;
		end
	endcase
end
 
assign out = reset? 1'b0 : toggle ;

endmodule
