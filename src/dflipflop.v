// D FLIP-FLOP (D_ff_with_asynch_reset_behavior)
module dflipflop(output reg Q, Qn,
		input wire Clock, Reset, Preset, D);
	
always @(posedge Clock or negedge Reset or negedge Preset)
	if (!Reset)
		begin
			Q <= 1'b0;
			Qn <= 1'b1;
		end
	else if (!Preset)
		begin
			Q <= 1'b1;
			Qn <= 1'b0;
		end
	else
		begin
			Q <= D;
			Qn <= ~D;
		end
endmodule
