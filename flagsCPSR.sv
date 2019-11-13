module flagsCPSR (input logic zeroIn,
						input logic clk,
						output logic zeroOut);

	logic zero = 1'b0;
	
	assign zeroOut = zero;
	
	always_ff @(negedge clk) begin
		zero <= zeroIn;
	end

endmodule
