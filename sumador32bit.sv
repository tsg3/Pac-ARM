module sumador32bit (input logic [31:0] datoA, 
						  input logic [31:0] datoB, 
						  input logic carryIn,
						  output logic [31:0] resultado,
						  output logic carryOut);
						  
	assign {carryOut, resultado} = datoA + datoB + carryIn;	

endmodule
