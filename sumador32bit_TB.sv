module sumador32bit_TB;
	
	logic carryIn, carryOut;
	logic [31:0] datoA, datoB, resultado;
	
	assign carryIn = 1'b0;
	
	sumador32bit DUT(
		.datoA(datoA),
		.datoB(datoB),
		.carryIn(carryIn),
		.resultado(resultado),
		.carryOut(carryOut));
	
	initial begin
		datoA = 32'd45; datoB = 32'd45;
		#10 datoA = 32'd0; datoB = 32'd325;
		#10 datoA = 32'd23845; datoB = 32'd5645;
		#10 datoA = 32'd1; datoB = 32'd425;
		#10 datoA = 32'd2342; datoB = 32'd4348345;
		#10 datoA = 32'd4294967290; datoB = 32'd4294967290;
	end

endmodule
