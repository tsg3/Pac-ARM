module zeroExt #(parameter BITS = 16) (input logic [BITS - 1:0] datoIn,
													output logic [31:0] datoExt);
													
	assign datoExt = 32'd0 | datoIn;
	
endmodule
