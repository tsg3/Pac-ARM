module memoriaInstrucciones(input logic clk,
									 input logic [31:0] direc,
									 output logic [31:0] dato);
	
	logic [31:0] memoria [0:127];

	initial
		$readmemh("code.dat", memoria);
		
	always_ff @(posedge clk)
		dato <= memoria[direc[31:2]];

endmodule
