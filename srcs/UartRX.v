/**
 * UartRX receives bytes over UART
 *
 * When clear = 1 the chip clears the receive buffer and is ready to receive
 * next byte. out[15] is set to 1 to show, that chip is ready to receive next
 * byte. When RX goes low the chip starts sampling the RX line. After reading
 * of byte completes, chip ouputs the received byte to out[7:0]] with out[15]=0.
 */
 

module UartRX(
	input clk,
	input clear,
	input RX,
	output [15:0] out
);
	
	// Put your code here:
	wire RX2;
	DFF DFF_1(
		.clk(clk),
		.in(RX),
		.out(RX2)
	);

	wire start;
	wire busy;
	wire [15:0] baudrate;
	wire [15:0] bits;
	wire bitload;

	wire is216 = (baudrate==216);
	wire is108 = (baudrate==108);
	wire isbits9 = (bits==9);

	wire rxorbusy;
	Or OR_1(.a(RX2), .b(busy), .out(rxorbusy));
	Not NOT_1(.in(rxorbusy), .out(start));
	wire is216andbits9;
	And AND_1(.a(is216), .b(isbits9), .out(is216andbits9));
	Or OR_2(.a(is216andbits9), .b(start), .out(bitload));

	Bit BIT_1(
		.clk(clk),
		.in(start),
		.load(bitload),
		.out(busy)
	);

	PC PC_1(
		.clk(clk),
		.in(16'b0),
		.load(1'b0),
		.inc(busy),
		.reset(is216),
		.out(baudrate)
	);

	PC PC_2(
		.clk(clk),
		.in(16'b0),
		.load(1'b0),
		.inc(is216),
		.reset(start),
		.out(bits)
	);

	wire [8:0] data;
	BitShift9R BITSHIFT9R_1(
		.clk(clk),
		.in(9'b0),
		.inMSB(RX2),
		.load(1'b0),
		.shift(is108),
		.out(data)
	);

	wire clearorstop;
	Or OR_3(.a(clear), .b(is216andbits9), .out(clearorstop));
	wire [15:0] regin;
	Mux16 MUX16_1(
		.a(data&16'h00ff), 
		.b(16'b1000000000000000),
		.sel(clear), 
		.out(regin)
	);
	
	Register REGISTER_1(
		.clk(clk),
		.in(regin),
		.load(clearorstop),
		.out(out)
	);

endmodule
