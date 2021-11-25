module my_dff(
	input [11:0] d,
	input clk,
	input rst,
	input enable,
	output reg [11:0] out 
	);

	initial out = 0;
	
	always @(posedge clk) begin
		if (rst == 1 && enable == 0)
			out <= 0;
		else
			out <= d;
	end
	
endmodule
