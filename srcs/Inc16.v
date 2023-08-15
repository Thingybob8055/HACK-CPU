/**
 * 16-bit incrementer:
 * out = in + 1 (arithmetic addition)
 */

 
module Inc16(
	input [15:0] in,
	output [15:0] out
);

	wire carry_1, carry_2, carry_3, carry_4, 
	carry_5, carry_6, carry_7, carry_8, carry_9,
	carry_10, carry_11, carry_12, carry_13, 
	carry_14, carry_15, carry_16;

	HalfAdder HA_1(.a(in[0]),.b(1'b1),.sum(out[0]),.carry(carry_1));
	FullAdder FA_2(.a(in[1]),.b(1'b0),.c(carry_1),.sum(out[1]),.carry(carry_2));
	FullAdder FA_3(.a(in[2]),.b(1'b0),.c(carry_2),.sum(out[2]),.carry(carry_3));
	FullAdder FA_4(.a(in[3]),.b(1'b0),.c(carry_3),.sum(out[3]),.carry(carry_4));
	FullAdder FA_5(.a(in[4]),.b(1'b0),.c(carry_4),.sum(out[4]),.carry(carry_5));
	FullAdder FA_6(.a(in[5]),.b(1'b0),.c(carry_5),.sum(out[5]),.carry(carry_6));
	FullAdder FA_7(.a(in[6]),.b(1'b0),.c(carry_6),.sum(out[6]),.carry(carry_7));
	FullAdder FA_8(.a(in[7]),.b(1'b0),.c(carry_7),.sum(out[7]),.carry(carry_8));
	FullAdder FA_9(.a(in[8]),.b(1'b0),.c(carry_8),.sum(out[8]),.carry(carry_9));
	FullAdder FA_10(.a(in[9]),.b(1'b0),.c(carry_9),.sum(out[9]),.carry(carry_10));
	FullAdder FA_11(.a(in[10]),.b(1'b0),.c(carry_10),.sum(out[10]),.carry(carry_11));
	FullAdder FA_12(.a(in[11]),.b(1'b0),.c(carry_11),.sum(out[11]),.carry(carry_12));
	FullAdder FA_13(.a(in[12]),.b(1'b0),.c(carry_12),.sum(out[12]),.carry(carry_13));
	FullAdder FA_14(.a(in[13]),.b(1'b0),.c(carry_13),.sum(out[13]),.carry(carry_14));
	FullAdder FA_15(.a(in[14]),.b(1'b0),.c(carry_14),.sum(out[14]),.carry(carry_15));
	FullAdder FA_16(.a(in[15]),.b(1'b0),.c(carry_15),.sum(out[15]),.carry(carry_16));

endmodule
