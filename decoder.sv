module decoder #(parameter size = 32) (input logic [31:0] direc,
													output logic [1:0] selectChips);

		always_comb
			if(direc >= 32'd0 && direc < size)
				selectChips = 2'b01;
			else if(direc == size)
				selectChips = 2'b10;
			else
				selectChips = 2'b11;
				
endmodule
