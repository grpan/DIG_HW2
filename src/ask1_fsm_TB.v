`timescale 1ns/1ns
module ask1_fsm_TB;

	reg clk;
	reg reset;
	reg x_in;

	wire y_out;
	reg expectedOut;
	reg [31:0] i;

	ask1_a_fsm dut(x_in,y_out,clk,reset);

	reg [2:0] testVector[12:0];

	initial
	begin
		$readmemb("TestBenchVector",testVector);
		i=0;
		reset=1; x_in=0;
	end
	always@(posedge clk)
	begin
		{reset,x_in,expectedOut}=testVector[i];#10;
		$display(reset,x_in,expectedOut);
		end
	always@(negedge clk)
		begin
			if(expectedOut !== y_out) begin
				$display("Wrong      output      for      inputs      %b, %b!=%b",
				{reset,x_in},expectedOut,y_out);
			end
			i=i+1;
		end
	always
		begin
			clk <=1; #5;
			clk <=0; #5;
		end
endmodule
