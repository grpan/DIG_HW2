// Structural State Machine (D Flip-Flop).
module ask1_b_fsm (x_in,y_out,clk,reset);
	input	x_in,clk,reset;
	output	y_out;

	wire D2, D1, D0, T; //States and inputs
	wire y_out;
	wire D2n, D1n, D0n, Tn;
	//wire resetn;

	buf buf1 (T, x_in);
	not R (resetn, reset);

	not U0 (D2n, D2);
	not U1 (D1n, D1);
	not U2 (D0n, D0);
	not Ui (Tn, T);

	// Product terms of D0
	and U4 (s1, D2n, Tn, D0);
	and U5 (s2, D2n, Tn, D1n);
	and U6 (s3, D2, T, D1n, D0n);

	// Product terms of D1
	and U7 (s4, D2n, D0n, Tn);
	and U8 (s5, D2n, D1, D0, T);
	and U9 (s6, D2, D1n, D0n);

	// Product term of D2
	and U10 (s7, D2n, D1n, T);
	
	// Sum of products for D0 and D1
	or U11 (p0 , s1, s2, s3);
	or U12 (p1 , s4, s5, s6);

	// Store FSM information in D fLip-flops
	dflipflop SD0 (.Q(D0), .Clock(clk), .Reset(1'b1), .Preset(resetn), .D(p0));
	dflipflop SD1 (.Q(D1), .Clock(clk), .Reset(resetn), .Preset(1'b1), .D(p1));
	dflipflop SD2 (.Q(D2), .Clock(clk), .Reset(resetn), .Preset(1'b1), .D(s7));

	// FSM output
	
	and (y_out, D2n, T);
endmodule
