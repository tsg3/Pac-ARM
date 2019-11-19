module memoriaInstrucciones_TB;

	logic clk;
	logic [31:0] direc, dato;
	
	memoriaInstrucciones DUT(
		.clk(clk),
		.direc(direc),
		.dato(dato));
		
	initial begin
	
		clk = 1'b0;
		#10 clk = 1'b1;
		#10 clk = 1'b0; direc = 32'd0;
		#10 clk = 1'b1;
		#10 clk = 1'b0; direc = 32'd1;
		#10 clk = 1'b1;
		#10 clk = 1'b0; direc = 32'd2;
		#10 clk = 1'b1;
		#10 clk = 1'b0; direc = 32'd3;
		#10 clk = 1'b1;
		#10 clk = 1'b0; direc = 32'd4;
		#10 clk = 1'b1;
		#10 clk = 1'b0; direc = 32'd5;
		#10 clk = 1'b1;
		#10 clk = 1'b0; direc = 32'd6;
		#10 clk = 1'b1;
		#10 clk = 1'b0; direc = 32'd7;
		#10 clk = 1'b1;
		#10 clk = 1'b0; direc = 32'd8;
		#10 clk = 1'b1;
		#10 clk = 1'b0; direc = 32'd9;
		#10 clk = 1'b1;
		#10 clk = 1'b0; direc = 32'd10;
		#10 clk = 1'b1;
		#10 clk = 1'b0; direc = 32'd11;
		#10 clk = 1'b1;
		#10 clk = 1'b0; direc = 32'd12;
		#10 clk = 1'b1;
		#10 clk = 1'b0; direc = 32'd13;
		#10 clk = 1'b1;
		
	end

endmodule
