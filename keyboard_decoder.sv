module keyboard_decoder (input logic ps2_clk, ps2_d, reset,
								 output logic [7:0] word_out,
								 output logic read_done);
	logic [7:0] word;
	
	keyboard_PS2 keyboard_scanner (ps2_clk, ps2_d, reset, word, read_done);
	
	always_comb begin
		if (word == 8'hF0 && !read_done)
			word_out = 8'h00;
		else if (!read_done)
			word_out = word;
		else
			word_out = 8'h00;
	end
endmodule
