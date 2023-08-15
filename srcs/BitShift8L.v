/**
* 8-bit Shiftregister (shifts to left)
* if      (load == 1)  out[t+1] = in[t]
* else if (shift == 1) out[t+1] = out[t]<<1 | inLSB
* (shift one position to left and insert inLSB as least significant bit)
*/

 
module BitShift8L(
	input clk,
	input [7:0] in,
	input inLSB,
	input load,
	input shift,
	output [7:0] out
);

	// Put your code here:
	reg [7:0] shift_reg;
	always @(posedge clk) begin
		if (load == 1) begin
			shift_reg <= in;
		end else if (shift == 1) begin
			shift_reg <= (shift_reg  << 1) | inLSB;
		end
	end
	assign out = shift_reg;

endmodule
