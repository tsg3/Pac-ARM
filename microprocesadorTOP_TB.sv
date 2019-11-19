module microprocesadorTOP_TB;

	logic clk, regWr, memWr;
	logic [31:0] direc, datoOut;

	microprocesadorTOP DUT(
		.clk(clk),
		.regWr(regWr),
		.memWr(memWr),
		.direc(direc),
		.datoOut(datoOut));

	initial begin
		
		clk = 1'b0;
		#10 clk = 1'b1;
		#10 clk = 1'b0;
		#10 clk = 1'b1;
		#10 clk = 1'b0;
		#10 clk = 1'b1;
		#10 clk = 1'b0;
		#10 clk = 1'b1;
		#10 clk = 1'b0;
		#10 clk = 1'b1;
		
	end
		
endmodule
