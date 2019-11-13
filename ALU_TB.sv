module ALU_TB;

	logic [31:0] datoA, datoB, salida;
	logic cin, cout, zero;
	logic [3:0] opCode;
	
	ALU DUT(datoA, datoB, opCode, cin, salida, cout, zero);
	
	initial begin
			 datoA = 32'd10; datoB = 32'd10; cin = 0; opCode = 4'b0100;
		#10 datoA = 32'd00; datoB = 32'd10; cin = 0; opCode = 4'b0100;
		#10 datoA = 32'd00; datoB = 32'd00; cin = 0; opCode = 4'b0100;
		#10 datoA = 32'd40; datoB = 32'd52; cin = 0; opCode = 4'b0100;
		
		#10 datoA = 32'd10; datoB = 32'd10; cin = 1; opCode = 4'b0010;
		#10 datoA = 32'd00; datoB = 32'd10; cin = 1; opCode = 4'b0010;
		#10 datoA = 32'd10; datoB = 32'd00; cin = 1; opCode = 4'b0010;
		#10 datoA = 32'd20; datoB = 32'd30; cin = 1; opCode = 4'b0010;
		
		#10 datoA = 32'd11; datoB = 32'd11; cin = 0; opCode = 4'b0000;
		#10 datoA = 32'd06; datoB = 32'd04; cin = 0; opCode = 4'b0000;
		#10 datoA = 32'd15; datoB = 32'd15; cin = 0; opCode = 4'b0000;
		#10 datoA = 32'd00; datoB = 32'd00; cin = 0; opCode = 4'b0000;
		
	
	end
	

endmodule
