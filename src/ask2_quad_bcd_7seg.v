// A single digit BCD counter
module ask2_quad_bcd_7seg (output wire [15:0]digits, [23:0]seg_out,
				input wire clk, reset, enable);
				
	
	wire [3:0] digit1, digit2, digit3, digit4;
	wire a1, a2, a3;
	assign digits =  {digit1, digit2, digit3, digit4};
	
	and A1(a1, digit1[1], digit1[3]);
	and A2(a2, digit2[1], digit2[3]);
	and A3(a3, digit3[1], digit3[3]);
	
	
	ask2_1bcd_counter C1(.digit(digit1), .clk(clk), .reset(reset), .enable(enable));
	ask2_1bcd_counter C2(.digit(digit2), .clk(a1), .reset(reset), .enable(enable));
	ask2_1bcd_counter C3(.digit(digit3), .clk(a2), .reset(reset), .enable(enable));
	ask2_1bcd_counter C4(.digit(digit4), .clk(a3), .reset(reset), .enable(enable));
	
	
	wire LED_type_ctl;
	
	wire [6:0] seg_out1, seg_out2, seg_out3, seg_out4;
	assign seg_out =  {seg_out1, seg_out2, seg_out3, seg_out4};
	
	ask2_1bcd_to_7segm S1(.seg_out(seg_out1), .bcd(digit1), .LED_type_ctl(LED_type_ctl));
	ask2_1bcd_to_7segm S2(.seg_out(seg_out2), .bcd(digit2), .LED_type_ctl(LED_type_ctl));
	ask2_1bcd_to_7segm S3(.seg_out(seg_out3), .bcd(digit3), .LED_type_ctl(LED_type_ctl));
	ask2_1bcd_to_7segm S4(.seg_out(seg_out4), .bcd(digit4), .LED_type_ctl(LED_type_ctl));


endmodule
