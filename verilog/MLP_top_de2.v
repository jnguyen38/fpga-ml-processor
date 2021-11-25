module MLP_top_de2 (
	input 			CLOCK_50,			// 50 MHz clock			
	input 			UART_RXD,      	// Keyboard input	
	input  [0:0]	KEY,
	input  [0:0] 	SW,
	output [6:0]	HEX0,
	output [6:0] 	HEX1,
	output [6:0] 	HEX2,
	output [6:0] 	HEX4,
	output [6:0]	HEX6,
	output [6:0]	HEX7
	);
	
	wire w_RX_DV;
	wire [7:0] w_RX_Byte;
	
   UART_RX #(.CLKS_PER_BIT(5208)) UART_RX_Inst (
      .i_Clock       (CLOCK_50),
      .i_RX_Serial   (UART_RXD),
      .o_RX_DV       (w_RX_DV),
      .o_RX_Byte     (w_RX_Byte)
   );
	
	system system0 (
		.CLOCK_50 (CLOCK_50),
		.w_RX_Byte (w_RX_Byte[3:0]),		
		.w_RX_DV (w_RX_DV),
      .KEY  (KEY[0]),
      .SW   (SW[0]),
      .HEX0 (HEX0),
      .HEX1 (HEX1),
      .HEX2 (HEX2),
      .HEX4 (HEX4),
      .HEX6 (HEX6),
      .HEX7 (HEX7)
	);

endmodule
