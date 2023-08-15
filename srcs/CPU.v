/**
 * The Hack CPU (Central Processing unit), consisting of an ALU,
 * two registers named A and D, and a program counter named PC.
 * The CPU is designed to fetch and execute instructions written in 
 * the Hack machine language. In particular, functions as follows:
 * Executes the inputted instruction according to the Hack machine 
 * language specification. The D and A in the language specification
 * refer to CPU-resident registers, while M refers to the external
 * memory location addressed by A, i.e. to Memory[A]. The inM input 
 * holds the value of this location. If the current instruction needs 
 * to write a value to M, the value is placed in outM, the address 
 * of the target location is placed in the addressM output, and the 
 * writeM control bit is asserted. (When writeM==0, any value may 
 * appear in outM). The outM and writeM outputs are combinational: 
 * they are affected instantaneously by the execution of the current 
 * instruction. The addressM and pc outputs are clocked: although they 
 * are affected by the execution of the current instruction, they commit 
 * to their new values only in the next time step. If reset==1 then the 
 * CPU jumps to address 0 (i.e. pc is set to 0 in next time step) rather 
 * than to the address resulting from executing the current instruction. 
 */

 

module Load (
	input j1,
	input j2,
	input j3,
	input ng,
	input zr,

	output load
);

	// Put your code here:
	wire notj1, notj2, notj3, notng, notzr, j1j2, j1j2j3,
	j3notzr, j3notzrnotng, j3notzrcopy, j3notzrj1, j2zr,
	j2zrnotng, j2zrcopy, j2zrj1, j2j3, j2j3notng, j1ng,
	j1ngnotzr, j1ngcopy, j1ngj2;

	wire load1, load2, load3, load4, load5, load6;

	Not NOT_1(ng, notng);
	Not NOT_2(zr, notzr);
	Not NOT_3(j1, notj1);
	Not NOT_4(j2, notj2);
	Not NOT_5(j3, notj3);

	And AND_1(j1, j2, j1j2);
	And AND_2(j1j2, j3, j1j2j3);

	And AND_3(j3, notzr, j3notzr);
	And AND_4(j3notzr, notng, j3notzrnotng);

	And AND_5(j3, notzr, j3notzrcopy);
	And AND_6(j3notzrcopy, j1, j3notzrj1);

	And AND_7(j2, zr, j2zr);
	And AND_8(j2zr, notng, j2zrnotng);

	And AND_9(j2, zr, j2zrcopy);
	And AND_10(j2zrcopy, j1, j2zrj1);

	And AND_11(j2, j3, j2j3);
	And AND_12(j2j3, notng, j2j3notng);
	
	And AND_13(j1, ng, j1ng);
	And AND_14(j1ng, notzr, j1ngnotzr);

	And AND_15(j1, ng, j1ngcopy);
	And AND_16(j1ngcopy, j2, j1ngj2);

	Or OR_1(j3notzrnotng, j3notzrj1, load1);
	Or OR_2(load1, j2zrnotng, load2);
	Or OR_3(load2, j2zrj1, load3);
	Or OR_4(load3, j2j3notng, load4);
	Or OR_5(load4, j1ngnotzr, load5);
	Or OR_6(load5, j1ngj2, load6);
	Or OR_7(load6, j1j2j3, load);

endmodule

module CPU(
		input clk,
    	input [15:0] inM,         	// M value input  (M = contents of RAM[A])
    	input [15:0] instruction, 	// Instruction for execution
		input reset,				// Signals whether to re-start the current
                         			// program (reset==1) or continue executing
                         			// the current program (reset==0).

    	output [15:0] outM,			// M value output
    	output writeM,				// Write to M? 
    	output [15:0] addressM,		// Address in data memory (of M) to read
    	output [15:0] pc			// address of next instruction
);

	// Put your code here:
	wire inst15_14, c_instruction;
	wire notopcode;
	wire [15:0] alu_out;
	wire [15:0] muxout1;
	wire [15:0] muxout2;
	wire [15:0] ARegOut;
	wire [15:0] DRegOut;
	wire notopcodeordest1;
	wire DRegWrite;
	wire zero;
	wire negative;
	wire to_alu;

	wire loadout;
	wire pcload;
	wire pcinc;

	And AND_1(instruction[15], instruction[14], inst15_14);
	And AND_2(inst15_14, instruction[13], c_instruction);

	Not NOT_1(c_instruction, notopcode);
	
	And AND_3(c_instruction, instruction[5], to_alu);
	Mux16 MUX16_1(instruction, alu_out, to_alu, muxout1);
	Or OR_1(notopcode, to_alu, notopcodeordest1);
	Register A_REGISTER(clk, muxout1, notopcodeordest1, ARegOut);
	Buffer16 BUF_1(ARegOut, addressM);

	And AND_4(instruction[4], c_instruction, DRegWrite);
	Mux16 MUX16_2(ARegOut, inM, instruction[12], muxout2);
	Register D_REGISTER(clk, alu_out, DRegWrite, DRegOut);

	ALU ALU_1(DRegOut, muxout2, instruction[11], instruction[10], 
	instruction[9], instruction[8], instruction[7], 
	instruction[6], outM, zero, negative);
	Buffer16 BUF_2(outM, alu_out);

	And AND_5(instruction[3], c_instruction, writeM);

	Load LOAD_1(instruction[2], instruction[1], instruction[0], negative, zero, loadout);
	And AND_6(loadout, c_instruction, pcload);
	Not NOT_2(pcload, pcinc);

	PC PROGRAM_COUNTER(.clk(clk), .in(ARegOut), .load(pcload), .inc(pcinc), .reset(reset), .out(pc));
	

endmodule
