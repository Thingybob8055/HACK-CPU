/**
 * Demultiplexor:
 * {a, b} = {in, 0} if sel == 0
 *          {0, in} if sel == 1
 */

 
module DMux(
	input in,
	input sel,
    output a,
	output b
);

	wire not_sel;
	wire x; wire y;

	Not NOT_1(.in(sel), .out(not_sel));
	And AND_1(.a(in), .b(not_sel), .out(a));
	And AND_2(.a(in), .b(sel), .out(b));

endmodule
