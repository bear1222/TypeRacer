module count(
	input rst,
	input clk,
	input mode,
	input [1:0] state,
	input [6:0] value,
	input [127:0] key_down,
	input [8:0] last_change,
	input key_valid,
	output reg [124:0] type,
	output reg [7:0] wpm,
	output reg [6:0] acc,
	output reg [24:0] correct,
	output finish,
	output [59:0] RD
);	
	reg [4:0] id;
	wire [74:0] word;

	dictionary dic(
		.id(id),
		.word(word)
	);

    always @ (posedge clk, posedge rst) begin
    	if (rst) begin
    		
    	end else begin
			
    	end
    end
    
    always @ (posedge clk, posedge rst) begin
    	if (rst) begin
    		
    	end else begin
    		
    	end
    end

endmodule