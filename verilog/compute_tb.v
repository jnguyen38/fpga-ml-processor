`timescale 1ns/1ns
module compute_tb();
	reg [3:0] ram_out;
	reg [3:0] rom_out;
	reg [3:0] clk;
	reg		 rst;
	reg 		 enable;
	wire [11:0] display;
	
	compute uut (
		.ram_out (ram_out),
		.rom_out (rom_out),
		.clk (clk),
		.rst (rst),
		.enable (enable),
		.display (display)
		);
		
	always
		#5 clk = clk + 4'b1;
	
	initial begin
				clk = 0; rst= 0;
		#20;	rom_out = 4'h9; ram_out = 4'h1; enable = 1;
		#20;	ram_out = 4'h3; rom_out = 4'h2;
		#20;	ram_out = 4'ha; rom_out = 4'h3;
		#20;	ram_out = 4'h5; rom_out = 4'h4;
		#20;	ram_out = 4'h4; rom_out = 4'h5;
		#20;	ram_out = 4'h3; rom_out = 4'h6;
		#20;	ram_out = 4'h0; rom_out = 4'h7;
		#200; $stop;
	end
	
endmodule
