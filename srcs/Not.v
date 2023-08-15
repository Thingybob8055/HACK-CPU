/**
 * Not gate:
 * out = not in
 */

 
module Not(
	input in,
	output out
);

	// Put your code here:
	Nand NAND(.a(in),.b(in),.out(out));

endmodule
