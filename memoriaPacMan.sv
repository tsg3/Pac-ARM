module memoriaPacMan (input logic clk,
							 input logic memWr,
							 input logic [31:0] address,
							 input logic [31:0] datoIn,
//							 output logic [31:0] memoria [0:1],
							 output logic [31:0] pacmanX,
							 output logic [31:0] pacmanY,
							 output logic [31:0] datoOut);
							 
	logic [31:0] x = 32'b0;
	logic [31:0] y = 32'b0;
	
//	assign memoria = pacman;
	assign pacmanX = x;
	assign pacmanY = y;

	always_ff @(negedge clk)
		if(~memWr)
			if(address == 32'b0)
				x <= datoIn;
			else
				y <= datoIn;
	
	always_comb
		if(address == 32'b0)
			datoOut <= x;
		else
			datoOut <= y;

endmodule
