module unidadControl	(input logic [5:0] opcodes,
							 input logic [1:0] operation,
							 input logic [3:0] condicion,
							 input logic zero,
							 output logic selPC,
							 output logic regWr,
							 output logic selAddB, 
							 output logic selAddWr, 
							 output logic [3:0] opALU,
							 output logic cin,
							 output logic [1:0] selDiWr,
							 output logic selOperaB,
							 output logic memWr, 
							 output logic logicalOperation);

	always_comb begin
		case(operation)
			2'b00: begin
						selPC = 1'b0;
						if((opcodes[4:1] == 4'b1010) || (condicion == 4'b0000))
							regWr = 1'b1;
						else
							regWr = 1'b0;
						selAddB = 1'b0;
						selAddWr = 1'b0;
						opALU = opcodes[4:1];
						if(opcodes[4:1] == 4'b0010)
							cin = 1'b1;
						else
							cin = 1'b0;
						if(opcodes[4:1] == 4'b1101)
							selDiWr = 2'b01;
						else
							selDiWr = 2'b00;
						if(opcodes[5] == 1'b1)
							selOperaB = 1'b1;
						else
							selOperaB = 1'b0;
						memWr = 1'b1;
						if(opcodes[4:1] == 4'b0000)
							logicalOperation = 1'b1;
						else
							logicalOperation = 1'b0;
					 end
			2'b01: begin
						selPC = 1'b0;
						if(opcodes[0] == 1'b0) begin
							regWr = 1'b1;
							memWr = 1'b0;
						end
						else begin
							regWr = 1'b0;
							memWr = 1'b1;
						end
						selAddB = 1'b1;
						selAddWr = 1'b0;
						if(opcodes[3] == 1'b1)
							opALU = 4'b0100;
						else
							opALU = 4'b0010;
						cin = 1'b0;
						selDiWr = 2'b10;
						if(opcodes[5] == 1'b1)
							selOperaB = 1'b0;
						else
							selOperaB = 1'b1;
						logicalOperation = 1'b0;
					 end
			2'b10: begin
						if((condicion == 4'b0001 && ~zero) || (condicion == 4'b0000 && zero))
							selPC = 1'b1;
						else
							selPC = 1'b0; 
						if(opcodes[4] == 1'b0)
							regWr = 1'b1;
						else
							regWr = 1'b0;
						selAddB = 1'b0;
						selAddWr = 1'b1;
						opALU = 4'b0000;
						cin = 1'b0;
						selDiWr = 2'b11;
						selOperaB = 1'b0;
						memWr = 1'b1;
						logicalOperation = 1'b0;
					 end
			default: begin
						selPC = 1'b0; 
						regWr = 1'b1;
						selAddB = 1'b0;
						selAddWr = 1'b0;
						opALU = 4'b0000;
						cin = 1'b0;
						selDiWr = 2'b00;
						selOperaB = 1'b0;
						memWr = 1'b1;
						logicalOperation = 1'b1;
					 end
		endcase
	end

endmodule
