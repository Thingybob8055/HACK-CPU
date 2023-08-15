/**
 * Computes the sum of three bits.
 */

 
module FullAdder(
	input a,		//1-bit input
	input b,		//1-bit input
	input c,		//1-bit input
	output sum,		//Right bit of a + b + c
	output carry	//Left bit of a + b + c
);

	wire sum_1, carry_1, carry_2;
	HalfAdder HA_1(.a(a),.b(b),.sum(sum_1),.carry(carry_1));
	HalfAdder HA_2(.a(sum_1),.b(c),.sum(sum),.carry(carry_2));
	Or OR_1(.a(carry_1),.b(carry_2),.out(carry));

endmodule
