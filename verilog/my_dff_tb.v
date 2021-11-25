`timescale 1ns/1ns
module my_dff_tb();
	reg [11:0] d;
	reg clk;
	reg rst;
	reg enable;
	wire [11:0] out;

	my_dff uut (
		.d (d),
		.clk (clk),
		.rst (rst),
		.enable (enable),
		.out (out)
		);
		
	always
		#5 clk = ~clk;
		
	initial begin 
			clk = 0; rst = 0; enable = 0; d= 12'h345;
		#10; d = 12'h04a;
		#10; d = 12'h111;
		#10; d = 12'h400;
		#10; d = 12'h876; rst = 1;
		#10; d = 12'habc;
		#10; $stop;
	end
endmodule
		
		