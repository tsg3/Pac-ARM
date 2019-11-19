module extension #(parameter BITS = 16) (input logic [BITS - 1:0] datoIn,
													  input logic logicalOperation,
													  output logic [31:0] datoExt);
			
	always_comb begin
		if(~logicalOperation && datoIn[BITS - 1] == 1)
			datoExt = 32'd1 & datoIn;
		else
			datoExt = 32'd0 | datoIn;
	end
	
endmodule
