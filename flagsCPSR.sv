module flagsCPSR (input logic zeroIn,
						input logic negativeIn,
						input logic clk,
						output logic zeroOut, 
						output logic negativeOut);

	logic zero = 1'b0;
	logic negative = 1'b0;
	
	assign zeroOut = zero;
	assign negativeOut = negative;
	
	always_ff @(negedge clk) begin
		zero <= zeroIn;
		negative <= negativeIn;
	end

endmodule
