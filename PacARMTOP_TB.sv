module PacARMTOP_TB;

	logic clk;

	PacARMTOP DUT(
		.clk(clk));

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
