/**
 * 16-bit register:
 * If load[t] == 1 then out[t+1] = in[t]
 * else out does not change
 */

 

module Register(
	input clk,
	input [15:0] in,
	input load,
	output [15:0] out
);

	Bit BIT_1(.clk(clk), .in(in[0]), .load(load), .out(out[0]));
	Bit BIT_2(.clk(clk), .in(in[1]), .load(load), .out(out[1]));
	Bit BIT_3(.clk(clk), .in(in[2]), .load(load), .out(out[2]));
	Bit BIT_4(.clk(clk), .in(in[3]), .load(load), .out(out[3]));
	Bit BIT_5(.clk(clk), .in(in[4]), .load(load), .out(out[4]));
	Bit BIT_6(.clk(clk), .in(in[5]), .load(load), .out(out[5]));
	Bit BIT_7(.clk(clk), .in(in[6]), .load(load), .out(out[6]));
	Bit BIT_8(.clk(clk), .in(in[7]), .load(load), .out(out[7]));
	Bit BIT_9(.clk(clk), .in(in[8]), .load(load), .out(out[8]));
	Bit BIT_10(.clk(clk), .in(in[9]), .load(load), .out(out[9]));
	Bit BIT_11(.clk(clk), .in(in[10]), .load(load), .out(out[10]));
	Bit BIT_12(.clk(clk), .in(in[11]), .load(load), .out(out[11]));
	Bit BIT_13(.clk(clk), .in(in[12]), .load(load), .out(out[12]));
	Bit BIT_14(.clk(clk), .in(in[13]), .load(load), .out(out[13]));
	Bit BIT_15(.clk(clk), .in(in[14]), .load(load), .out(out[14]));
	Bit BIT_16(.clk(clk), .in(in[15]), .load(load), .out(out[15]));

endmodule
