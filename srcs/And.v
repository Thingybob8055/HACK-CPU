/**
 * And gate: 
 * out = 1 if (a == 1 and b == 1)
 *       0 otherwise
 */

 
module And(
	input a,
	input b,
	output out
);

	// Put your code here:
	wire temp;
	Nand NAND1(.a(a),.b(b),.out(temp));
	Not NOT1(.in(temp),.out(out));

endmodule
