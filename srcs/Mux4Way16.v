/**
 * 16-bit multiplexor: 
 * for i = 0..15 out[i] = a[i] if sel == 0 
 *                        b[i] if sel == 1
 */

 
module Mux4Way16(
	input [15:0] a,
	input [15:0] b,
	input [15:0] c,
	input [15:0] d,
   	input [1:0] sel,
	output [15:0] out
);

	wire [15:0] temp1, temp2;	
	Mux16 MUX_1(a, b, sel[0], temp1);
	Mux16 MUX_2(c, d, sel[0], temp2);
	Mux16 MUX_3(temp1, temp2, sel[1], out);

endmodule
