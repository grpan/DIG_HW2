// Hamming (12,5) data encoder
module ask3_hamming_encoder (output wire [16:0]enc_data,
				input wire [11:0]data);

	wire [4:0]p;
	xor u1(p[0], data[0], data[1], data[3], data[4], data[6], data[8], data[10], data[11]);
	xor u2(p[1], data[0], data[2], data[3], data[5], data[6], data[9], data[10]);
	xor u3(p[2], data[1], data[2], data[3], data[7], data[8], data[9], data[10]);
	xor u4(p[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10]);
	xor u5(p[4], data[11]);

	// buf b1(enc_message, {data[11], p[4], data[10:4], p[3], data[3:1], p[2], data[0], p[1], p[0] });
	assign enc_data[16:0] = {data[11], p[4], data[10:4], p[3], data[3:1], p[2], data[0], p[1], p[0] };
	

endmodule