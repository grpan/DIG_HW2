`timescale 1ns/1ns
module ask2_1bcd_counter_TB;

	reg clk;
	reg reset;
	reg enable;
	

	reg [31:0] i;

	wire [3:0]digit;

	ask2_1bcd_counter bcd_single(digit,clk,reset, enable);


	initial
	begin
		i=0;
		enable = 1;
		reset=0;
		#10;
		reset = 1;
		#130;
		enable = 0;
		#30
		enable = 1;
		
	end
	
	always
		begin
			clk <=1; #5;
			clk <=0; #5;
		end
endmodule