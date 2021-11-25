module display (
	input [11:0] disp_out,
	input [3:0]  count_r,
	input [3:0]  count_w,
	input	 [0:0] sw,
	output [6:0] hex0,
	output [6:0] hex1,
	output [6:0] hex2,
	output [6:0] hex4,
	output [6:0] hex6,
	output [6:0] hex7
	);
	
	// Output displays
	hexdigit hex7_display (
		.in (count_r),
		.out (hex7)
		);
	
	hexdigit hex6_display (
		.in (count_w),
		.out (hex6)
		);
	
	hexdigit hex4_display (
		.in ({3'b000, sw}),
		.out (hex4)
		);
	
	hexdigit hex2_display (
		.in (disp_out[11:8]),
		.out (hex2)
		);
	
	hexdigit hex1_display (
		.in (disp_out[7:4]),
		.out (hex1)
		);
	
	hexdigit hex0_display (
		.in (disp_out[3:0]),
		.out (hex0)
		);
		
endmodule
	