module complemento(input logic [31:0] dato,
						 output logic [31:0] dato_complemento);
	
		
		always_comb begin
			if(dato == 32'd0) dato_complemento = dato;
			else dato_complemento = ~dato;				
		end
	
endmodule
