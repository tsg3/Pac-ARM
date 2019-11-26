module decoder #(parameter size = 32) (input logic [31:0] direc,
													output logic [2:0] selectChips);

		always_comb
			if(direc >= 32'd0 && direc < size)
				selectChips = 3'b011;
			else if(direc == size)
				selectChips = 3'b101;
			else if(direc < size + 3)
				selectChips = 3'b110;
			else
				selectChips = 3'b111;
				
endmodule
