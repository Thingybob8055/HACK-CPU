/**
 * 16-bit bitwise Buffer:
 * for i = 0..15: out[i] = in[i]
 */

 
module Buffer16(
	input [15:0] in,
	output [15:0] out
);

	Buffer BUF_1(.in(in[0]), .out(out[0]));
	Buffer BUF_2(.in(in[1]), .out(out[1]));
	Buffer BUF_3(.in(in[2]), .out(out[2]));
	Buffer BUF_4(.in(in[3]), .out(out[3]));
	Buffer BUF_5(.in(in[4]), .out(out[4]));
	Buffer BUF_6(.in(in[5]), .out(out[5]));
	Buffer BUF_7(.in(in[6]), .out(out[6]));
	Buffer BUF_8(.in(in[7]), .out(out[7]));
	Buffer BUF_9(.in(in[8]), .out(out[8]));
	Buffer BUF_10(.in(in[9]), .out(out[9]));
	Buffer BUF_11(.in(in[10]), .out(out[10]));
	Buffer BUF_12(.in(in[11]), .out(out[11]));
	Buffer BUF_13(.in(in[12]), .out(out[12]));
	Buffer BUF_14(.in(in[13]), .out(out[13]));
	Buffer BUF_15(.in(in[14]), .out(out[14]));
	Buffer BUF_16(.in(in[15]), .out(out[15]));

endmodule
