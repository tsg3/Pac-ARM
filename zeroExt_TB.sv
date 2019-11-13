module zeroExt_TB;

	logic [15:0] datoIn;
	logic [31:0] datoExt;

	zeroExt #(16) DUT (
		.datoIn(datoIn),
		.datoExt(datoExt));

	initial begin
	
		datoIn = 16'b1101001010100101;
		#10 datoIn = 16'b1001100010100101;
		#10 datoIn = 16'b1110001100011100;
	
	end
		
endmodule
