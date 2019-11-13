module registroPC_TB;

	logic [31:0] inputPC, outputPC;
	logic clk = 0;

	registroPC DUT(
		.inputPC(inputPC),
		.clk(clk),
		.outputPC(outputPC));
		
	initial begin
	
		#10 inputPC = 32'd0;
		#10 clk = 1;
		#10 inputPC = 32'd56;
		#10 clk = 0;
		#20 clk = 1;
		#10 inputPC = 32'd79;
		#10 clk = 0;
		#10 inputPC = 32'd23;
		#10 clk = 1;
		#20 clk = 0;
		#20 clk = 1; inputPC = 32'd896;
	
	end

endmodule
