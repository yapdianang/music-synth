//`timescale 1ns / 1ps

// one decrement every 1/32 seconds, 8 seconds max --> count to 256 max --> 9 bits
`define WIDTH 9

  
module timer ( input clk,
					input reset,
				   input count_en, 
					input [`WIDTH-1:0] load_value,
					output wire out
    );
	 
reg [`WIDTH-1:0] next_value;
reg toggle;
wire [`WIDTH-1:0] value;

dffr #(.WIDTH(`WIDTH)) value_reg(
		.clk(clk),
		.r(reset),
		.d (next_value),
		.q (value)
);

always @(*) begin 
	if (value > 0) begin
		toggle = 1'b0;
		next_value = count_en? value - 9'b000000001 : value;
	end
	else begin
		toggle = 1'b1;
		next_value = load_value;
	end

end
 
assign out = toggle;


endmodule
