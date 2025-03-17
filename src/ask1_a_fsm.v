// Behavioural State Machine.
module ask1_a_fsm (x_in,y_out,clk,reset);
	input	x_in,clk,reset;
	output	y_out;

localparam [2:0]
	S0 = 3'b001,
	S1 = 3'b100,
	S2 = 3'b010,
	S3 = 3'b011,
	S4 = 3'b000;
	reg[2:0] currentState,nextState;

always @(posedge clk)
begin
	if(reset)	currentState <=S0;
	else		currentState <=nextState;
end

always @*
	case(currentState)
	S0: if(x_in) nextState=S1;
		else  nextState=S0;
	S1: if(x_in) nextState=S3;
		else  nextState=S2;
	S2: if(x_in) nextState=S4;
		else  nextState=S2;
	S3: if(x_in) nextState=S2;
		else  nextState=S0;
	S4: if(x_in) nextState=S1;
		else  nextState=S3;
	default:	nextState = S0;
	endcase

	assign y_out = (x_in == 1'b1 & currentState != S1);

endmodule
