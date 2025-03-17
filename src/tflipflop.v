// T FLIP-FLOP (D_ff_with_asynch_reset_behavior)
module tflipflop(output Q, Qn,
		input wire Clock, Clear, Preset, T);

	wire x;

	xor (x, Q, T);
		

	dflipflop DFF (.Q(Q), .Qn(Qn), .Clock(Clock), .Reset(Clear), .Preset(Preset), .D(x));

	
endmodule
