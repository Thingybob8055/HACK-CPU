/**
 * 1-bit register:
 * If load[t] == 1 then out[t+1] = in[t]
 *    else out does not change (out[t+1] = out[t])
 */

 
module Bit(
	input clk,
	input in,
	input load,
	output out
);

	wire mux_out;

	Mux MUX_1(.a(out), .b(in), .sel(load), .out(mux_out));
	DFF DFF_1(.clk(clk), .in(mux_out), .out(out));

endmodule
