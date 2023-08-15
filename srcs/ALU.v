/**
 * The ALU (Arithmetic Logic Unit).
 * Computes one of the following functions:
 * x+y, x-y, y-x, 0, 1, -1, x, y, -x, -y, !x, !y,
 * x+1, y+1, x-1, y-1, x&y, x|y on two 16-bit inputs, 
 * according to 6 input bits denoted zx,nx,zy,ny,f,no.
 * In addition, the ALU computes two 1-bit outputs:
 * if the ALU output == 0, zr is set to 1; otherwise zr is set to 0;
 * if the ALU output < 0, ng is set to 1; otherwise ng is set to 0.
 */

// Implementation: the ALU logic manipulates the x and y inputs
// and operates on the resulting values, as follows:
// if (zx == 1) set x = 0        // 16-bit constant
// if (nx == 1) set x = !x       // bitwise not
// if (zy == 1) set y = 0        // 16-bit constant
// if (ny == 1) set y = !y       // bitwise not
// if (f == 1)  set out = x + y  // integer 2's complement addition
// if (f == 0)  set out = x & y  // bitwise and
// if (no == 1) set out = !out   // bitwise not
// if (out == 0) set zr = 1
// if (out < 0) set ng = 1

 
module ALU(
	input [15:0] x,		// input x (16 bit)
	input [15:0] y,		// input y (16 bit)
    input zx, 				// zero the x input?
    input nx, 				// negate the x input?
    input zy, 				// zero the y input?
    input ny, 				// negate the y input?
    input f,  				// compute out = x + y (if 1) or x & y (if 0)
    input no, 				// negate the out output?
    output [15:0] out, 			// 16-bit output
    output zr, 				// 1 if (out == 0), 0 otherwise
    output ng 				// 1 if (out < 0),  0 otherwise
);

    wire [15:0] zx_out, zy_out;
    wire [15:0] not_zx_out, not_zy_out;
    wire [15:0] nx_out, ny_out;
    wire [15:0] and_out, add_out;
    wire [15:0] pre_out, not_out;
    wire [7:0] pre_zr_1, pre_zr_2;
    wire zr_1, zr_2, zr_or;

    //output of computation
	Mux16 MUX_1(.a(x),.b(16'b0),.sel(zx),.out(zx_out));
    Mux16 MUX_2(.a(y),.b(16'b0),.sel(zy),.out(zy_out));
    Not16 NOT_1(.in(zx_out),.out(not_zx_out));
    Mux16 MUX_3(.a(zx_out),.b(not_zx_out),.sel(nx),.out(nx_out));
    Not16 NOT_2(.in(zy_out),.out(not_zy_out));
    Mux16 MUX_4(.a(zy_out),.b(not_zy_out),.sel(ny),.out(ny_out));
    And16 AND_1(.a(nx_out),.b(ny_out),.out(and_out));
    Add16 ADD_1(.a(nx_out),.b(ny_out),.out(add_out));
    Mux16 MUX_5(.a(and_out),.b(add_out),.sel(f),.out(pre_out));
    Not16 NOT_3(.in(pre_out),.out(not_out));
    Mux16 MUX_6(.a(pre_out),.b(not_out),.sel(no),.out(out));

    //output of ng flag
    assign ng = out[15];

    //output of zr flag
    assign pre_zr_1 = out[7:0];
    assign pre_zr_2 = out[15:8];
    Or8Way OR_1(.in(pre_zr_1),.out(zr_1));
    Or8Way OR_2(.in(pre_zr_2),.out(zr_2));
    Or OR_3(.a(zr_1),.b(zr_2),.out(zr_or));
    Not NOT_4(.in(zr_or),.out(zr));

endmodule
