module multiplexor4 #(parameter BITS = 32) (input logic [BITS - 1:0] datoA, datoB,
																							datoC, datoD,
														  input logic [1:0] selDato,
														  output logic [BITS - 1:0] datoOutput);
	
	logic [BITS - 1:0] resultLSB, resultMSB;
	
	multiplexor2 #(BITS) muxLSB (
		.datoA(datoA),
	   .datoB(datoB),
	   .selDato(selDato[0]),
	   .datoOutput(resultLSB));
	
	multiplexor2 #(BITS) muxMSB(
		.datoA(datoC),
	   .datoB(datoD),
	   .selDato(selDato[0]),
	   .datoOutput(resultMSB));
		
	multiplexor2 #(BITS) muxSEL(
		.datoA(resultLSB),
	   .datoB(resultMSB),
	   .selDato(selDato[1]),
	   .datoOutput(datoOutput));

endmodule
