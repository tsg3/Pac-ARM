module bancoRegistros (input logic clk,
							 input logic regWr,
							 input logic [3:0] addA,
							 input logic [3:0] addB,
							 input logic [3:0] addWr,
							 input logic [31:0] diWr,
							 input logic [31:0] pcWr,
							 output logic [31:0] doA,
							 output logic [31:0] doB);
							 
	logic [511:0] memoriaRegistros = 512'd0;
	
	always_ff @(negedge clk) begin
		memoriaRegistros[31:0] <= pcWr;
		if(~regWr) begin
			case(addWr)
				4'd0: memoriaRegistros[511:480] <= diWr;
				4'd1: memoriaRegistros[479:448] <= diWr;
				4'd2: memoriaRegistros[447:416] <= diWr;
				4'd3: memoriaRegistros[415:384] <= diWr;
				4'd4: memoriaRegistros[383:352] <= diWr;
				4'd5: memoriaRegistros[351:320] <= diWr;
				4'd6: memoriaRegistros[319:288] <= diWr;
				4'd7: memoriaRegistros[287:256] <= diWr;
				4'd8: memoriaRegistros[255:224] <= diWr;
				4'd9: memoriaRegistros[223:192] <= diWr;
				4'd10: memoriaRegistros[191:160] <= diWr;
				4'd11: memoriaRegistros[159:128] <= diWr;
				4'd12: memoriaRegistros[127:96] <= diWr;
				4'd13: memoriaRegistros[95:64] <= diWr;
				4'd14: memoriaRegistros[63:32] <= diWr;
				4'd15: memoriaRegistros[31:0] <= diWr;
				default: memoriaRegistros <= memoriaRegistros;
			endcase
		end
	end
	
	always_comb begin
		case(addA)
			4'd0: doA = memoriaRegistros[511:480];
			4'd1: doA = memoriaRegistros[479:448];
			4'd2: doA = memoriaRegistros[447:416];
			4'd3: doA = memoriaRegistros[415:384];
			4'd4: doA = memoriaRegistros[383:352];
			4'd5: doA = memoriaRegistros[351:320];
			4'd6: doA = memoriaRegistros[319:288];
			4'd7: doA = memoriaRegistros[287:256];
			4'd8: doA = memoriaRegistros[255:224];
			4'd9: doA = memoriaRegistros[223:192];
			4'd10: doA = memoriaRegistros[191:160];
			4'd11: doA = memoriaRegistros[159:128];
			4'd12: doA = memoriaRegistros[127:96];
			4'd13: doA = memoriaRegistros[95:64];
			4'd14: doA = memoriaRegistros[63:32];
			4'd15: doA = memoriaRegistros[31:0];
			default: doA = memoriaRegistros[511:480];
		endcase
		
		case(addB)
			4'd0: doB = memoriaRegistros[511:480];
			4'd1: doB = memoriaRegistros[479:448];
			4'd2: doB = memoriaRegistros[447:416];
			4'd3: doB = memoriaRegistros[415:384];
			4'd4: doB = memoriaRegistros[383:352];
			4'd5: doB = memoriaRegistros[351:320];
			4'd6: doB = memoriaRegistros[319:288];
			4'd7: doB = memoriaRegistros[287:256];
			4'd8: doB = memoriaRegistros[255:224];
			4'd9: doB = memoriaRegistros[223:192];
			4'd10: doB = memoriaRegistros[191:160];
			4'd11: doB = memoriaRegistros[159:128];
			4'd12: doB = memoriaRegistros[127:96];
			4'd13: doB = memoriaRegistros[95:64];
			4'd14: doB = memoriaRegistros[63:32];
			4'd15: doB = memoriaRegistros[31:0];
			default: doB = memoriaRegistros[511:480];
		endcase
	end
							 
endmodule
