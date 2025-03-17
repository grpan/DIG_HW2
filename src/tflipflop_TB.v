module tflipflop_TB;
	reg clk;
	reg Reset;
	reg T;

	wire Q, Qn;

	integer i;

//tflipflop(output Q, Qn, input wire Clock, Clear, Preset, T);

  tflipflop u0 (	.Clock(Clock), .Clear(clk), .T(T), .Q(Q), .Qn(Qn) );
  
  always #5 clk = ~clk;
  
  initial begin  
    {Reset, clk, T} <= 0;
    
    $monitor ("T=%0t rstn=%0b t=%0d q=%0d", $time, Reset, T, Q);
    repeat(2) @(posedge clk);
    Reset <= 1;
    
	
    /*for (integer i = 0; i < 20; i = i+1) begin
      reg [4:0] dly = $random;
      #(dly) T <= $random;
	
    end
	#20 $finish;*/
  end
endmodule
