/**
 * 8-way Or: 
 * out = (in[0] or in[1] or ... or in[7])
 */

 
module Or8Way(
	input [7:0] in,
	output out
);

	wire temp1, temp2, temp3, 
	temp4, temp5, temp6;

	Or OR_1(in[0], in[1], temp1);
	Or OR_2(temp1, in[2], temp2);
	Or OR_3(temp2, in[3], temp3);
	Or OR_4(temp3, in[4], temp4);
	Or OR_5(temp4, in[5], temp5);
	Or OR_6(temp5, in[6], temp6);
	Or OR_7(temp6, in[7], out);

endmodule
