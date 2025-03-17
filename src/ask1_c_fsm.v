// Structural State Machine (D Flip-Flop).
module ask1_c_fsm (x_in,y_out,clk,reset);
	input	x_in,clk,reset;
	output	y_out;

	wire D2, D1, D0, T; //States and inputs
	wire y_out;
	wire D2n, D1n, D0n, Tn;

	wire J2, K2, J1, K1, J0, K0;
	//wire J2n, K2n, J1n, K1n, J0n, K0n;
	
	buf buf1 (T, x_in);
	not R (resetn, reset);

	not U0 (D2n, D2);
	not U1 (D1n, D1);
	not U2 (D0n, D0);
	not Uin (Tn, T);

	// J2
	and U4 (J2, D1n, T);
	// set K2
	
	// J1
	and U5 (s1, D0n, Tn);
	or P1 (J1, s1, D2);
	// K1
	xor X1 (K1, D0, T);

	// J0
	and U6 (s2, D2n, D1n, Tn);
	and U7 (s3, D2, T);
	or P2 (J0, s2, s3);
	// K0
	buf B1 (K0, T);

	// Store FSM information in D fLip-flops
	jkflipflop SD0 (.Q(D0), .Clock(clk), .Reset(1'b1), .Preset(resetn), .J(J0), .K(K0));
	jkflipflop SD1 (.Q(D1), .Clock(clk), .Reset(resetn), .Preset(1'b1), .J(J1), .K(K1));
	jkflipflop SD2 (.Q(D2), .Clock(clk), .Reset(resetn), .Preset(1'b1), .J(J2), .K(1'b1));

	// FSM output
	and (y_out, D2n, T);
endmodule
