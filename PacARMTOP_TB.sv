module PacARMTOP_TB;

	logic clk;

	PacARMTOP DUT(
		.clk(clk));

	initial begin
		
		clk = 1'b0;
		repeat(33) begin
			#10 clk = ~clk;
			#10 clk = ~clk;
		end
		
	end
		
endmodule
