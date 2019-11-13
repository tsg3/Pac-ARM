module bancoRegistros_TB;

	logic clk, regWr;
	logic [31:0] diWr, pcWr, doA, doB;
	logic [3:0] addA, addB, addWr;

	bancoRegistros DUT(
		.clk(clk),
		.regWr(regWr),
		.addA(addA),
		.addB(addB),
		.addWr(addWr),
		.diWr(diWr),
		.pcWr(pcWr),
		.doA(doA),
		.doB(doB));
		
	initial begin
	
		clk = 0; regWr = 1; addA = 4'd1; addB = 4'd15; 
			addWr = 4'd1; diWr = 32'h33; pcWr = 31'h00004000;
		#20 clk = 1; pcWr = 31'h00004004;
		#20 clk = 0;
		#20 clk = 1; regWr = 0; pcWr = 31'h00004008;
		#20 clk = 0;
	
	end

endmodule
