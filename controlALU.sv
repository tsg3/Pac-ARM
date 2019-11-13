module controlALU(input logic [3:0] opcode,
						output logic [3:0] selOper);

	always_comb begin
		case(opcode)
			4'b0000: selOper = 4'b0000;
			4'b0010: selOper = 4'b1001;
			4'b0100: selOper = 4'b1000;
			default: selOper = 4'b0001;
		endcase
	end

endmodule
