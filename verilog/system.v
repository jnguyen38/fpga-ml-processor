module system (
	input 			CLOCK_50,			// 50 MHz clock
	input				w_RX_DV,
	input  [3:0] 	w_RX_Byte,      	// Keyboard input	
	input  [0:0]	KEY,
	input  [0:0] 	SW,
	output [6:0]	HEX0,
	output [6:0] 	HEX1,
	output [6:0] 	HEX2,
	output [6:0] 	HEX4,
	output [6:0]	HEX6,
	output [6:0]	HEX7
	);
	
	// RAM and ROM raddr input
	wire [3:0] 	count_r;
	wire [3:0] 	count_w;
	wire [3:0] 	clk_delay;    // delays the 50 MHz clock up to a factor of 8
	
	wire [0:0]	rst;
	wire [3:0]	rom_out;
	wire [3:0]	ram_out;
	wire [11:0] disp_out;
	
	// Reset debouncer connects ~KEY[0] to rst
	debounce db_rst (
		.CLOCK_50 (clk_delay[1]),
		.in (~KEY[0]),
		.out (rst)
		);	

	edge_detect dv_det(
		.clk (CLOCK_50),
		.in (w_RX_DV),
		.out (DV)
		);
	
	// RAM Module
	my_ram ram16x4 (
		.we (DV),
		.rst (rst),
		.sw (SW[0]),
		.waddr (count_w),
		.raddr (count_r),
		.din (w_RX_Byte),
		.clk (clk_delay),
		.CLOCK_50 (CLOCK_50),
		.dout (ram_out)
		);
	
	// ROM Module stores preloaded values and outputs values based on the passed in address
	my_rom rom16x8 (
		.raddr (count_r),
		.clk (clk_delay[1]),
		.sw (SW[0]),
		.dout (rom_out)
		);
	
	// Computes and stores intermediate values of ROM and RAM once switch is activated
	compute compute_mod (
		.ram_out (ram_out),
		.rom_out (rom_out),
		.clk (clk_delay),
		.rst (rst),
		.enable (SW[0]),
		.display (disp_out)
		);

	// Displays to all hexes
	display disp_hex (
		.disp_out (disp_out),
		.count_r (count_r),
		.count_w (count_w),
		.sw (SW[0]), 
		.hex0 (HEX0),
		.hex1 (HEX1),
		.hex2 (HEX2),
		.hex4 (HEX4),
		.hex6 (HEX6),
		.hex7 (HEX7)
		);		
	
	// Controls the counter based on switch input
	count_control controller (
		.CLOCK_50 (CLOCK_50),
		.w_RX_DV (DV),
		.rst (rst),
		.SW (SW[0]),
		.clk_delay (clk_delay),
		.count_w (count_w),
		.count_r (count_r) 
		);
				
endmodule
