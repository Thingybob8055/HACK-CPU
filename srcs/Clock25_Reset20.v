/**
* Uses CLK of 100MHz to generate:
* internal clock signal clk with 25MHz and
* a reset signal of approx. 20us length
*/
 
module Clock25_Reset20( 
    input CLK,			// external clock 100 MHz	
	output clk,			// internal clock 25 Mhz
	output reset 		// reset signal approx. 20us
);

	// Put your code here:
	wire [15:0] counter_out;
	wire clkHigh;
	// wire resetCnt;

	PC Counter(.clk(CLK), .in(16'b0), .load(1'b0), .inc(1'b1), .reset(1'b0), .out(counter_out));
	// Mux MUX_1(.a(1'b0), .b(1'b1), .sel(counter_out[0]), .out(clk));

	And AND_1(.a(1'b1), .b(counter_out[1]), .out(clk));
	wire bit_out;
	wire bitload;
	wire not_bit_out;
	Not NOT_1(.in(bit_out), .out(not_bit_out));
	Bit BIT_1(.clk(CLK), .in(counter_out[11]), .load(bitload), .out(bit_out));
	And ANDEE(1'b1, not_bit_out, bitload);

	Not NOT_2(.in(bit_out), .out(reset));

	
	// FOR TINYFPGA
	// assign clk = CLK;

endmodule
