module test ();

	logic [7:0] word;
	logic read;
	logic clk;
	logic data;
	logic reset;
	
	keyboard_decoder kb (clk, data, reset, word, read);
	
	initial begin
		reset = 0;
		
		//Escribe A
		#5 clk = 1; data = 0;
		#5 clk = 0;
		#5 clk = 1; data = 0;
		#5 clk = 0; 
		#5 clk = 1; data = 0;
		#5 clk = 0;	
		#5 clk = 1; data = 0;
		#5 clk = 0;
		#5 clk = 1; data = 1;
		#5 clk = 0;
		#5 clk = 1; data = 1;
		#5 clk = 0; 	
		#5 clk = 1; data = 1;
		#5 clk = 0;	
		#5 clk = 1; data = 0;
		#5 clk = 0;
		#5 clk = 1; data = 0;
		#5 clk = 0;
		#5 clk = 1; data = 1;
		#5 clk = 0;
		#5 clk = 1; data = 1;	
		#5 clk = 0;
		
		// Escribe F0
		#5 clk = 1; data = 0;
		#5 clk = 0;
		#5 clk = 1; data = 1;
		#5 clk = 0; 
		#5 clk = 1; data = 1;
		#5 clk = 0;	
		#5 clk = 1; data = 1;
		#5 clk = 0;
		#5 clk = 1; data = 1;
		#5 clk = 0;
		#5 clk = 1; data = 0;
		#5 clk = 0; 	
		#5 clk = 1; data = 0;
		#5 clk = 0;	
		#5 clk = 1; data = 0;
		#5 clk = 0;
		#5 clk = 1; data = 0;
		#5 clk = 0;
		#5 clk = 1; data = 0;
		#5 clk = 0;
		#5 clk = 1; data = 1;	
		#5 clk = 0;
		
		//Escribe S
		#5 clk = 1; data = 0;
		#5 clk = 0;
		#5 clk = 1; data = 0;
		#5 clk = 0; 
		#5 clk = 1; data = 0;
		#5 clk = 0;	
		#5 clk = 1; data = 0;
		#5 clk = 0;
		#5 clk = 1; data = 1;
		#5 clk = 0;
		#5 clk = 1; data = 1;
		#5 clk = 0; 	
		#5 clk = 1; data = 0;
		#5 clk = 0;	
		#5 clk = 1; data = 1;
		#5 clk = 0;
		#5 clk = 1; data = 1;
		#5 clk = 0;
		#5 clk = 1; data = 1;
		#5 clk = 0;
		#5 clk = 1; data = 1;	
		#5 clk = 0;
		
		//Escribe D
		#5 clk = 1; data = 0;
		#5 clk = 0;
		#5 clk = 1; data = 0;
		#5 clk = 0; 
		#5 clk = 1; data = 0;
		#5 clk = 0;	
		#5 clk = 1; data = 1;
		#5 clk = 0;
		#5 clk = 1; data = 0;
		#5 clk = 0;
		#5 clk = 1; data = 0;
		#5 clk = 0; 	
		#5 clk = 1; data = 0;
		#5 clk = 0;	
		#5 clk = 1; data = 1;
		#5 clk = 0;
		#5 clk = 1; data = 1;
		#5 clk = 0;
		#5 clk = 1; data = 1;
		#5 clk = 0;
		#5 clk = 1; data = 1;	
		#5 clk = 0;
		
		//Escribe W
		#5 clk = 1; data = 0;
		#5 clk = 0;
		#5 clk = 1; data = 0;
		#5 clk = 0; 
		#5 clk = 1; data = 0;
		#5 clk = 0;	
		#5 clk = 1; data = 0;
		#5 clk = 0;
		#5 clk = 1; data = 1;
		#5 clk = 0;
		#5 clk = 1; data = 1;
		#5 clk = 0; 	
		#5 clk = 1; data = 1;
		#5 clk = 0;	
		#5 clk = 1; data = 0;
		#5 clk = 0;
		#5 clk = 1; data = 1;
		#5 clk = 0;
		#5 clk = 1; data = 1;
		#5 clk = 0;
		#5 clk = 1; data = 1;	
		#5 clk = 0;
	end
	
endmodule
