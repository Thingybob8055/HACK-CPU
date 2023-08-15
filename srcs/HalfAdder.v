/**
 * Computes the sum of two bits.
 */

 
module HalfAdder(
	input a,		//1-bit input
	input b,		//1-bit inpur
	output sum,	//Right bit of a + b
	output carry	//Lef bit of a + b
);

	Xor XOR_1(.a(a),.b(b),.out(sum));
	And AND_1(.a(a),.b(b),.out(carry));

endmodule
