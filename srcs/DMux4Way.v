/**
 * 4-way demultiplexor:
 * {a, b, c, d} = {in, 0, 0, 0} if sel == 00
 *                {0, in, 0, 0} if sel == 01
 *                {0, 0, in, 0} if sel == 10
 *                {0, 0, 0, in} if sel == 11
 */

 
module DMux4Way(
	input in,
	input [1:0] sel,
    output a,
	output b,
	output c,
	output d
);
	
	wire temp1, temp2;
	DMux D_MUX_1(in, sel[1], temp1, temp2);
	DMux D_MUX_2(temp1, sel[0], a, b);
	DMux D_MUX_3(temp2, sel[0], c, d);

endmodule
