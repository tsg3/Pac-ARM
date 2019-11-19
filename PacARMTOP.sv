module PacARMTOP(input logic clk);

	logic regWr, memWr;
	logic [31:0] direc, datoOut, datoIn, teclado, memDat_temp;
	logic [1:0] selectChips;

	microprocesadorTOP ARM(
		.clk(clk),
		.datoIn(datoIn),
		.regWr(regWr),
		.memWr(memWr),
		.direc(direc),
		.datoOut(datoOut));
		
	decoder #(512) deco (
		.direc(direc),
		.selectChips(selectChips));
	
	memoriaDatos #(512) memD (
		.clk(clk),
		.memWr(memWr),
		.address(direc),
		.datoIn(datoOut),
		.datoOut(memDat_temp));
	
	assign teclado = 32'h0000001c;

	always_comb
		if(selectChips == 2'b01)
			datoIn = memDat_temp;
		else if(selectChips == 2'b10)
			datoIn = teclado;
		else
			datoIn = 32'd0;

endmodule
