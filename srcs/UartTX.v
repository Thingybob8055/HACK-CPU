/**
 * UartTX controls transmission of bytes over UART.
 *
 * When load = 1 the chip starts serial transmission of the byte in[7:0] to the
 * TX line according to the protocoll 8N1 with 115200 baud. During transmission
 * out[15] is set to high (busy). The transmission is finished after 2170 clock 
 * cycles (10 byte a 217 cycle each). When transmission completes out[15] goes
 * low again (ready). 
 */
 
module UartTX(
	input clk,
	input load,
	input [15:0] in,
	output TX,
	output [15:0] out
);

	// Put your code here:
	wire bitload; ///
	wire busy;
	wire [15:0] baudrate;
	wire [15:0] bits;
	wire pc1_reset; //
	wire [8:0] data;

	Bit BIT_1(.clk(clk), .in(load), .load(bitload), .out(busy));

	PC PC_1(.clk(clk), .in(16'b0), .load(1'b0), .inc(busy), .reset(pc1_reset), .out(baudrate));

	wire is216 = (baudrate==216);
	Or Or_1(.a(load), .b(is216), .out(pc1_reset));

	wire isbits9 = (bits==9);
	wire temp;
	And AND_2(.a(isbits9), .b(is216), .out(temp));
	Or OR_2(.a(temp), .b(load), .out(bitload));

	PC PC_2(.clk(clk), .in(16'b0), .load(1'b0), .inc(is216), .reset(load), .out(bits));

	BitShift9R BITSHIFT9R_1(.clk(clk), .in({in[7:0], 1'b0}), .inMSB(1'b1), .load(load), .shift(is216), .out(data));

	wire not_busy;
	Not NOT_1(.in(busy), .out(not_busy));

	Or OR_3(.a(not_busy), .b(data[0]), .out(TX));

	assign out = {busy, 15'b0};

endmodule
