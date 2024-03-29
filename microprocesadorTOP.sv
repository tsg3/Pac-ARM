module microprocesadorTOP (input logic clk,
									input logic [31:0] datoIn,
									output logic regWr,
									output logic memWr,
									output logic [31:0] direc,
									output logic [31:0] datoOut);
									
	logic [31:0] instruccionDirec, instruccion, regDoA,  
		PCWr, regDiWr, operadorB, newPC, PCLR, 
		jump, BranchAddr, immExt;
	logic cin, coutALU, zero, selPC, selAddWr, 
		selOperaB, zeroOut, carryPC4, carryPC8, 
		carryPCB, logicalOperation, selAddB, negative, negativeOut;
	logic [1:0] selDiWr;
	logic [3:0] regDirecB, regDirecWr, opALU;

	memoriaInstrucciones memI(
		.clk(clk),
		.direc(instruccionDirec),
		.dato(instruccion));
		
	bancoRegistros regBanco(
		.clk(clk),
		.regWr(regWr),
		.addA(instruccion[19:16]),
		.addB(regDirecB),
		.addWr(regDirecWr),
		.diWr(regDiWr),
		.pcWr(PCWr),
		.doA(regDoA),
		.doB(datoOut));
		
	ALU ALU(
		.datoA(regDoA), 
		.datoB(operadorB), 
		.opCode(opALU), 
		.cin(cin), 
		.salida(direc), 
		.cout(coutALU), 
		.zero(zero),
		.negative(negative));
	
	unidadControl UC(
		.opcodes(instruccion[25:20]),
		.operation(instruccion[27:26]),
		.condicion(instruccion[31:28]),
		.zero(zeroOut),
		.negative(negativeOut),
		.selPC(selPC),
		.regWr(regWr),
		.selAddB(selAddB),
		.selAddWr(selAddWr), 
		.opALU(opALU),
		.cin(cin),
		.selDiWr(selDiWr),
		.selOperaB(selOperaB),
		.memWr(memWr),
		.logicalOperation(logicalOperation));
		
	flagsCPSR CPSR(
		.zeroIn(zero),
		.negativeIn(negative),
		.clk(clk),
		.zeroOut(zeroOut),
		.negativeOut(negativeOut));
		
	registroPC PC(
		.inputPC(newPC),
		.clk(clk),
		.outputPC(instruccionDirec));
		
	sumador32bit sumadorPC4(
		.datoA(32'd4),
		.datoB(instruccionDirec),
		.carryIn(1'b0),
		.resultado(PCLR),
		.carryOut(carryPC4));
		
	sumador32bit sumadorPC8(
		.datoA(32'd4),
		.datoB(PCLR),
		.carryIn(1'b0),
		.resultado(PCWr),
		.carryOut(carryPC8));
		
	sumador32bit sumadorBranch(
		.datoA(PCWr),
		.datoB({jump[29:0], 2'b00}),
		.carryIn(1'b0),
		.resultado(BranchAddr),
		.carryOut(carryPCB));
		
	multiplexor2 #(32) MUXPC (
		.datoA(PCLR),
	   .datoB(BranchAddr),
	   .selDato(selPC),
	   .datoOutput(newPC));
		
	multiplexor2 #(4) MUXB (
		.datoA(instruccion[3:0]),
	   .datoB(instruccion[15:12]),
	   .selDato(selAddB),
	   .datoOutput(regDirecB));
		
	multiplexor2 #(4) MUXWR (
		.datoA(instruccion[15:12]),
	   .datoB(4'b1110),
	   .selDato(selAddWr),
	   .datoOutput(regDirecWr));
		
	multiplexor2 #(32) MUXOperaB (
		.datoA(datoOut),
	   .datoB(immExt),
	   .selDato(selOperaB),
	   .datoOutput(operadorB));
		
	multiplexor4 #(32) MUXDI (
		.datoA(direc), 
		.datoB(immExt),
		.datoC(datoIn),
		.datoD(PCLR),
		.selDato(selDiWr),
		.datoOutput(regDiWr));
		
	extension #(8) extendImm (
		.datoIn(instruccion[7:0]),
		.logicalOperation(logicalOperation),
		.datoExt(immExt));
		
	extension #(24) extendJump (
		.datoIn(instruccion[23:0]),
		.logicalOperation(logicalOperation),
		.datoExt(jump));

endmodule
