`timescale 1ns/1ns
module adder_tb();
	reg clk;
	reg [7:0] a;
	reg [11:0] b;
	wire [11:0] out;
	
	adder uut (
		.clk (clk),
		.a (a),
		.b (b),
		.out (out)
		);
	
	always
		#5 clk = ~clk;
	
	initial begin
			a = 8'd1; b = 12'd2; clk = 0;
		#10; a = 8'd3; b = 12'd3;
		#10; a = 8'd15; b = 12'd11;
		#10; a = 8'd7; b = 12'd4;
		#10; a = 8'd20; b = 12'd5;
		#10; a = 8'd9; b = 12'd7;
		#10; $stop;
	end
	
endmodule
