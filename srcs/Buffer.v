/**
 * Buffer:
 * out = in
 */

 
module Buffer(
	input in,
	output out
);

	wire tmp;
	Not NOT1(.in(in),.out(tmp));
	Not NOT2(.in(tmp),.out(out));

endmodule
