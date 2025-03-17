`timescale 1ns/1ns
module ask2_1bcd_to_7segm_TB;

	reg [3:0] bcd;
	wire [6:0] seg;
	integer i, b;
	reg cathode_type;
	reg [6:0] TBVector_ask3_7seg[19:0];

	// Instantiate the Unit Under Test (UUT)
	ask2_1bcd_to_7segm uut (.bcd(bcd), .seg_out(seg), .LED_type_ctl(cathode_type));

	//Apply inputs
	initial begin
	$readmemb("TBVector_ask3_7seg",TBVector_ask3_7seg);
	cathode_type = 1'b0;
	
		for (b=0; b<2; b=b+1) begin
			cathode_type = b==0 ? 1'b1 : 1'b0;
			$display ("Cathode type: %b", cathode_type);
			for(i = 0;i < 10;i = i+1) //run loop for 0 to 15.
			begin

				bcd = i ;
				#10; //wait for 10 ns
				if(seg !== TBVector_ask3_7seg[i+ 10 * !cathode_type]) begin
					$display("Wrong output for cathode_type: %b, i: %d, seg: %b, vector: %b"
					,cathode_type,i, seg, TBVector_ask3_7seg[i]);
				end else begin
					$display("Test %d passed!", i);
				end

			end
		end
	//$finish;
	end
	
	
	
      
endmodule