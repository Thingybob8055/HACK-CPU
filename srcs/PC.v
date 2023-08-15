/**
 * A 16-bit counter with load and reset control bits.
 * if      (reset[t] == 1) out[t+1] = 0
 * else if (load[t] == 1)  out[t+1] = in[t]
 * else if (inc[t] == 1)   out[t+1] = out[t] + 1  (integer addition)
 * else                    out[t+1] = out[t]
 */

 
module PC(
	input clk,
	input [15:0] in,
	input load,
	input inc,
	input reset,
	output [15:0] out
);	
	
	wire [15:0] incout, incmuxout, loadmuxout, 
	prepreout, prepreoutinc, regin;

	wire notload, isloin, isloinc, selinc;

	Not NOT_1(.in(load), .out(notload));

	Inc16 INC_1(.in(in), .out(incout));
	Mux16 MUX_1(.a(in), .b(incout), .sel(inc), .out(incmuxout));
	Mux16 MUX_2(.a(incmuxout), .b(in), .sel(load), .out(loadmuxout));
	Or OR_1(.a(inc), .b(load), .out(isloin));
	Or OR_2(.a(isloin), .b(reset), .out(isloinc));

	Inc16 INC_2(.in(out), .out(prepreout));
	And AND_1(.a(inc), .b(notload), .out(selinc));
	Mux16 MUX_3(.a(loadmuxout), .b(prepreout), .sel(selinc), .out(prepreoutinc));

	Mux16 MUX_4(.a(prepreoutinc), .b(16'b0), .sel(reset), .out(regin));
	Register REG_1(.clk(clk), .in(regin), .load(isloinc), .out(out));


endmodule
