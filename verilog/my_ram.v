module my_ram (
   input [3:0]       clk,
	input 				CLOCK_50,
	input					rst,
	input					sw,
   input [3:0]      	raddr,
	input [3:0] 		waddr,
   input [3:0]       din,
   input             we,
   output reg [3:0]  dout
   );
   
   reg [3:0] arr [0:15];
	
	initial begin
		arr[0] = 4'b0;
		arr[1] = 4'b0;
		arr[2] = 4'b0;
		arr[3] = 4'b0;
		arr[4] = 4'b0;
		arr[5] = 4'b0;
		arr[6] = 4'b0;
		arr[7] = 4'b0;
		arr[8] = 4'b0;
		arr[9] = 4'b0;
		arr[10] = 4'b0;
		arr[11] = 4'b0;
		arr[12] = 4'b0;
		arr[13] = 4'b0;
		arr[14] = 4'b0;
		arr[15] = 4'b0;
		dout = 0;
	end
	
	always @(posedge CLOCK_50) begin
		if (rst == 1 && sw == 0) begin
			arr[0] <= 4'b0;
			arr[1] <= 4'b0;
			arr[2] <= 4'b0;
			arr[3] <= 4'b0;
			arr[4] <= 4'b0;
			arr[5] <= 4'b0;
			arr[6] <= 4'b0;
			arr[7] <= 4'b0;
			arr[8] <= 4'b0;
			arr[9] <= 4'b0;
			arr[10] <= 4'b0;
			arr[11] <= 4'b0;
			arr[12] <= 4'b0;
			arr[13] <= 4'b0;
			arr[14] <= 4'b0;
			arr[15] <= 4'b0;
		end
		if (rst == 0 && sw == 0)
			if (we == 1)
				arr[waddr] <= din;
	end	
		
	always @(posedge clk[1])
		if (sw == 1) 
			dout <= arr[raddr];    
   
endmodule
