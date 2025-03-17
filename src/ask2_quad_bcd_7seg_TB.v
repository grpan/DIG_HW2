`timescale 1ns/1ns
module ask2_quad_bcd_7seg_TB;

	//100000 ns
	//sim 100400 ns
	
	reg clk;
	reg reset;
	reg enable;
	

	wire [15:0]digits;
	wire [3:0] digit1, digit2, digit3, digit4;
	assign {digit1, digit2, digit3, digit4} = digits;
	
	wire [23:0]seg_out;
	wire [6:0] seg_out1, seg_out2, seg_out3, seg_out4;
	assign {seg_out1, seg_out2, seg_out3, seg_out4} = seg_out;

	integer i;
	
	ask2_quad_bcd_7seg ask3_final_quad(digits,seg_out,clk,reset, enable);


	initial
	begin
		i = -2;
		enable = 1;
		reset=0;
		#10;
		reset = 1;
		
		#100100;
		enable = 0;
		#30
		enable = 1;
		
		#20
		
		reset = 1;
		#40;
		reset = 0;
		

		
	end
	
	always@(posedge clk)
	begin
		i = i +1;
		$display("i: %d, Digits: %d%d%d%d    %d.",i, digit4, digit3, digit2, digit1, digit4*1000+digit3*100+digit2*10+digit1);
		
		if (i == digit4*1000+digit3*100+digit2*10+digit1) begin
		//$display ("Numbers good");
		end else begin
		$display ("Numbers bad ");
		end
	end
	
	
	always
		begin
			clk <=1; #5;
			clk <=0; #5;
		end
endmodule