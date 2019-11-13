module multiplexor8 #(parameter BITS = 32) (input logic [BITS - 1:0] datoA, datoB,
																							datoC, datoD,
																							datoE, datoF,
																							datoG, datoH,
														  input logic [2:0] selDato,
														  output logic [BITS - 1:0] datoOutput);
	
	logic [BITS - 1:0] resultLSB, resultMSB;
	
	multiplexor4 #(BITS) muxLSB (
		.datoA(datoA),
	   .datoB(datoB),
		.datoC(datoC),
		.datoD(datoD),
	   .selDato(selDato[1:0]),
	   .datoOutput(resultLSB));
	
	multiplexor4 #(BITS) muxMSB(
		.datoA(datoE),
	   .datoB(datoF),
		.datoC(datoG),
		.datoD(datoH),
	   .selDato(selDato[1:0]),
	   .datoOutput(resultMSB));
		
	multiplexor2 #(BITS) muxSEL(
		.datoA(resultLSB),
	   .datoB(resultMSB),
	   .selDato(selDato[2]),
	   .datoOutput(datoOutput));

endmodule
