module PacARMTOP(input logic clk,
					  input logic rst, 
					  input logic ps2_clk,
					  input logic ps2_d,
					  output logic hsync,
					  output logic vsync, 
					  output logic nsync,
					  output logic nblank,
					  output logic clk_out,
					  output logic [7:0] R,
					  output logic [7:0] G,
					  output logic [7:0] B, 
					  output logic [7:0] word_out);
					  
	logic regWr, memWr, WrDat, WrPacMan, read_done;
	logic [31:0] direc, datoOut, datoIn, teclado, memDat_temp, 
		memPacMan_temp;
	logic [2:0] selectChips;
//	logic [31:0] pacman [0:1];

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
		.memWr(WrDat),
		.address(direc),
		.datoIn(datoOut),
		.datoOut(memDat_temp));
		
	keyboard_decoder keyboard(
		.ps2_clk(ps2_clk), 
		.ps2_d(ps2_d), 
		.reset(rst),
		.word_out(word_out),
		.read_done(read_done));
	
	assign teclado = {24'h000000, word_out};
	
//	memoriaPacMan memPM (
//		.clk(clk),
//		.memWr(WrPacMan),
//		.address(direc - 32'd513),
//		.datoIn(datoOut),
//		.memoria(pacman),
//		.pacmanX(pacmanX),
//		.pacmanY(pacmanY),
//		.datoOut(memPacMan_temp));
	
	vga_controller VGA(
		.clock_in(clk),
		.rst(!rst),
		.memWr(WrPacMan),
		.address(direc - 32'd513),
		.datoIn(datoOut),
		.letra(word_out),
//		.pacman(pacman),
//		.pacmanX(pacmanX),
//		.pacmanY(pacmanY),
		.hsync(hsync),
		.vsync(vsync),
		.R(R),
		.G(G),
		.B(B),
		.nblank(nblank),
		.nsync(nsync),
		.clk_out(clk_out),
		.datoOut(memPacMan_temp));

	always_comb
		if(selectChips == 3'b011) begin
			datoIn = memDat_temp;
			WrDat = memWr;
			WrPacMan = 1;
		end
		else if(selectChips == 3'b101) begin
			datoIn = teclado;
			WrDat = 1;
			WrPacMan = 1;
		end
		else if(selectChips == 3'b110) begin
			datoIn = memPacMan_temp;
			WrDat = 1;
			WrPacMan = memWr;
		end
		else begin
			datoIn = 32'd0;
			WrDat = 1;
			WrPacMan = 1;
		end

endmodule
