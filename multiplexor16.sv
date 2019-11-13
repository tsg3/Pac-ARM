module multiplexor16 #(parameter BITS = 32) (input logic [BITS - 1:0] datoA, datoB,
																							datoC, datoD,
																							datoE, datoF,
																							datoG, datoH,
																							datoI, datoJ,
																							datoK, datoL,
																							datoM, datoN,
																							datoO, datoP,
														  input logic [3:0] selDato,
														  output logic [BITS - 1:0] datoOutput);
	
	logic [BITS - 1:0] resultLSB, resultMSB;
	
	multiplexor8 #(BITS) muxLSB (
		.datoA(datoA),
	   .datoB(datoB),
		.datoC(datoC),
		.datoD(datoD),
		.datoE(datoE),
	   .datoF(datoF),
		.datoG(datoG),
		.datoH(datoH),
	   .selDato(selDato[2:0]),
	   .datoOutput(resultLSB));
	
	multiplexor8 #(BITS) muxMSB(
		.datoA(datoI),
	   .datoB(datoJ),
		.datoC(datoK),
		.datoD(datoL),
		.datoE(datoM),
	   .datoF(datoN),
		.datoG(datoO),
		.datoH(datoP),
	   .selDato(selDato[2:0]),
	   .datoOutput(resultMSB));
		
	multiplexor2 #(BITS) muxSEL(
		.datoA(resultLSB),
	   .datoB(resultMSB),
	   .selDato(selDato[3]),
	   .datoOutput(datoOutput));

endmodule
