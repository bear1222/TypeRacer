module TOP(
	input rst,//sw15
	input clk,
	input start,//BntC
	input select_UP,//BntU
	input select_DOWN,//BntD
	input vol_UP,//BntL
	input vol_DOWN,//BntU
	input mode,//sw0
	inout PS2_DATA,   // Keyboard I/O
    inout PS2_CLK,    // Keyboard I/O
    output wire [15:0] LED,       // LED: [15:9] key & [4:0] volume
    output audio_mclk, // master clock
    output audio_lrck, // left-right clock
    output audio_sck,  // serial clock
    output audio_sdin, // serial audio data input
    output wire [6:0] DISPLAY,    
    output wire [3:0] DIGIT,
	output [3:0] vgaRed,//VGA
    output [3:0] vgaGreen,
    output [3:0] vgaBlue,
    output hsync,
    output vsync
);
	wire [6:0] value;
	wire [1:0] state;
	wire [4:0] vol;
	wire Mode;
	wire [15:0] nums, num1, num2;
	wire [9:0] random_id;
	wire [4:0] cursor;
	wire [74:0] type;
	wire [9:0] wpm;
	wire [9:0] acc;
	wire [4:0] correct;
	wire [47:0] RD;
	wire finish;
	wire [4:0] id;//
	wire [74:0] word;
	wire [14:0] timer;
	wire [9:0] percent;
	
	wire key_valid;
	wire [7:0] last_change;
	wire [127:0] key_down;
	wire start_de, start_1, select_UP_de, select_UP_1, select_DOWN_de, select_DOWN_1;
	wire vol_UP_de, vol_UP_1, vol_DOWN_de, vol_DOWN_1;
	wire [9:0] wpm_average, wpm_best, acc_average, acc_best;

	debounce de_start (.clk(clk), .pb(start), .pb_debounced(start_de));
    one_pulse one_start (.clk(clk), .pb_in(start_de), .pb_out(start_1));
	debounce de_select_UP (.clk(clk), .pb(select_UP), .pb_debounced(select_UP_de));
    one_pulse one_select_UP (.clk(clk), .pb_in(select_UP_de), .pb_out(select_UP_1));
	debounce de_select_DOWN (.clk(clk), .pb(select_DOWN), .pb_debounced(select_DOWN_de));
    one_pulse one_select_DOWN (.clk(clk), .pb_in(select_DOWN_de), .pb_out(select_DOWN_1));
	debounce de_vol_UP (.clk(clk), .pb(vol_UP), .pb_debounced(vol_UP_de));
    one_pulse one_vol_UP (.clk(clk), .pb_in(vol_UP_de), .pb_out(vol_UP_1));
	debounce de_vol_DOW (.clk(clk), .pb(vol_DOWN), .pb_debounced(vol_DOWN_de));
    one_pulse one_vol_DOWN (.clk(clk), .pb_in(vol_DOWN_de), .pb_out(vol_DOWN_1));

	SevenSegment seven(.clk(clk), .rst(rst), .nums(num1), .digit(DIGIT), .display(DISPLAY));
	wire [3:0] a, b, c, d;
	assign a = wpm_average / 1000;
	assign b = wpm_average / 100 % 10;
	assign c = wpm_average / 10 % 10;
	assign d = wpm_average % 10;
//	assign nums = (state == 2) ? num2 : num1;
	assign nums = (state == 2) ? {a, b, c, d} : num1;

	KeyboardDecoder keyde (.clk(clk), .rst(rst), .PS2_CLK(PS2_CLK), .PS2_DATA(PS2_DATA),
	 .key_valid(key_valid),.key_down(key_down),.last_change(last_change));

	control ctrl(
		.clk(clk), 
		.rst(rst), 
		.start(start_1), 
		.select_UP(select_UP_1),
		.select_DOWN(select_DOWN_1),
		.vol_UP(vol_UP_1),
		.vol_DOWN(vol_DOWN_1),
		.mode(mode),
		.finish(finish),
		.Mode(Mode),
		.LED(LED),
		.value(value),
		.state(state),
		.vol(vol),
		.nums(num1)
	);

	count cc(
		.clk(clk), 
		.rst(rst), 
		.mode(Mode),
		.state(state),
		.value(value),
		.key_down(key_down),
		.last_change(last_change),
		.key_valid(key_valid),
		.nums(num2),
		.timer(timer),
		.cursor(cursor),
		.type(type),
		.wpm(wpm),
		.acc(acc),
		.correct(correct),
		.finish(finish),
		.RD(RD),
		.percent(percent)
	);

	record re(
		.clk(clk),
		.rst(rst),
		.mode(Mode),
		.state(state),
		.wpm(wpm),
		.acc(acc),
		.finish(finish), 
		.wpm_best(wpm_best),
		.wpm_average(wpm_average),
		.acc_best(acc_best),
		.acc_average(acc_average)
	);

	/*dictionary dic(
		.id(id),
		.word(word),
		.wordnum(wordnum)
	);*/

	audio au(
		.clk(clk), 
		.rst(rst),
		.vol(vol), 
		.state(state), 

		.audio_mclk(audio_mclk), 
   		.audio_lrck(audio_lrck), // left-right clock
   		.audio_sck(audio_sck),  // serial clock
   		.audio_sdin(audio_sdin)
	);

	vga v(
		.clk(clk), 
		.rst(rst), 
		.percent(percent),
		.wpm(wpm), 
		.acc(acc),
		.tot(cursor), 
		.correct(correct), 
		.times(timer), 
		.type(type), 
		.rd(RD), 
		.mode(Mode),
		.value(value),
		.state(state),
		.wpm_best(wpm_best),
		.wpm_average(wpm_average),
		.acc_best(acc_best),
		.acc_average(acc_average),
		.vgaRed(vgaRed), 
		.vgaGreen(vgaGreen), 
		.vgaBlue(vgaBlue), 
		.hsync(hsync), 
		.vsync(vsync)
	);
endmodule