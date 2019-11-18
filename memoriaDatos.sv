module memoriaDatos #(parameter size = 32) (input logic clk,
														   input logic memWr,
														   input logic [31:0] address,
														   input logic [31:0] datoIn,
														   output logic [31:0] datoOut);
	
	logic [7:0] memoria [0:size - 1];

	always_ff @(negedge clk) begin
		if(~memWr) begin
			memoria[address] <= datoIn[31:24];
			memoria[address + 1] <= datoIn[23:16];
			memoria[address + 2] <= datoIn[15:8];
			memoria[address + 3] <= datoIn[7:0];
		end
	end
	
	always_comb begin
		if(^memoria[address] === 1'bX) begin
			datoOut = 32'd0;
		end
		else begin
			datoOut = {memoria[address], 
						  memoria[address + 1], 
						  memoria[address + 2], 
						  memoria[address + 3]};
		end				
	end
endmodule
