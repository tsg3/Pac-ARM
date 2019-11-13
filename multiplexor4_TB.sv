module multiplexor4_TB;

	logic [31:0] datoA, datoB, datoC, datoD, datoOutput;
	logic [1:0] selDato;
	
	assign datoA = 32'd1;
	assign datoB = 32'd2;
	assign datoC = 32'd3;
	assign datoD = 32'd4;

	multiplexor4 #(32) DUT(
		.datoA(datoA), 
		.datoB(datoB),
		.datoC(datoC),
		.datoD(datoD),
		.selDato(selDato),
		.datoOutput(datoOutput));
		
	initial begin 
		
		selDato = 2'b00;
		#10 selDato = 2'b01;
		#10 selDato = 2'b10;
		#10 selDato = 2'b11;
		
	end

endmodule
