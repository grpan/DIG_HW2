// JK FLIP-FLOP
module jkflipflop(output Q, Qn,
		input wire Clock, Reset, Preset, J, K);
		
		
		
	wire Kn, p1, p2, s;


	// D = J & ~Q | ~K & Q
	not G1 (Kn, K);
	and P1 (p1, J, Qn);
	and P2 (p2, Kn, Q);
	or S (s, p1, p2);
	

	dflipflop DFF (.Q(Q), .Qn(Qn), .Clock(Clock), .Reset(Reset), .Preset(Preset), .D(s));


endmodule
	
/*module jkflipflop(j,k,Clock,Reset, Q,Qn);
		input j,k,Clock,Reset;
		output Q,Qn;
		reg Q,Qn;
		reg [1:0]jk;

always@(posedge Clock,posedge Reset)
		begin
		jk={j,k};
		if(Reset==0)
		begin
		case (jk)
		2'd1:Q=1'b0;
		2'd2:Q=1'b1;
		2'd3:Q=~Q;
		default: begin end
		endcase
		end
		else

		Q=1'b0;

		Qn=~Q;

		end
end module

*/
