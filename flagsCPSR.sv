module flagsCPSR (input logic [3:0] inputs,
						input logic clk,
						output logic [3:0] outputs);

	logic [3:0] flags = 4'd0;
	
	assign outputs = flags;
	
	always_ff @(negedge clk) begin
		flags <= inputs;
	end

endmodule
