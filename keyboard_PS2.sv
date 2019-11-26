module keyboard_PS2(input logic ps2_c, ps2_d, reset,
						  output logic [7:0] dout,
						  output logic read_done);
	
	logic [3:0] counter = 4'b0000;
	logic [10:0] buffer;
	assign dout = buffer[8:1];
	
	always_ff @(negedge ps2_c) begin
		if (!reset) begin
			
		end
		else begin			
			if (counter == 4'd0) begin
					counter <= counter + 4'b0001;
					buffer[0] <= ps2_d;
					read_done <= 1;	
			end
			else if(counter == 4'd1) begin 
					counter <= counter + 4'b0001;
					buffer[1] <= ps2_d;
					read_done <= 1;
			end
			else if (counter == 4'd2) begin 
					counter <= counter + 4'b0001;
					buffer[2] <= ps2_d;
					read_done <= 1;
			end
			else if (counter == 4'd3) begin 
					counter <= counter + 4'b0001;
					buffer[3] <= ps2_d;
					read_done <= 1;
			end
			else if (counter == 4'd4) begin
					counter <= counter + 4'b0001;
					buffer[4] <= ps2_d;
					read_done <= 1;
			end
			else if (counter == 4'd5) begin
					counter <= counter + 4'b0001;
					buffer[5] <= ps2_d;
					read_done <= 1;	
			end
			else if (counter == 4'd6) begin
					counter <= counter + 4'b0001;
					buffer[6] <= ps2_d;
					read_done <= 1;
			end
			else if (counter == 4'd7) begin
					counter <= counter + 4'b0001;
					buffer[7] <= ps2_d;
					read_done <= 1;
			end
			else if (counter == 4'd8) begin
					counter <= counter + 4'b0001;
					buffer[8] <= ps2_d;
					read_done <= 1;
			end
			else if (counter == 4'd9) begin
					counter <= counter + 4'b0001;
					buffer[9] <= ps2_d;
					read_done <= 1;
			end
			else if (counter == 4'd10) begin
					counter <= 4'b0000;
					buffer[10] <= ps2_d;
					read_done <= 0;
			end
			else begin
					counter <= 4'b0000;
					buffer <= 11'b00000000000;
					read_done <= 1;
			end
		end
	end
endmodule
