module compute (
	input [3:0] ram_out,
	input [3:0] rom_out,
	input [3:0] clk,
	input			rst,
	input 		enable,
	output reg [11:0] display
	);
	
	reg mux_sel = 0;
	
	wire [7:0]	mult_out;   // Output wire for multiplier			input for adder
	wire [11:0] add_out;    // Output wire for adder				input for dff
	wire [11:0] dff_out;    // Output wire for dff					input for HEX0 - HEX4 and mux2x1
	wire [11:0] mux_out;    // Output wire for mux2x1				input for adder
	
	multiplier mult_rr (
		.a (ram_out),
		.b (rom_out),
		.clk (clk[1]),
		.enable (enable),
		.out (mult_out)
		);
		
	adder add_rr (
		.a (mult_out),
		.b (mux_out),
		.clk (clk[1]),
		.out (add_out)
		);
	
	my_dff dff_rr (
		.d (add_out),
		.clk (clk[0]),
		.rst (rst),
		.enable (enable),
		.out (dff_out)
		);
		
	mux2x1 mux_in (
		.b (dff_out),
		.clk (clk[0]),
		.sel (mux_sel),
		.out (mux_out)
		);
	
	always @(posedge clk[0])
		display <= dff_out;
	
	always @(posedge clk[2])
		if (enable == 1)
			mux_sel = 1;
	
endmodule
