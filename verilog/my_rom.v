module my_rom (
	input 		[3:0] 	raddr,
	input 					clk,
	input						sw,
	output reg	[3:0]		dout
	);
	
	reg [3:0] arr [0:15];
	
	initial begin
		arr[0] = 4'h0;
		arr[1] = 4'h1;
		arr[2] = 4'h2;
		arr[3] = 4'h3;
		arr[4] = 4'h4;
		arr[5] = 4'h5;
		arr[6] = 4'h6;
		arr[7] = 4'h7;
		arr[8] = 4'h8;
		arr[9] = 4'h9;
		arr[10] = 4'ha;
		arr[11] = 4'hb;
		arr[12] = 4'hc;
		arr[13] = 4'hd;
		arr[14] = 4'he;
		arr[15] = 4'h0;
		dout = 0;
	end
	
	always @(posedge clk)
		if (sw == 1)
			dout = arr[raddr];
		
endmodule
