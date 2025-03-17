module tflipflop2 (	input wire T,
					input wire Clock,
					input wire Clear,
					output reg Q, Qn);
					
	always @(posedge Clock) begin
		if(Clear) begin
			Q <= 0;
			Qn <= 1;
		end
		else begin
			case(T)
				1'b0: begin
					Q <= Q;
					Qn <= Qn;
				end
				1'b1: begin
					Q <= ~Q;
					Qn <= ~Qn;
				end
			endcase
		end
	end
endmodule