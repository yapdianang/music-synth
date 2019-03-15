`define HIGH 1'b1
`define LOW 1'b0
`define WHITE 8'hFF
`define NOTWHITE 8'h0

module wave_display (
    input clk,
    input reset,
    input [10:0] x,  // [0..1279]
    input [9:0]  y,  // [0..1023]
    input valid,
    input [7:0] read_value,
    input read_index,
    output wire [8:0] read_address,
    output wire valid_pixel,
    output wire [7:0] r,
    output wire [7:0] g,
    output wire [7:0] b
);

/*-------------------------------------------------
Assigns value of read address based on x.
Since we don't care what read_address is in quadrant 1&4, 
we can simply set it to be any value we like.
-------------------------------------------------*/
//assign read_address = {delayed_idx_3, x[9], x[7:0]};
assign read_address = {read_index, x[9], x[7:1]};
 
wire [10:0] prev_x;
wire [7:0] prev_read_value;
wire delayed_idx_1, delayed_idx_2, delayed_idx_3;
wire [8:0] prev_read_address;
wire read_addr_changed = ~(read_address == prev_read_address);

/*-------------------------------------------------
Needs 2 DFFs, one to keep track of sample_value and another for read_address
-------------------------------------------------*/
dffre #(.WIDTH(8)) sample_value_ff(
	.clk(clk),
	.r(reset),
	.en(read_addr_changed),
	.d(read_value),
	.q(prev_read_value)
);   

dffr #(.WIDTH(9)) read_addr_ff(
	.clk(clk),
	.r(reset),
	.d(read_address),
	.q(prev_read_address)
);   

wire [7:0] short_y;

assign short_y = y[8:1];

reg colored_white, valid_region;
/*-------------------------------------------------
Checks if Y falls between RAM[X-1] and RAM,
and checks for the valid region of the screen.
-------------------------------------------------*/
always @(*) begin
	if (read_value >= prev_read_value) begin
		colored_white = ((short_y >= prev_read_value) & (short_y <= read_value)) ? `HIGH : `LOW;
	end else begin
		colored_white = ((short_y <= prev_read_value) & (short_y >= read_value)) ? `HIGH : `LOW;
	end
	
	if (~valid || y[9] || x[9:8] == 2'b00 || x[9:8] >= 2'b11 || x < 11'b00100001100) begin
	//  x < 11'b100001100: as per private piazza post that says remove out the few pixels on the left of quadrant 01
		valid_region = `LOW;
	end else begin
		valid_region = `HIGH;
	end
end

wire colored_white_wire = colored_white;
assign valid_pixel = colored_white & valid_region;
assign r = valid_pixel? `WHITE : `NOTWHITE;
assign g = valid_pixel? `WHITE : `NOTWHITE;
assign b = valid_pixel? `WHITE : `NOTWHITE;
endmodule
