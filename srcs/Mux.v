/** 
 * Multiplexor:
 * out = a if sel == 0
 *       b otherwise
 */

 
module Mux(
	input a,
	input b,
	input sel,
	output out
);
	wire not_sel;
	wire x; wire y;

	Not NOT_1(.in(sel), .out(not_sel));
	And AND_1(.a(a), .b(not_sel), .out(x));
	And AND_2(.a(b), .b(sel), .out(y));
	Or OR_1(.a(x), .b(y), .out(out));

endmodule
