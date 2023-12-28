module count(
	input rst,
	input clk,
	input mode,
	input [1:0] state,
	input [6:0] value,
	input [127:0] key_down,
	input [8:0] last_change,
	input key_valid,
	input [9:0] random_id,
	output reg [15:0] nums,
	output reg [4:0] cursor,
	output reg [124:0] type,
	output reg [7:0] wpm,
	output reg [6:0] acc,
	output reg [4:0] correct,
	output reg finish,
	output reg [59:0] RD
	
);	
	parameter SELECT = 0;
	parameter COUNTDOWN = 1;
	parameter INGAME = 2;
	parameter FINISH = 3;


	parameter [6:0] KEY [0:26] = {
		7'd0,
		7'd28,7'd50,7'd33,7'd35,7'd36,7'd43,7'd52,
		7'd51,7'd67,7'd59,7'd66,7'd75,7'd58,7'd49,
		7'd68,7'd77,7'd21,7'd45,7'd27,7'd44,7'd60,
		7'd42,7'd29,7'd34,7'd53,7'd26
	};

	parameter BACK = 7'd102;
	parameter SPACE = 7'd41;

	reg [6:0] id;
	wire [74:0] word;
	wire [4:0] wordnum;
	
	dictionary dic(
		.id(id),
		.word(word),
		.wordnum(wordnum)
	);
	
	reg next_finish;
	reg [59:0] next_RD;
	reg [2:0] RD_poniter, next_RD_pointer;
	reg [14:0] timer, next_timer;//max = 2047
	reg [14:0] cnt, next_cnt;
	reg [6:0] num, next_num;
	reg [4:0] typecount;
	reg [124:0] next_type;
	reg [4:0] next_cursor;
	reg [4:0] next_correct;
	reg [4:0] key_num;
	wire clk_div;

	looHz_counter ct (.clk(clk), .clk_div(clk_div));

	/*time*/always @ (posedge clk_div, posedge rst) begin
    	if (rst) begin
    		timer <= 0;
    	end else begin
			timer <= next_timer;
    	end
    end

	always @(*) begin
		if(state == INGAME)begin
			next_timer = (timer < 18000) ? timer + 1 : 18000;
		end else if(state == SELECT)begin
			next_timer = 0;
		end else begin
			next_timer = timer;
		end
	end

    /*time*/always @ (posedge clk_div, posedge rst) begin
    	if (rst) begin
    		cnt <= 1500;
    	end else begin
			cnt <= next_cnt;
    	end
    end

	always @(*) begin
		if(state == INGAME && mode == 0)begin
			next_cnt = (cnt) ? cnt - 1 : 0;
		end else if(state == SELECT && mode == 0)begin
			next_cnt = value * 100;
		end else begin
			next_cnt = cnt;
		end
	end

	/*num*/always @ (posedge clk, posedge rst) begin
    	if (rst) begin
    		num <= 0;
    	end else begin
			num <= next_num;
    	end
    end

	always @(*) begin
		if(state == INGAME && mode == 1)begin
			if(cursor && key_num == 28 && key_valid && key_down[last_change] == 1'b1 && !delay && !(key_down & (~(1 << last_change))))begin//space down ?
				next_num = num + 1;
			end else if(state == SELECT)begin
				next_num = 0;
			end
		end else begin
			next_num = 0;
		end
	end
    
    /*finish*/always @ (posedge clk, posedge rst) begin
    	if (rst) begin
    		finish <= 0;
    	end else begin
    		finish <= next_finish;
    	end
    end

	always @(*) begin
		if(state == INGAME)begin
			if(timer == 18000)
				next_finish = 1;
			else if(mode && num == value)//num
				next_finish = 1;
			else if(!mode && cnt == 0)//time
				next_finish = 1;
			else 
				next_finish = 0;
		end else begin
			next_finish = 0;
		end
	end

	/*RD*/always @ (posedge clk, posedge rst) begin
    	if (rst) begin
			RD <= 0;
    	end else begin
			RD <= next_RD;
    	end
    end

	always @(*) begin
		if(state == INGAME )begin
			if(cursor && key_num == 28 && key_valid && key_down[last_change] == 1'b1 && !delay && !(key_down & (~(1 << last_change))))begin // space down ?
				next_RD = RD;
				case (RD_poniter)
					0:next_RD[59 : 50] = random_id;
					1:next_RD[9 : 0] = random_id;
					2:next_RD[19 : 10] = random_id;
					3:next_RD[29 : 20] = random_id;
					4:next_RD[39 : 30] = random_id;
					5:next_RD[49 : 40] = random_id;
					default: next_RD = RD;
				endcase
			end else begin
				next_RD = RD;
			end
		end else begin
			next_RD = 0;
		end
	end

	/*RD_pointer*/always @ (posedge clk, posedge rst) begin
    	if (rst) begin
			RD_poniter <= 0;
    	end else begin
			RD_poniter <= next_RD_pointer;
    	end
    end

	always @(*) begin
		if(state == INGAME)begin
			if(cursor && key_num == 28 && key_valid && key_down[last_change] == 1'b1 && !delay && !(key_down & (~(1 << last_change))))begin // space down ?
				next_RD_pointer = (RD_poniter < 5) ? RD_poniter + 1 : 0;
			end else begin
				next_RD_pointer = RD_poniter;
			end
		end else begin
			next_RD_pointer = 0;
		end
	end

	/*ID*/always @ (posedge clk, posedge rst) begin
    	if (rst) begin
			id <= 0;
    	end else begin
			if(state == INGAME)begin
				case (RD_poniter)
					0:id <= RD[9 : 0];
					1:id <= RD[19 : 10];
					2:id <= RD[29 : 20];
					3:id <= RD[39 : 30];
					4:id <= RD[49 : 40];
					5:id <= RD[59 : 50];
					default: id <= RD[9 : 0];
				endcase
			end else begin
				id <= RD[9 : 0];
			end
    	end
    end

	reg delay;
	always @(posedge clk) begin
		delay <= key_down[last_change];
	end

	/*type*/always @ (posedge clk, posedge rst) begin
    	if (rst) begin
			type <= 0;
    	end else begin
			type <= next_type;
    	end
    end

	always @(*) begin
		if(state == INGAME)begin 
			if(key_num == 28 && key_valid && key_down[last_change] == 1'b1 && !delay && !(key_down & (~(1 << last_change))))begin//space 
				if(cursor)begin
					next_type = 0;
				end else begin
					next_type = type;
				end
			end else if(key_num == 27 && key_valid && key_down[last_change] == 1'b1 && !(key_down & (~(1 << last_change))))begin//back
				next_type = type;
				if(cursor)begin
					next_type[cursor * 5 - 5] = 0;
					next_type[cursor * 5 + 1 - 5] = 0;
					next_type[cursor * 5 + 2 - 5] = 0;
					next_type[cursor * 5 + 3 - 5] = 0;
					next_type[cursor * 5 + 4 - 5] = 0;
				end
			end else if(key_num < 27 && key_valid && key_down[last_change] == 1'b1 && !delay && !(key_down & (~(1 << last_change))))begin
				next_type = type;
				if(cursor < 25)begin
					next_type[cursor * 5] = key_num[0];
					next_type[cursor * 5 + 1] = key_num[1];
					next_type[cursor * 5 + 2] = key_num[2];
					next_type[cursor * 5 + 3] = key_num[3];
					next_type[cursor * 5 + 4] = key_num[4];
				end
			end
		end else begin
			next_type = 0;
		end
	end

	/*cursor*/always @ (posedge clk, posedge rst) begin
    	if (rst) begin
			cursor <= 0;
    	end else begin
			cursor <= next_cursor;
    	end
    end

	always @(*) begin
		if(state == INGAME)begin 
			if(key_num == 28 && key_valid && key_down[last_change] == 1'b1 && !delay && !(key_down & (~(1 << last_change))))begin//space 
				next_cursor = 0;
			end else if(key_num == 27 && key_valid && key_down[last_change] == 1'b1 && !(key_down & (~(1 << last_change))))begin//back
				if(cursor)begin
					next_cursor = cursor - 1;
				end else begin
					next_cursor = cursor;
				end
			end else if(key_num < 27 && key_valid && key_down[last_change] == 1'b1 && !delay && !(key_down & (~(1 << last_change))))begin
				if(cursor < 25)begin
					next_cursor = cursor + 1;
				end else begin
					next_cursor = cursor;
				end
			end
		end else begin
			next_cursor = 0;
		end
	end

	reg [4:0] i;
	/*correct*/always @ (posedge clk, posedge rst) begin
    	if (rst) begin
			correct <= 0;
    	end else begin
			correct <= next_correct;
    	end
    end

	always @(*) begin
		if(state == INGAME)begin 
			if(cursor)begin
				next_correct = 0;
				for(i = 0; i < cursor; i = i + 1)begin
					if(
						type[i * 5 - 5] == word[i * 5 - 5] && 
						type[i * 5 - 5 + 1] == word[i * 5 - 5 + 1] &&
						type[i * 5 - 5 + 2] == word[i * 5 - 5 + 2] && 
						type[i * 5 - 5 + 3] == word[i * 5 - 5 + 3] && 
						type[i * 5 - 5 + 4] == word[i * 5 - 5 + 4]  
					)begin
						next_correct = next_correct + 1;
					end else begin
						next_correct = next_correct;
					end
				end
			end else begin
				next_correct = correct;
			end
		end else begin
			next_correct = 0;
		end
	end

	/*key_num*/always @ (*) begin
		case (last_change)
			KEY[1] : key_num = 1;
			KEY[2] : key_num = 2;
			KEY[3] : key_num = 3;
			KEY[4] : key_num = 4;
			KEY[5] : key_num = 5;
			KEY[6] : key_num = 6;
			KEY[7] : key_num = 7;
			KEY[8] : key_num = 8;
			KEY[9] : key_num = 9;
			KEY[10] : key_num = 10;
			KEY[11] : key_num = 11;
			KEY[12] : key_num = 12;
			KEY[13] : key_num = 13;
			KEY[14] : key_num = 14;
			KEY[15] : key_num = 15;
			KEY[16] : key_num = 16;
			KEY[17] : key_num = 17;
			KEY[18] : key_num = 18;
			KEY[19] : key_num = 19;
			KEY[20] : key_num = 20;
			KEY[21] : key_num = 21;
			KEY[22] : key_num = 22;
			KEY[23] : key_num = 23;
			KEY[24] : key_num = 24;
			KEY[25] : key_num = 25;
			KEY[26] : key_num = 26;
			BACK  : key_num = 27;
			SPACE : key_num = 28;
			default	: key_num = 29;
		endcase
	end

	/*always @(*) begin
		if(mode)begin
			nums[3:0] = (timer / 100) % 10;
			nums[7:4] = (timer / 1000) % 10; 
			nums[11:8] = timer / 10000;
			nums[15:12] = 0;//
		end else begin 
			nums[3:0] = (cnt / 100) % 10;
			nums[7:4] = (cnt / 1000) % 10; 
			nums[11:8] = 0;
			nums[15:12] = 0;//
		end	
	end*/

	always @(*) begin
		nums[3:0] = cursor % 10;
		nums[7:4] = cursor / 10; 
		nums[11:8] = num % 10;
		nums[15:12] = num / 10;
	end

endmodule