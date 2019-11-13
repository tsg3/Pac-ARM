module registroPC (input logic [31:0] inputPC,
						 input logic clk,
						 output logic [31:0] outputPC);

	logic [31:0] PC = 32'd0;
	
	assign outputPC = PC;
	
	always_ff @(posedge clk) begin
		PC <= inputPC;
	end

endmodule
