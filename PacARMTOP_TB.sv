`timescale 1 ps / 1 ps

module PacARMTOP_TB;

	logic clk;

	PacARMTOP DUT(
		.clk(clk));

	initial begin
		
		clk = 1'b0;
		repeat(5000) begin
			#10 clk = ~clk;
			#10 clk = ~clk;
		end
		
	end
		
endmodule
