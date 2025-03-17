// Hamming (12,5) data decoder
module ask3_hamming_decoder (output reg [11:0]dec_data, wire [4:0]p,
				input wire [16:0]enc_data);

	//wire [4:0]p;
	/*xor u1(p[0], data[0], data[1], data[3], data[4], data[6], data[8], data[10], data[11]);
	xor u2(p[1], data[0], data[2], data[3], data[5], data[6], data[9], data[10]);
	xor u3(p[2], data[1], data[2], data[3], data[7], data[8], data[9], data[10]);
	xor u4(p[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10]);
	xor u5(p[4], data[11]);

	assign p[0] = 
	
	localparam tmp = 1b0;
	for (i=0; i<17; i=i+1) begin
		if data[i] = 1b1;
			
	end*/

	assign p[0] = (enc_data[0] ^ enc_data[2] ^ enc_data[4] ^ enc_data[6] ^ enc_data[8] ^ enc_data[10] ^ enc_data[12] ^ enc_data[14] ^ enc_data[16]);
	assign p[1] = (enc_data[1] ^ enc_data[2] ^ enc_data[5] ^ enc_data[6] ^ enc_data[9] ^ enc_data[10] ^ enc_data[13] ^ enc_data[14]);
	assign p[2] = (enc_data[3] ^ enc_data[4] ^ enc_data[5] ^ enc_data[6] ^ enc_data[11] ^ enc_data[12] ^ enc_data[13] ^ enc_data[14]);
	assign p[3] = (enc_data[7] ^ enc_data[8] ^ enc_data[9] ^ enc_data[10] ^ enc_data[11] ^ enc_data[12] ^ enc_data[13] ^ enc_data[14]);
	assign p[4] = (enc_data[16]);

	/*xor p1(p[0], enc_data[0], enc_data[2], enc_data[4], enc_data[6], enc_data[8], enc_data[10], enc_data[12], enc_data[14], enc_data[16]);
	xor p2(p[1], enc_data[1], enc_data[2], enc_data[5], enc_data[6], enc_data[9], enc_data[10], enc_data[13], enc_data[14]);
	xor p3(p[2], enc_data[3], enc_data[4], enc_data[5], enc_data[6], enc_data[11], enc_data[12], enc_data[13], enc_data[14]);
	xor p4(p[3], enc_data[7], enc_data[8], enc_data[9], enc_data[10], enc_data[11], enc_data[12], enc_data[13], enc_data[14]);
	xor p5(p[4], enc_data[7], enc_data[16], enc_data[17]);*/

	//assign p[3:0] = { p5, p4, p3, p2, p[0] };


	// { enc_data[16], enc_data[15:8], enc_data[6:4], !enc_data[2] }

	always @( enc_data[16:0] or p[4:0] )
	begin
		case ( p[4:0] )
			5'b0_0011: dec_data[11:0] <= { enc_data[16], enc_data[15:8], enc_data[6:4], !enc_data[2] }; // 3
			5'b0_0101: dec_data[11:0] <= { enc_data[16], enc_data[15:8], enc_data[6:5], !enc_data[4], enc_data[2] }; //5
			5'b0_0110: dec_data[11:0] <= { enc_data[16], enc_data[15:8], enc_data[6], !enc_data[5], enc_data[4], enc_data[2] }; // 6
			5'b0_0111: dec_data[11:0] <= { enc_data[16], enc_data[15:8], !enc_data[6], enc_data[5:4], enc_data[2] }; // 7
			5'b0_1001: dec_data[11:0] <= { enc_data[16], enc_data[15:9], !enc_data[8], enc_data[6:4], enc_data[2] }; // 9
			5'b0_1010: dec_data[11:0] <= { enc_data[16], enc_data[15:10], !enc_data[9], enc_data[8], enc_data[6:4], enc_data[2] }; // 10
			5'b0_1011: dec_data[11:0] <= { enc_data[16], enc_data[15:11], !enc_data[10], enc_data[9:8], enc_data[6:4], enc_data[2] }; // 11
			5'b0_1100: dec_data[11:0] <= { enc_data[16], enc_data[15:12], !enc_data[11], enc_data[10:8], enc_data[6:4], enc_data[2] }; // 12
			5'b0_1101: dec_data[11:0] <= { enc_data[16], enc_data[15:13], !enc_data[12], enc_data[11:8], enc_data[6:4], enc_data[2] }; // 13
			5'b0_1110: dec_data[11:0] <= { enc_data[16], enc_data[15:14], !enc_data[13], enc_data[12:8], enc_data[6:4], enc_data[2] }; // 14
			5'b0_1111: dec_data[11:0] <= { enc_data[16], enc_data[15], !enc_data[14], enc_data[13:8], enc_data[6:4], enc_data[2] }; // 15
			5'b1_0001: dec_data[11:0] <= { !enc_data[16], enc_data[15:8], enc_data[6:4], enc_data[2] }; // 17
			default: dec_data[11:0] <= { enc_data[16], enc_data[15:8], enc_data[6:4], enc_data[2] };
		endcase
	end


endmodule