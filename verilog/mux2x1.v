module mux2x1 (
	input [11:0] b,
	input 		sel,
	input 		clk,
	output reg [11:0] out
	);
	
	reg [11:0] a;
	
	initial a = 0;
	
	always @(posedge clk)
		if (sel == 0)
			out <= a;
		else
			out <= b;

endmodule 