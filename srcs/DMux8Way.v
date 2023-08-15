/**
 * 8-way demultiplexor:
 * {a, b, c, d, e, f, g, h} = {in, 0, 0, 0, 0, 0, 0, 0} if sel == 000
 *                            {0, in, 0, 0, 0, 0, 0, 0} if sel == 001
 *                            etc.
 *                            {0, 0, 0, 0, 0, 0, 0, in} if sel == 111
 */

 
module DMux8Way(
	input in,
	input [2:0] sel,
    output a,
	output b,
	output c,
	output d,
	output e,
	output f,
	output g,
	output h
);

	wire p, q, r, s;
	wire or_out_1, or_out_2;
	DMux4Way DMUX_1(in, sel[2:1], p, q, r, s);
	Or OR_1(p, q, or_out_1);
	Or OR_2(r, s, or_out_2);
	DMux4Way DMUX_2(or_out_1, sel[1:0], a, b, c, d);
	DMux4Way DMUX_3(or_out_2, sel[1:0], e, f, g, h);

endmodule
