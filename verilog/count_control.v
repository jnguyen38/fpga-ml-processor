module count_control (
	input CLOCK_50,
	input w_RX_DV,
	input rst,
	input [0:0] SW,
	output reg [3:0] clk_delay,
	output reg [3:0] count_w,
	output reg [3:0] count_r 
	);

	initial begin           
		clk_delay = 0;       // Initialize clock delay counter so that the clock delay can increment
		count_r = 0;
		count_w = 0;
	end

	always @(posedge CLOCK_50) 
		// Increment clk_delay
		clk_delay <= clk_delay + 4'd1;
	
	always @(posedge CLOCK_50) begin
		// Reset conditional for count_w with CLOCK_50
		if (rst == 1 && SW[0] == 0)
			count_w = 4'b0;

		// Increment count_w with posedge CLOCK_50
		if (rst == 0 && SW[0] == 0)
			if (w_RX_DV) 
				if (count_w < 15)
					count_w <= count_w + 4'b1;
	end
	
	always @(posedge clk_delay[1]) begin
		// Reset conditional for count_r with clk_delay[1]
		if (rst == 1 && SW[0] == 0) begin
			count_r <= 4'b0;
		end
		
		// Increment count_r with clk_delay[1]
		if (rst == 0 && SW[0] == 1) begin
			if (count_r < 15) begin
				count_r <= count_r + 4'b1;
			end
		end
	end
	
endmodule
