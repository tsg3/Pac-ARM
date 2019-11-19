module extension #(parameter BITS = 16) (input logic [BITS - 1:0] datoIn,
													  input logic logicalOperation,
													  output logic [31:0] datoExt);
	
	int i;
	
	always_comb begin
		if(~logicalOperation)
			datoExt = 32'(signed'(datoIn));
		else
			datoExt = datoIn;
	end
	
endmodule
