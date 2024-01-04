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
	output reg Mode,
	output reg [15:0] LED,
	output reg [4:0] vol,
	output wire [6:0] value,
	output reg [1:0] state,
	output reg [15:0] nums
);	
	reg [4:0] cnt, next_cnt;
	reg [6:0] Num, Time, next_Num, next_Time;
	reg [1:0] next_state;
	reg next_Mode;
	reg [4:0] next_vol;
	reg [4:0] volume, next_volume;
	reg [15:0] next_led;
	wire clk_div;
	parameter SELECT = 0;
	parameter COUNTDOWN = 1;
	parameter INGAME = 2;
	parameter FINISH = 3;

	loHz_counter ct (.clk(clk), .clk_div(clk_div));

	always @(posedge clk, posedge rst) begin
		if (rst) begin
    		volume <= 3;
    	end else begin
			volume <= next_volume;
    	end
	end

	always@(*)begin
		if(vol_UP)begin
			next_volume = (volume == 5) ? 5 : volume + 1;
		end else if(vol_DOWN) begin
			next_volume = (volume == 0) ? 0 : volume - 1;
		end
	end

	always @(posedge clk, posedge rst) begin
		if (rst) begin
    		vol <= 7;
    	end else begin
			vol <= next_vol;
    	end
	end

	always@(*)begin
		case(volume)
			0:next_vol = 0;
			1:next_vol = 1;
			2:next_vol = 3;
			3:next_vol = 7;
			4:next_vol = 15;
			5:next_vol = 31;
			default:next_vol = vol;
		endcase
	end

	always @(posedge clk, posedge rst) begin
		if (rst) begin
    		LED <= 7;
    	end else begin
			LED <= next_led;
    	end
	end

	always @(*) begin
		next_led = LED;
		case(volume)
			0: next_led[4:0] = 0;
			1: next_led[4:0] = 16;
			2: next_led[4:0] = 24;
			3: next_led[4:0] = 28;
			4: next_led[4:0] = 30;
			5: next_led[4:0] = 31;
			default : next_led[4:0] = LED[4:0];
		endcase
		next_led[6:5] = 0;
		if(state == SELECT)begin
			next_led[15:7] = 9'b000000000;
		end else if(state == COUNTDOWN)begin
			if(cnt > 20)
				next_led[15:7] = 9'b111111111;
			else if(cnt > 10)
				next_led[15:7] = 9'b111111000;
			else
				next_led[15:7] = 9'b111000000;
		end else if(state == INGAME)begin
			next_led[15:7] = 9'b000000000;
		end else if(state == FINISH)begin
			next_led[15:7] = 9'b111111111;
		end else begin
			next_led[15:7] = LED[15:7];
		end
	end

	always @ (posedge clk_div, posedge rst) begin
    	if (rst) begin
    		cnt <= 30;
    	end else begin
			cnt <= next_cnt;
    	end
    end

	always @(*) begin
		if(state == COUNTDOWN)begin
			next_cnt = (cnt) ? cnt - 1 : 0;
		end else if(state == SELECT)begin
			next_cnt = 30;
		end else begin
			next_cnt = cnt;
		end
	end

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
				if(start) next_state = COUNTDOWN;
				else next_state = SELECT;
			end 
			COUNTDOWN: begin
				if(cnt == 0) next_state = INGAME;
				else next_state = COUNTDOWN;
			end
			INGAME: begin
				if(finish) next_state = FINISH;
				else next_state = INGAME;
			end 
			FINISH: begin
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
					next_Num = (Num == 100) ? 25 : (Num + 25);
				end else if(select_DOWN)begin
					next_Num = (Num == 25) ? 100 : (Num - 25);
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
					next_Time = (Time == 90) ? 15 : (Time + 15);
				end else if(select_DOWN)begin
					next_Time = (Time == 15) ? 90 : (Time - 15);
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

	always @(*) begin
		if(state == SELECT)begin
			if(!Mode)begin
				nums[3:0] = Time % 10;
				nums[7:4] = (Time / 10) % 10; 
				nums[11:8] = 0;
				nums[15:12] = 10;//
			end else begin
				nums[3:0] = Num % 10;
				nums[7:4] = (Num / 10) % 10; 
				nums[11:8] = Num / 100;
				nums[15:12] = 11;//
			end
		end else if(state == INGAME)begin
			if(!Mode)begin
				nums[3:0] = Time % 10;
				nums[7:4] = (Time / 10) % 10; 
				nums[11:8] = 0;
				nums[15:12] = 0;//
			end else begin
				nums[3:0] = Num % 10;
				nums[7:4] = (Num / 10) % 10; 
				nums[11:8] = Num / 100;
				nums[15:12] = 0;//
			end
		end else begin
			nums[3:0] = 12;
			nums[7:4] = 12; 
			nums[11:8] = 12;
			nums[15:12] = 12;//
		end
	end
    /*always @ (posedge clk, posedge rst) begin
    	if (rst) begin
    		
    	end else begin
    		
    	end
    end*/

endmodule