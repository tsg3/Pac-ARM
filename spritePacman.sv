module spritePacman(input logic clk,
						  input [9:0] posx,
						  input [9:0] posy, 
						  input [9:0] pixelx, 
						  input [9:0] pixely,
						  input [7:0] letra,
						  output [23:0] RGB,
						  output visible);

	logic colorW, colorS, colorA, colorD;
	logic [9:0] address;
	
	pacman_w pacmanArriba (
		.address(address),
		.clock(clk),
		.q(colorW));
		
	pacman_s pacmanAbajo (
		.address(address),
		.clock(clk),
		.q(colorS));
		
	pacman_a pacmanIzquierda (
		.address(address),
		.clock(clk),
		.q(colorA));
		
	pacman_d pacmanDerecha (
		.address(address),
		.clock(clk),
		.q(colorD));
		
	logic color = 1'b0;
	
	assign RGB = color == 1'b1 ? 24'hffea00 : 24'h302827;
	
	logic xm31, ym31;
	
	logic [9:0] idx, idy;
	logic [9:0]	maxPixel = 10'd31;
	
	assign idx = posx - pixelx;
	assign idy = posy - pixely;
	assign address = {idy[4:0], idx[4:0]};
	assign xm31 = posx > maxPixel;
	assign ym31 = posy > maxPixel;
	
	logic background = 1'b0;
	assign visible = ~background && ~(xm31 | ym31);
	
	always_ff @(posedge clk)
		if(letra == 8'h1d)
			color <= colorW;
		else if(letra == 8'h1b)
			color <= colorS;
		else if(letra == 8'h1c)
			color <= colorA;
		else if(letra == 8'h23)
			color <= colorD;
		else
			color <= color;
endmodule
