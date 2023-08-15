 /**
 * Or gate:
 * out = 1 if (a == 1 or b == 1)
 *       0 otherwise
 */

 
module Or(
	input a,
	input b,
	output out
);

	// Put your code here:
	wire temp;
	wire temp2;
	Not NOT1(.in(a),.out(temp));
	Not NOT2(.in(b),.out(temp2));
	Nand NAND1(.a(temp),.b(temp2),.out(out));

endmodule
