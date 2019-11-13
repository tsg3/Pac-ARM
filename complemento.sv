module complemento(input logic [31:0] dato,
						 output logic [31:0] dato_complemento)
	
		assign dato_complemento = ~dato;
	
endmodule
