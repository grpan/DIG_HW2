// A single digit BCD counter
module ask2_1bcd_counter (output wire [3:0]digit,
				input wire clk, reset, enable);

	parameter
		ONE = 1'b1,
		ZERO = 1'b0;

	wire qn1, qn2, qn3, qn4;
	wire s1;
	wire t3, t4, internal;
	
	//buf (internal, reset); // deactivate reset function.

	// Check for decimal overflow and reset
	and U4 (s1, digit[1], digit[3]);
	not N1 (n1, s1);
	and U6 (internal, reset, n1);

	//  Synchronous BCD 
	and A1(t3, t2, digit[1]);
	and A2(t4, t3, digit[2]);

	// Enable bit
	and A3(t2, enable, digit[0]);
	
	tflipflop T1 (.Q(digit[0]), .Qn(qn1), .Clock(clk), .Clear(internal), .Preset(ONE), .T(enable));
	tflipflop T2 (.Q(digit[1]), .Qn(qn2), .Clock(clk), .Clear(internal), .Preset(ONE), .T(t2));
	tflipflop T3 (.Q(digit[2]), .Qn(qn3), .Clock(clk), .Clear(internal), .Preset(ONE), .T(t3));
	tflipflop T4 (.Q(digit[3]), .Qn(qn4), .Clock(clk), .Clear(internal), .Preset(ONE), .T(t4));
	

endmodule