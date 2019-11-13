module and_gate(input logic [31:0] datoA, 
			  input logic [31:0] datoB,
			  output logic [31:0] salida);
	
	assign salida = datoA & datoB;
	
endmodule
