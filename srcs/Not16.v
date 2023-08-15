/**
 * 16-bit Not:
 * for i=0..15: out[i] = not in[i]
 */

 
module Not16(
	input [15:0] in,
	output [15:0] out
);

	Not NOT_1(.in(in[0]), .out(out[0]));
	Not NOT_2(.in(in[1]), .out(out[1]));
	Not NOT_3(.in(in[2]), .out(out[2]));
	Not NOT_4(.in(in[3]), .out(out[3]));
	Not NOT_5(.in(in[4]), .out(out[4]));
	Not NOT_6(.in(in[5]), .out(out[5]));
	Not NOT_7(.in(in[6]), .out(out[6]));
	Not NOT_8(.in(in[7]), .out(out[7]));
	Not NOT_9(.in(in[8]), .out(out[8]));
	Not NOT_10(.in(in[9]), .out(out[9]));
	Not NOT_11(.in(in[10]), .out(out[10]));
	Not NOT_12(.in(in[11]), .out(out[11]));
	Not NOT_13(.in(in[12]), .out(out[12]));
	Not NOT_14(.in(in[13]), .out(out[13]));
	Not NOT_15(.in(in[14]), .out(out[14]));
	Not NOT_16(.in(in[15]), .out(out[15]));

endmodule
