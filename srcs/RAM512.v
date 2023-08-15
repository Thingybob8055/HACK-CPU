/**
* RAM512 implements 512 Bytes of RAM addressed from 0 - 511
* out = M[address]
* if (load =i= 1) M[address][t+1] = in[t]
*/

 

module DMux16 (
	input [15:0] in,
	input sel,
	output [15:0] a,
	output [15:0] b
);

	// Put your code here:
	DMux DMUX_1(.in(in[0]), .sel(sel), .a(a[0]), .b(b[0]));
	DMux DMUX_2(.in(in[1]), .sel(sel), .a(a[1]), .b(b[1]));
	DMux DMUX_3(.in(in[2]), .sel(sel), .a(a[2]), .b(b[2]));
	DMux DMUX_4(.in(in[3]), .sel(sel), .a(a[3]), .b(b[3]));
	DMux DMUX_5(.in(in[4]), .sel(sel), .a(a[4]), .b(b[4]));
	DMux DMUX_6(.in(in[5]), .sel(sel), .a(a[5]), .b(b[5]));
	DMux DMUX_7(.in(in[6]), .sel(sel), .a(a[6]), .b(b[6]));
	DMux DMUX_8(.in(in[7]), .sel(sel), .a(a[7]), .b(b[7]));
	DMux DMUX_9(.in(in[8]), .sel(sel), .a(a[8]), .b(b[8]));
	DMux DMUX_10(.in(in[9]), .sel(sel), .a(a[9]), .b(b[9]));
	DMux DMUX_11(.in(in[10]), .sel(sel), .a(a[10]), .b(b[10]));
	DMux DMUX_12(.in(in[11]), .sel(sel), .a(a[11]), .b(b[11]));
	DMux DMUX_13(.in(in[12]), .sel(sel), .a(a[12]), .b(b[12]));
	DMux DMUX_14(.in(in[13]), .sel(sel), .a(a[13]), .b(b[13]));
	DMux DMUX_15(.in(in[14]), .sel(sel), .a(a[14]), .b(b[14]));
	DMux DMUX_16(.in(in[15]), .sel(sel), .a(a[15]), .b(b[15]));

endmodule

module RAM512(
	input clk,
	input [8:0] address,
	input [15:0] in,
	input load,
	output [15:0] out
);
	
	// Put your code here:

	wire [15:0] ram0, ram1;
	wire load1, load2;
	wire [15:0] out1, out2;

	DMux16 DMUX_1(.in(in), .sel(address[8]), .a(ram0), .b(ram1));
	DMux DMUX_2(.in(load), .sel(address[8]), .a(load1), .b(load2));
	RAM256 RAM_1(.clk(clk), .address(address[7:0]), .in(ram0), .load(load1), .out(out1));
	RAM256 RAM_2(.clk(clk), .address(address[7:0]), .in(ram1), .load(load2), .out(out2));
	Mux16 MUX_1(.a(out1), .b(out2), .sel(address[8]), .out(out));


endmodule
