module control(
	input rst,
	input clk,
	input start,//BntC
	input select_UP,//BntU
	input select_DOWN,//BntD
	input vol_UP,//BntL
	input vol_DOWN,//BntU
	input mode,//sw0
	input finish,
	output [4:0] vol,
	output wire [6:0] value,
	output reg [1:0] state,
	output reg [15:0] nums
);
	reg [6:0] Num, Time, next_Num, next_Time;
	reg [1:0] next_state;
	reg Mode, next_Mode;
	parameter SELECT = 0;
	parameter INGAME = 1;
	parameter FINISH = 2;

	always @ (posedge clk, posedge rst) begin
    	if (rst) begin
    		state <= SELECT;
    	end else begin
			state <= next_state;
    	end
    end
    
	always @(*) begin
		case (state)
			SELECT: begin
				if(start) next_state = INGAME;
				else next_state = SELECT;
			end 
			INGAME: begin
				if(finish) next_state = FINISH;
				else next_state = INGAME;
			end 
			SELECT: begin
				if(start) next_state = SELECT;
				else next_state = FINISH;
			end 
			default: next_state = state;
		endcase
	end
	
	always @ (posedge clk, posedge rst) begin
    	if (rst) begin
    		Mode <= 0;
    	end else begin
			Mode <= next_Mode;
    	end
    end

	always @(*) begin
		if(state == SELECT)begin
			next_Mode = mode; 
		end else begin
			next_Mode = Mode;
		end
	end
	
	assign value = Mode ? Num : Time;

    always @ (posedge clk, posedge rst) begin
    	if (rst) begin
    		Num <= 25;
    	end else begin
			Num <= next_Num;
    	end
    end
    
	always @(*) begin
		if(state == SELECT)begin
			if(mode)begin
				if(select_UP)begin
					next_Num = (Num == 100) ? (Num + 25) : 25;
				end else if(select_DOWN)begin
					next_Num = (Num == 25) ? (Num - 25) : 100;
				end else begin
					next_Num = Num;
				end
			end else begin
				next_Num = Num;
			end
		end else begin
			next_Num = Num;
		end
	end

	always @ (posedge clk, posedge rst) begin
    	if (rst) begin
    		Time <= 15;
    	end else begin
			Time <= next_Time;
    	end
    end
    
	always @(*) begin
		if(state == SELECT)begin
			if(!mode)begin
				if(select_UP)begin
					next_Time = (Time == 90) ? (Time + 15) : 15;
				end else if(select_DOWN)begin
					next_Time = (Time == 15) ? (Time - 15) : 90;
				end else begin
					next_Time = Time;
				end
			end else begin
				next_Time = Time;
			end
		end else begin
			next_Time = Time;
		end
	end

    always @ (posedge clk, posedge rst) begin
    	if (rst) begin
    		
    	end else begin
    		
    	end
    end

endmodule