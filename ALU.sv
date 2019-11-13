module ALU(input logic [31:0] datoA,
			  input logic [31:0] datoB,
			  input logic [3:0] opCode,
			  input logic cin,
			  output logic [31:0] salida,
			  output logic cout,
			  output logic zero);

	//Suma
	logic [31:0] resSuma;
	logic carrySuma;
	
	sumador32bit sum(datoA, datoB, cin, resSuma, carrySuma);
	
	//Resta
	logic [31:0] resComplemento;
	logic [31:0] resResta;
	logic carryResta;
	
	complemento comp(datoB, resComplemento);
	sumador32bit rest(datoA, resComplemento, 1'b1, resResta, carryResta);
	
	//And
	logic [31:0] resAnd;
	
	and_gate and_gate1(datoA, datoB, resAnd);
	
	//MUX
	logic [32:0] salidaMUX;
	assign salida = salidaMUX;
	
	multiplexor16 #(32) mux1(.datoA(resAnd),
							 .datoB(32'd0),
							 .datoC(resResta),
							 .datoD(32'd0),
							 .datoE(resSuma),
							 .datoF(32'd0),
							 .datoG(32'd0),
							 .datoH(32'd0),
							 .datoI(32'd0),
							 .datoJ(32'd0),
							 .datoK(32'd0),
							 .datoL(32'd0),
							 .datoM(32'd0),
							 .datoN(32'd0),
							 .datoO(32'd0),
							 .datoP(32'd0),
							 .selDato(opCode),
							 .datoOutput(salidaMUX));
	
	always_comb begin
		case(opCode)
			4'b0010: cout = carryResta;
			4'b0100: cout = carrySuma;
			default: cout = 1'b0;
		endcase
	
		if(salidaMUX == 32'd0) zero = 1'b1;
		else zero = 1'b0;
		
	end
		  
endmodule
