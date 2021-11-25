`timescale 1ns/1ns
module display_tb();
	reg [11:0] disp_out;
	reg [3:0]  count_r;
	reg [3:0]  count_w;
	reg [3:0]  sw;			
	reg [3:0]  ram_out;
	wire [6:0] hex0;		
	wire [6:0] hex1;		
	wire [6:0] hex2;	
	wire [6:0] hex4;		
	wire [6:0] hex6;	
	wire [6:0] hex7;	
	
	display uut (
		.disp_out (disp_out),
      .count_r (count_r),
      .count_w (count_w),
      .sw (sw),
      .ram_out (ram_out),
      .hex0 (hex0),
      .hex1 (hex1),
      .hex2 (hex2),
      .hex4 (hex4),
      .hex6 (hex6),
      .hex7 (hex7)
		);
	
	initial begin
			disp_out = 12'h055; count_r = 4'h2; count_w = 4'd4; sw = 4'h0; ram_out = 4'h3;
		#10; disp_out = 12'h343; count_r = 4'h4; count_w = 4'ha; sw = 4'h1; ram_out = 4'h6;
		#10; disp_out = 12'h015; count_r = 4'hd; count_w = 4'd1; sw = 4'h0; ram_out = 4'ha;
		#10; $stop;
	end
	
endmodule
		