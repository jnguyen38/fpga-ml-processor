`timescale 1ns/1ns
module my_ram_tb();
	reg [3:0]  	clk;
	reg 		 	CLOCK_50;
	reg		 	rst;
	reg		 	sw;
	reg [3:0] 	raddr;
	reg [3:0] 	waddr;
	reg [3:0] 	din;
	reg		 	we;
	wire [3:0]  dout;

	my_ram uut (
		.clk (clk),
		.CLOCK_50 (CLOCK_50),
		.rst (rst),
		.sw (sw),
		.raddr (raddr),
		.waddr (waddr),
		.din (din),
		.we (we),
		.dout (dout)
		);
		
	always @(posedge CLOCK_50)
		clk = clk + 4'b1;
	
	always
		#2	CLOCK_50 = ~CLOCK_50;
	
	initial begin
			clk = 0; CLOCK_50 = 0; rst = 0; sw = 0; we = 1; raddr = 0; waddr = 0; din = 4'd15;
		#8; waddr = 4'd1; din = 4'd3;
		#8; waddr = 4'd2; din = 4'd7;
		#8; sw = 1; we = 0;
		#20; raddr = 4'd0; 
		#20; raddr = 4'd1; 
		#20; raddr = 4'd2; 
		#20; rst = 1; sw = 0;
		#20; rst = 0;
		#20; $stop;
	end
endmodule
