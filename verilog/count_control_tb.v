module count_control_tb();
	reg t_clk;
   reg DV;
   reg rst;
   reg SW;
   wire [3:0] clk_delay;
   wire [3:0] count_w;
   wire [3:0] count_r; 
	
	count_control uut (
		.CLOCK_50 (t_clk),
		.w_RX_DV (DV),
		.rst (rst),
		.SW (SW),
		.clk_delay (clk_delay),
		.count_w (count_w),
		.count_r (count_r)
		);
	
	always
		#5 t_clk = ~t_clk;
	
	initial begin
			t_clk = 0; rst = 0; DV = 1; SW = 0; 
		#100; rst = 1;
		#10; rst = 0;
		#100; SW = 1; DV = 0;
		#200; SW = 0; rst = 1;
		#20; $stop;
	end

endmodule
