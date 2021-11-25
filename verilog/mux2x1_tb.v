`timescale 1ns/1ns
module mux2x1_tb();
	reg clk;
	reg sel;
	reg [11:0] b;
	wire [11:0] out;
	
	mux2x1 uut (
		.clk (clk),
		.sel (sel),
		.b (b),
		.out (out)
		);
	
	always
		#5 clk = ~clk;
	
	initial begin
				b= 4'd2; sel = 1; clk = 0;
		#10;	b = 4'd3;
		#10; 	b = 4'd11;
		#10;	b = 4'd4;
		#10; 	b = 4'd5; sel = 0;
		#10;	b = 4'd7; sel = 1;
		#10; $stop;
	end
	
endmodule
