module vga_controller(input logic clock_in,
							 input logic rst,
							 input logic memWr,
							 input logic [31:0] address,
							 input logic [31:0] datoIn,
							 input logic [7:0] letra,
//							 input logic [31:0] pacman [0:1],
//							 input logic [31:0] pacmanX,
//							 input logic [31:0] pacmanY,
							 output logic hsync,
							 output logic vsync,
							 output logic [7:0] R,
							 output logic [7:0] G,
							 output logic [7:0] B,
							 output logic nblank,
							 output logic nsync,
							 output logic clk_out,
							 output logic [31:0] datoOut);
							 
	logic [31:0] pacmanX = 32'b0;
	logic [31:0] pacmanY = 32'b0;
							 
	assign nblank = 1;
	assign nsync = 0;
	logic enable;

	logic clock_out;
	logic [9:0] countH;
	logic [9:0] countV;
	logic new_line;
	logic [9:0] posx;
	logic [9:0] posy;

	assign clk_out = clock_out;
	
	clock_divider clk_pixel (
		.clock_in(clock_in), 
		.clock_out(clock_out));
		
	horizontal_counter h_counter (
		.clk(clock_out),
		.rst(rst),
		.new_line(new_line),
		.count(countH));
	
	vertical_counter v_counter (
		.clk(clock_out), 
		.rst(rst),
		.new_line(new_line),
		.count(countV));
		
	horizontal_syncronization h_syncronization (
		.clk(clock_out),
		.rst(rst),
		.hcount(countH),
		.hsync(hsync));
		
	vertical_syncronization v_syncronization (
		.clk(clock_out),
		.rst(rst),	
		.vcount(countV),
		.vsync(vsync));
	
	display_syncronization disp_syncronization (
		.clk(clock_out), 
		.rst(rst),
		.hcount(countH),
		.vcount(countV),
		.posx(posx),
		.posy(posy));
		
	display_visible enable_logic (
		.clk(clock_out), 
		.rst(rst),
		.hcount(countH),
		.vcount(countV),
		.enable(enable));
		
//	logic [31:0] xx, yy;
//	
//	assign xx = ^pacman[0] === 1'bX ? 32'd0 : pacman[0];
//	assign yy = ^pacman[1] === 1'bX ? 32'd0 : pacman[1];

	always_ff @(negedge clock_in)
		if(~memWr)
			if(address == 32'b0)
				pacmanX <= datoIn;
			else
				pacmanY <= datoIn;
	
	logic [9:0] pacmanX90, pacmanY90;
	assign pacmanX90 = pacmanX[9:0];
	assign pacmanY90 = pacmanY[9:0];
//	
//	logic [9:0] pacmanX32, pacmanY32;
//	assign pacmanX32 = pacmanX90 + 10'd32;
//	assign pacmanY32 = pacmanY90 + 10'd32;
//	
//	logic valid_sprite = 1'b0;
//	assign valid_sprite = (posx >= pacmanX90) && (posx < pacmanX32) && 
//			(posy >= pacmanY90) && (posy < pacmanY32);
			
	logic visible_sprite;
	logic [23:0] RGB_sprite;
	
	spritePacman sprite(
		.clk(clock_in),
		.posx(posx),
		.posy(posy), 
		.pixelx(pacmanX90), 
		.pixely(pacmanY90),
		.letra(letra),
		.RGB(RGB_sprite),
		.visible(visible_sprite));
//	
//	logic [9:0] t, p;
//	assign t = 10'd550;
//	assign p = 10'd600;
		
	always_comb begin
		if(address == 32'b0)
			datoOut <= pacmanX;
		else
			datoOut <= pacmanY;
			
//		if(valid_sprite) begin
//			R = 8'hff;
//			G = 8'hea;
//			B = 8'h00;
//		end
			
		if(visible_sprite) begin
			R = RGB_sprite[23:16];
			G = RGB_sprite[15:8];
			B = RGB_sprite[7:0];
		end	
		else if (enable) begin
			R = 8'h30;
			G = 8'h28;
			B = 8'h27;
		end
		else begin
			R = 8'h00;
			G = 8'h00;
			B = 8'h00;
		end
	end

endmodule
