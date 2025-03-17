`timescale 1ns/1ns
module ask3_hamming_TB;

	reg clk;
	//reg reset;
	wire [16:0] enc_data;
	
	wire [4:0]p;
	


	wire [11:0] dec_data;
	reg [16:0] enc_data_err;

	reg [11:0] testMessage;
	reg [11:0] diff;
	reg [4:0]rand_idx;
	
	
	ask3_hamming_encoder dut_encoder(enc_data, testMessage);

	ask3_hamming_decoder dut_decoder(dec_data, p, enc_data_err);

	

	initial
	begin
		//testMessage = $urandom%4096;
		//dec_data = 12'b0000_0000;
		//diff = 12'b0000000000;
	end

	// Testbench passes if dec_data == testMessage
	always@(posedge clk)
	begin
		
		diff = testMessage ^ dec_data;
		
		testMessage = $urandom%4096;

	end

	always@(negedge clk)
	begin
		rand_idx = $urandom%17;
		enc_data_err = enc_data;
		enc_data_err[rand_idx] = !enc_data_err[rand_idx];
		
		$display("Message: %b, Encoded Data: %b, with error: %b, rand_idx", testMessage, enc_data, enc_data_err, rand_idx);
		
		$display("Difference of encoded-decoded messages:  %b, with p: %d.", diff, p);
		
	end

	always
		begin
			clk <=1; #5;
			clk <=0; #5;
		end

endmodule