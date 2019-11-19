module unidadControl_TB;

	logic zero, selPC, regWr, selAddWr, cin, selOperaB, memWr;
	logic [1:0] operation, selDiWr;
	logic [3:0] condicion, opALU;
	logic [5:0] opcodes;

	unidadControl DUT(
		.opcodes(opcodes),
		.operation(operation),
		.condicion(condicion),
		.zero(zero),
		.selPC(selPC),
		.regWr(regWr),
		.selAddWr(selAddWr), 
		.opALU(opALU),
		.cin(cin),
		.selDiWr(selDiWr),
		.selOperaB(selOperaB),
		.memWr(memWr));
		
	initial begin
	
		zero = 1'b1;
		opcodes = 6'b111010;
		condicion = 4'b1110;
		operation = 2'b00;
	
	end

endmodule
