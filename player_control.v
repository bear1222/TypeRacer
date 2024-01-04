module player_control (
	input clk, 
	input reset, 
	input en, 
	output reg [11:0] ibeat
    );
	parameter LEN = 4095;
    reg [11:0] next_ibeat;

	always @(posedge clk, posedge reset) begin
		if (reset || en == 0) begin
			ibeat <= 0;
		end else begin
            ibeat <= next_ibeat;
		end
	end

    always @* begin
		if(en)
        	next_ibeat = (ibeat + 1 < LEN) ? (ibeat + 1) : 0;
		else
			next_ibeat = ibeat;
    end

endmodule