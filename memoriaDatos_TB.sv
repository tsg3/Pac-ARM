module memoriaDatos_TB;

	logic clk, memWr;
	logic [31:0] address, datoIn, datoOut;

	memoriaDatos #(32) DUT (
		.clk(clk),
		.memWr(memWr),
		.address(address),
		.datoIn(datoIn),
		.datoOut(datoOut));
		
	initial begin
		
		clk = 0;
		memWr = 1;
		address = 32'd0;
		datoIn = 32'h330FF033;
		#20 clk = 1;
		#20 clk = 0;
		#20 clk = 1; memWr = 0;
		#20 clk = 0;
	end

endmodule
