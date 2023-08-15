/**
* RAM3840 implements 3840 Bytes of RAM addressed from 0 - 3839
* out = M[address]
* if (load =i= 1) M[address][t+1] = in[t]
*/

 

// module DMux8Way16 (
// 	input [15:0] in,
// 	input [2:0] sel,
// 	output [15:0] a,
// 	output [15:0] b,
// 	output [15:0] c,
// 	output [15:0] d,
// 	output [15:0] e,
// 	output [15:0] f,
// 	output [15:0] g,
// 	output [15:0] h
// );

// 	// Put your code here:
// 	DMux8Way DMUX_1(.in(in[0]), .sel(sel), .a(a[0]), .b(b[0]), .c(c[0]), .d(d[0]), .e(e[0]), .f(f[0]), .g(g[0]), .h(h[0]));
// 	DMux8Way DMUX_2(.in(in[1]), .sel(sel), .a(a[1]), .b(b[1]), .c(c[1]), .d(d[1]), .e(e[1]), .f(f[1]), .g(g[1]), .h(h[1]));
// 	DMux8Way DMUX_3(.in(in[2]), .sel(sel), .a(a[2]), .b(b[2]), .c(c[2]), .d(d[2]), .e(e[2]), .f(f[2]), .g(g[2]), .h(h[2]));
// 	DMux8Way DMUX_4(.in(in[3]), .sel(sel), .a(a[3]), .b(b[3]), .c(c[3]), .d(d[3]), .e(e[3]), .f(f[3]), .g(g[3]), .h(h[3]));
// 	DMux8Way DMUX_5(.in(in[4]), .sel(sel), .a(a[4]), .b(b[4]), .c(c[4]), .d(d[4]), .e(e[4]), .f(f[4]), .g(g[4]), .h(h[4]));
// 	DMux8Way DMUX_6(.in(in[5]), .sel(sel), .a(a[5]), .b(b[5]), .c(c[5]), .d(d[5]), .e(e[5]), .f(f[5]), .g(g[5]), .h(h[5]));
// 	DMux8Way DMUX_7(.in(in[6]), .sel(sel), .a(a[6]), .b(b[6]), .c(c[6]), .d(d[6]), .e(e[6]), .f(f[6]), .g(g[6]), .h(h[6]));
// 	DMux8Way DMUX_8(.in(in[7]), .sel(sel), .a(a[7]), .b(b[7]), .c(c[7]), .d(d[7]), .e(e[7]), .f(f[7]), .g(g[7]), .h(h[7]));
// 	DMux8Way DMUX_9(.in(in[8]), .sel(sel), .a(a[8]), .b(b[8]), .c(c[8]), .d(d[8]), .e(e[8]), .f(f[8]), .g(g[8]), .h(h[8]));
// 	DMux8Way DMUX_10(.in(in[9]), .sel(sel), .a(a[9]), .b(b[9]), .c(c[9]), .d(d[9]), .e(e[9]), .f(f[9]), .g(g[9]), .h(h[9]));
// 	DMux8Way DMUX_11(.in(in[10]), .sel(sel), .a(a[10]), .b(b[10]), .c(c[10]), .d(d[10]), .e(e[10]), .f(f[10]), .g(g[10]), .h(h[10]));
// 	DMux8Way DMUX_12(.in(in[11]), .sel(sel), .a(a[11]), .b(b[11]), .c(c[11]), .d(d[11]), .e(e[11]), .f(f[11]), .g(g[11]), .h(h[11]));
// 	DMux8Way DMUX_13(.in(in[12]), .sel(sel), .a(a[12]), .b(b[12]), .c(c[12]), .d(d[12]), .e(e[12]), .f(f[12]), .g(g[12]), .h(h[12]));
// 	DMux8Way DMUX_14(.in(in[13]), .sel(sel), .a(a[13]), .b(b[13]), .c(c[13]), .d(d[13]), .e(e[13]), .f(f[13]), .g(g[13]), .h(h[13]));
// 	DMux8Way DMUX_15(.in(in[14]), .sel(sel), .a(a[14]), .b(b[14]), .c(c[14]), .d(d[14]), .e(e[14]), .f(f[14]), .g(g[14]), .h(h[14]));
// 	DMux8Way DMUX_16(.in(in[15]), .sel(sel), .a(a[15]), .b(b[15]), .c(c[15]), .d(d[15]), .e(e[15]), .f(f[15]), .g(g[15]), .h(h[15]));

// endmodule

module RAM3840(
	input clk,
	input [11:0] address,
	input [15:0] in,
	input load,
	output [15:0] out
);
	
	// Put your code here:
	// wire [15:0] ram0, ram1, ram2, ram3, ram4, ram5, ram6, ram7;
	// wire load0, load1, load2, load3, load4, load5, load6, load7;
	// wire [15:0] out0, out1, out2, out3, out4, out5, out6, out7;

	// DMux8Way16 DMUX_1(.in(in), .sel(address[11:9]), .a(ram0), .b(ram1), .c(ram2), .d(ram3), .e(ram4), .f(ram5), .g(ram6), .h(ram7));
	// DMux8Way DMUX_2(.in(load), .sel(address[11:9]), .a(load0), .b(load1), .c(load2), .d(load3), .e(load4), .f(load5), .g(load6), .h(load7));
	// RAM512 RAM_1(.clk(clk), .address(address[8:0]), .in(ram0), .load(load0), .out(out0));
	// RAM512 RAM_2(.clk(clk), .address(address[8:0]), .in(ram1), .load(load1), .out(out1));
	// RAM512 RAM_3(.clk(clk), .address(address[8:0]), .in(ram2), .load(load2), .out(out2));
	// RAM512 RAM_4(.clk(clk), .address(address[8:0]), .in(ram3), .load(load3), .out(out3));
	// RAM512 RAM_5(.clk(clk), .address(address[8:0]), .in(ram4), .load(load4), .out(out4));
	// RAM512 RAM_6(.clk(clk), .address(address[8:0]), .in(ram5), .load(load5), .out(out5));
	// RAM512 RAM_7(.clk(clk), .address(address[8:0]), .in(ram6), .load(load6), .out(out6));
	// RAM512 RAM_8(.clk(clk), .address(address[8:0]), .in(ram7), .load(load7), .out(out7));
	// Mux8Way16 MUX_1(.a(out0), .b(out1), .c(out2), .d(out3), .e(out4), .f(out5), .g(out6), .h(out7), .sel(address[11:9]), .out(out));
	reg [15:0] regRAM [0:3839]; 
	always @(posedge clk)
		if (load) regRAM[address[11:0]] <= in;

	assign out = regRAM[address[11:0]];

endmodule
