module clock_divider #(
    parameter n = 27
)(
    input wire  clk,
    output wire clk_div  
);

    reg [n-1:0] num;
    wire [n-1:0] next_num;

    always @(posedge clk) begin
        num <= next_num;
    end

    assign next_num = num + 1;
    assign clk_div = num[n-1];
endmodule

module vga(
    input clk, 
    input rst, 
    input [9:0] percent, // game
    input [9:0] wpm, 
    input [9:0] acc, 
    input [4:0] correct, tot,
    input [14:0] times, 
    input [74:0] type, 
    input [47:0] rd,   
    input [1:0] state, // select
    input mode, // menu
    input [6:0] value, 
    input [9:0] wpm_best,
    input [9:0] wpm_average,
    input [9:0] acc_best,
    input [9:0] acc_average, 
    output [3:0] vgaRed,
    output [3:0] vgaGreen,
    output [3:0] vgaBlue,
    output hsync,
    output vsync
);
	parameter SELECT = 0;
	parameter COUNTDOWN = 1;
	parameter INGAME = 2;
	parameter FINISH = 3;

    wire clk_25MHz, valid;
    wire [9:0] vgax, vgay;

    clock_divider #(2) cd(
        .clk(clk), 
        .clk_div(clk_25MHz)
    );
    
    vga_controller vga_inst(
        .pclk(clk_25MHz),
        .reset(rst),
        .hsync(hsync),
        .vsync(vsync),
        .valid(valid),
        .h_cnt(vgay),
        .v_cnt(vgax)
    );

    wire [11:0] pixel_game, pixel_menu, pixel;
    game_screen gc(
		.clk(clk), 
		.rst(rst), 
		.percent(percent),
		.wpm(wpm), 
		.acc(acc),
		.tot(tot), 
		.correct(correct), 
		.times(times), 
		.type(type), 
		.rd(rd), 
        .valid(valid), 
        .vgax(vgax), 
        .vgay(vgay), 
        .pixel(pixel_game)
    );

    menu_screen mc(
        .clk(clk), 
        .rst(rst), 
        .vgax(vgax), 
        .vgay(vgay), 
        .valid(valid), 
        .mode(mode), 
        .value(value), 
        .wpm_best(wpm_best),
        .wpm_average(wpm_average),
        .acc_best(acc_best),
        .acc_average(acc_average), 
        .pixel(pixel_menu)
    );
//    assign pixel = pixel_game;
    assign pixel = (state == SELECT ? pixel_menu : pixel_game);
    assign {vgaRed, vgaGreen, vgaBlue} = valid ? pixel : 12'h0;
endmodule
