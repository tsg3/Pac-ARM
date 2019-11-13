module ALU(input logic [31:0] datoA,
			  input logic [31:0] datoB,
			  input logic carryIn,
			  output logic [31:0] salida,
			  output logic carryOut,
			  output logic overflow,
			  output logic zero)

	//Suma
	logic [31:0] resSuma;
	logic carrySuma;
	
	sumador32bit sum(datoA, datoB, carryIn, resSuma, carrySuma);
	
	//Resta
	logic [31:0] resComplemento;
	logic [31:0] resResta;
	logic carryResta;
	
	complemento comp(datoB, resComplemento);
	sumador32bit rest(datoA, resComplemento, 1'b1, resResta, carryResta);
	
	//And
	logic [31:0] resAnd;
	
	and_gate and_gate1(datoA, datoB, resAnd);
	
	
	
	
			  
endmodule
