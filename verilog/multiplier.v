module multiplier(
	input		[3:0] a,
	input 	[3:0] b,
	input				clk,
	input 			enable,
	output reg	[7:0] out
	);
	
	initial out = 0;
	
	always @(posedge clk)
		if (enable == 1)
			out = a * b;
		else
			out = 0;

endmodule
