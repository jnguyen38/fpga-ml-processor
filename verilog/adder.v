module adder(
	input		[7:0] a,
	input 	[11:0] b,
	input				clk,
	output reg	[11:0] out
	);
	
	initial out = 0;
	
	always @(posedge clk)
		if (a >= 0 && b >= 0)
			out = a + b;

endmodule
