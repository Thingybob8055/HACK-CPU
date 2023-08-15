/**
 * Exclusive-or gate:
 * out = not (a == b)
 */

 
module Xor(
	input a,
	input b,
	output out
);

	wire not_out_a;
	wire not_out_b;
	wire x;
	wire y;

	Not NOT_A(.in(a), .out(not_out_a));
	Not NOT_B(.in(b), .out(not_out_b));

	And AND_1(.a(a), .b(not_out_b), .out(x));
	And AND_2(.a(not_out_a), .b(b), .out(y));

	Or OR(.a(x), .b(y), .out(out));

endmodule
