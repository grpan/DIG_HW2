module ask2_1bcd_to_7segm(output wire [6:0] seg_out,
			input wire [3:0] bcd, wire LED_type_ctl);

     	// set LED_type_ctl = 1 for common anode.
	reg [6:0] decoded;
	
	//assign 

//always block for converting bcd digit into 7 decodedment format
    always @(bcd)
    begin
        case (bcd) //case statement
            0 : decoded = 7'b0000001;
            1 : decoded = 7'b1001111;
            2 : decoded = 7'b0010010;
            3 : decoded = 7'b0000110;
            4 : decoded = 7'b1001100;
            5 : decoded = 7'b0100100;
            6 : decoded = 7'b0100000;
            7 : decoded = 7'b0001111;
            8 : decoded = 7'b0000000;
            9 : decoded = 7'b0000100;
            //switch off 7 decodedment character when the bcd digit is not a decimal number.
            default : decoded = 7'b1111111; 
        endcase
    end

	assign seg_out = LED_type_ctl ? decoded : ~decoded;
    
endmodule
