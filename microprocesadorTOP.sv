module microprocesadorTOP (input logic clk,
//									input logic datoIn,
									output logic regWr,
									output logic memWr,
									output logic [31:0] direc,
									output logic [31:0] datoOut);
									
	logic [31:0] instruccionDirec, instruccion, regDoB, 
		PCWr, regDiWr, operadorB, datoIn, 
		newPC, PCLR, jump, BranchAddr, immExt;
	logic cin, coutALU, zero, selPC, selAddWr, 
		selOperaB, zeroOut, carryPC4, carryPC8, 
		carryPCB, logicalOperation, selAddA, selAddB;
	logic [1:0] selDiWr;
	logic [3:0] regDirecA, regDirecB, regDirecWr, opALU;

	memoriaInstrucciones memI(
		.clk(clk),
		.direc(instruccionDirec),
		.dato(instruccion));
		
	bancoRegistros regBanco(
		.clk(clk),
		.regWr(regWr),
		.addA(regDirecA),
		.addB(regDirecB),
		.addWr(regDirecWr),
		.diWr(regDiWr),
		.pcWr(PCWr),
		.doA(datoOut),
		.doB(regDoB));
		
	ALU ALU(
		.datoA(datoOut), 
		.datoB(operadorB), 
		.opCode(opALU), 
		.cin(cin), 
		.salida(direc), 
		.cout(coutALU), 
		.zero(zero));
	
	memoriaDatos #(512) memD (
		.clk(clk),
		.memWr(memWr),
		.address(direc),
		.datoIn(datoOut),
		.datoOut(datoIn));
		
	unidadControl UC(
		.opcodes(instruccion[25:20]),
		.operation(instruccion[27:26]),
		.condicion(instruccion[31:28]),
		.zero(zeroOut),
		.selPC(selPC),
		.regWr(regWr),
		.selAddA(selAddA),
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
		.clk(clk),
		.zeroOut(zeroOut));
		
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
		.datoB(jump),
		.carryIn(1'b0),
		.resultado(BranchAddr),
		.carryOut(carryPCB));
		
	multiplexor2 #(32) MUXPC (
		.datoA(PCLR),
	   .datoB(BranchAddr),
	   .selDato(selPC),
	   .datoOutput(newPC));
		
	multiplexor2 #(4) MUXA (
		.datoA(instruccion[19:16]),
	   .datoB(instruccion[15:12]),
	   .selDato(selAddA),
	   .datoOutput(regDirecA));
		
	multiplexor2 #(4) MUXB (
		.datoA(instruccion[3:0]),
	   .datoB(instruccion[19:16]),
	   .selDato(selAddB),
	   .datoOutput(regDirecB));
		
	multiplexor2 #(4) MUXWR (
		.datoA(instruccion[15:12]),
	   .datoB(4'b1110),
	   .selDato(selAddWr),
	   .datoOutput(regDirecWr));
		
	multiplexor2 #(32) MUXOperaB (
		.datoA(regDoB),
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
