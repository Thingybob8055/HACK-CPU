/**
 * The HACK computer, including CPU, ROM and RAM.
 * When RST is 1, the program stored in the computer's ROM executes.
 * When RST is 0, the execution of the program restarts. 
 * Thus, to start a program's execution, reset must be pushed "down" (0)
 * and "up" (1). From this point onward the user is at the mercy of 
 * the software. In particular, depending on the program's code, the 
 * LED may show some output and the user may be able to interact 
 * with the computer via the BUT.
 */

 
module HACK( 
    input  CLK,				// external clock 100 MHz	
	input  [1:0] BUT,		// user button  ("pushed down" == 0) ("up" == 1)
	output [1:0] LED,		// leds (0 off, 1 on)
	input  UART_RX,			// UART recieve
	output UART_TX			// UART transmit
//	output SPI_SDO,			// SPI data out
//	input  SPI_SDI,			// SPI data in
//	output SPI_SCK,			// SPI serial clock
//	output SPI_CSX,			// SPI chip select not
//	output [17:0] SRAM_ADDR,// SRAM address 18 Bit = 256K
//	inout [15:0] SRAM_DATA,	// SRAM data 16 Bit
//	output SRAM_WEX,		// SRAM write_enable_not
//	output SRAM_OEX,		// SRAM output_enable_not
//	output SRAM_CSX, 		// SRAM chip_select_not
//	output LCD_DCX,			// LCD data/command not
//	output LCD_SDO,			// LCD data out 
//	output LCD_SCK,			// LCD serial clock
//	output LCD_CSX,			// LCD chip select not
//	input  RTP_SDI,			// RTP data in s
//	output RTP_SDO,			// RTP data out 
//	output RTP_SCK			// RTP serial clock
);

	// Put your code here:
	wire clk;
	wire reset;
	wire [15:0] program_counter;
	wire [15:0] instruction;
	wire [15:0] outM;
	wire writeM;
	wire [15:0] memory_out;
	wire [15:0] addressM;

	wire loadRAM;
	wire loadIO0;
	wire loadIO1;
	wire loadIO2;
	wire loadIO3;
	wire loadIO4;
	wire loadIO5;
	wire loadIO6;
	wire loadIO7;
	wire loadIO8;
	wire loadIO9;
	wire loadIOA;
	wire loadIOB;
	wire loadIOC;
	wire loadIOD;
	wire loadIOE;
	wire loadIOF;

	wire [15:0] outRAM;
	wire [15:0] outIO0;
	wire [15:0] outIO1;
	wire [15:0] outIO2;
	wire [15:0] outIO3;
	wire [15:0] outIO4;
	wire [15:0] outIO5;
	wire [15:0] outIO6;
	wire [15:0] outIO7;
	wire [15:0] outIO8;
	wire [15:0] outIO9;
	wire [15:0] outIOA;
	wire [15:0] outIOB;
	wire [15:0] outIOC;
	wire [15:0] outIOD;
	wire [15:0] outIOE;
	wire [15:0] outIOF;

	Clock25_Reset20 CLOCK(.CLK(CLK), .clk(clk), .reset(reset));

	ROM Rom(.pc(program_counter), .instruction(instruction));

	CPU Cpu(.clk(clk), .inM(memory_out), .instruction(instruction), .reset(reset), .outM(outM), .writeM(writeM), .addressM(addressM), .pc(program_counter));

	Memory Mem(
		.address(addressM),
		.load(writeM),
		.out(memory_out),
		.loadRAM(loadRAM),
		.inRAM(outRAM),
		.loadIO0(loadIO0),
		.loadIO1(loadIO1),
		.loadIO2(loadIO2),
		.loadIO3(loadIO3),
		.loadIO4(loadIO4),
		.loadIO5(loadIO5),
		.loadIO6(loadIO6),
		.loadIO7(loadIO7),
		.loadIO8(loadIO8),
		.loadIO9(loadIO9),
		.loadIOA(loadIOA),
		.loadIOB(loadIOB),
		.loadIOC(loadIOC),
		.loadIOD(loadIOD),
		.loadIOE(loadIOE),
		.loadIOF(loadIOF),
		.inIO0(outIO0),
		.inIO1(outIO1),
		.inIO2(outIO2),
		.inIO3(outIO3),
		.inIO4(outIO4),
		.inIO5(outIO5),
		.inIO6(outIO6),
		.inIO7(outIO7),
		.inIO8(outIO8),
		.inIO9(outIO9),
		.inIOA(outIOA),
		.inIOB(outIOB),
		.inIOC(outIOC),
		.inIOD(outIOD),
		.inIOE(outIOE),
		.inIOF(outIOF)
	);

	RAM3840 RAM3840_1(.clk(clk), .address(addressM[11:0]), .in(outM), .load(loadRAM), .out(outRAM));
	Register LED_IO(.clk(clk), .in(outM), .load(loadIO0), .out(outIO0));
	Register BUT_IO(.clk(clk), .in({BUT}), .load(1'b1), .out(outIO1));
	UartTX UART_TX_1(.clk(clk), .in(outM), .load(loadIO2), .out(outIO2), .TX(UART_TX));
	UartRX UART_RX_1(.clk(clk), .clear(outM[15]&loadIO3), .RX(UART_RX), .out(outIO3));
	Register REG_4(.clk(clk), .in(outM), .load(loadIO4), .out(outIO4));
	Register REG_5(.clk(clk), .in(outM), .load(loadIO5), .out(outIO5));
	Register REG_6(.clk(clk), .in(outM), .load(loadIO6), .out(outIO6));
	Register REG_7(.clk(clk), .in(outM), .load(loadIO7), .out(outIO7));
	Register REG_8(.clk(clk), .in(outM), .load(loadIO8), .out(outIO8));
	Register REG_9(.clk(clk), .in(outM), .load(loadIO9), .out(outIO9));
	Register REG_A(.clk(clk), .in(outM), .load(loadIOA), .out(outIOA));
	Register REG_B(.clk(clk), .in(outM), .load(loadIOB), .out(outIOB));
	Register REG_C(.clk(clk), .in(outM), .load(loadIOC), .out(outIOC));
	Register REG_D(.clk(clk), .in(outM), .load(loadIOD), .out(outIOD));
	Register REG_E(.clk(clk), .in(outM), .load(loadIOE), .out(outIOE));
	Register REG_F(.clk(clk), .in(outM), .load(loadIOF), .out(outIOF));

	Buffer BUF_1(outIO0[0], LED[0]);
	Buffer BUF_2(outIO0[1], LED[1]);

endmodule
