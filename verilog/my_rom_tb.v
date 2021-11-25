`timescale 1ns/1ns
module my_rom_tb();
	reg [3:0]  raddr;
	reg 		  clk;
	reg 		  sw;
	wire [3:0] dout;
	
	my_rom uut (
		.raddr (raddr),
		.clk (clk),
		.sw (sw),
		.dout (dout)
		);
	
	always
		#5 clk = ~clk;
	
	initial begin
			clk = 0; sw = 1; raddr = 4'd4;
		#10; raddr = 4'd3;
		#10; raddr = 4'd6;
		#10; raddr = 4'd7;
		#10; raddr = 4'd9;
		#10; raddr = 4'd1;
		#10; $stop;
	end
endmodule
