module multiplexor2 #(parameter BITS = 32) (input logic [BITS - 1:0] datoA,
														  input logic [BITS - 1:0] datoB,
														  input logic selDato,
														  output logic [BITS - 1:0] datoOutput);

	assign datoOutput = selDato ? datoB : datoA;
														  
endmodule
