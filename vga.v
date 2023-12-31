`define typeline 370
`define wordline 300
`define accline 20
`define wpmline 40
`define ystart 540

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
    input [9:0] percent, 
    input [9:0] wpm, 
    input [9:0] acc, 
    input [4:0] correct, tot,
    input [14:0] times, 
    input [124:0] type, // array
    input [59:0] rd, // array
    output [3:0] vgaRed,
    output [3:0] vgaGreen,
    output [3:0] vgaBlue,
    output hsync,
    output vsync
);
    ////////////////////////
//    wire [124:0] type;
//    assign type = {105'd0, 5'd3, 5'd3, 5'd3, 5'd3};
    /////
//    clock_divider #(24) cd2(
//        .clk(clk), 
//        .clk_div(clk2)
//    );
//    reg [124:0] type;
//    always @ (posedge rst or posedge clk2) begin
//        if(rst) type <= 0;
//        else type <= type + 1;
//    end
    ////////////////////////

    wire [74:0] word0, word1, word2, word3, word4;
    wire [4:0] len0, len1, len2, len3, len4;
    wire [7:0] id0, id1, id2, id3, id4;

    assign id0 = rd[0  +: 10];
    assign id1 = rd[10 +: 10];
    assign id2 = rd[20 +: 10];
    assign id3 = rd[30 +: 10];
    assign id4 = rd[40 +: 10];

    dictionary dic0(
        .id(id0), 
        .wordnum(len0), 
        .word(word0)
    );
    dictionary dic1(
        .id(id1), 
        .wordnum(len1), 
        .word(word1)
    );
    dictionary dic2(
        .id(id2), 
        .wordnum(len2), 
        .word(word2)
    );
    dictionary dic3(
        .id(id3), 
        .wordnum(len3), 
        .word(word3)
    );
    dictionary dic4(
        .id(id4), 
        .wordnum(len4), 
        .word(word4)
    );

    wire [9:0] st0, st1, st2, st3, st4;
    assign st0 = 0;
    assign st1 = st0 + len0 + 1;
    assign st2 = st1 + len1 + 1;
    assign st3 = st2 + len2 + 1;
    assign st4 = st3 + len3 + 1;




    reg [11:0] pixel;

    assign {vgaRed, vgaGreen, vgaBlue} = valid ? pixel : 12'd0;
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

    wire [2:0] pixel_type, pixel_w0, pixel_w1, pixel_w2, pixel_w3, pixel_w4, pixel_acc, pixel_wpm, pixel_acc_text, pixel_wpm_text;
    text_display type_in(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax), 
        .vgay(vgay), 
        .sx(`typeline), 
        .ex(`typeline + 16),
        .sy(150), 
        .ey(350),
        .text(type),
        .font_color(4), 
        .background_color(1),
        .pixel(pixel_type)
    );
    dict_display w0(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax), 
        .vgay(vgay), 
        .sx(`wordline), 
        .ex(`wordline + 16),
        .sy(150 + (st0 << 3)), 
        .ey(150 + (st1 << 3) - 8),
        .correct(correct), 
        .tot(tot),
        .text(word0),
        .font_color(4), 
        .background_color(1),
        .pixel(pixel_w0)
    );
    text_display w1(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax), 
        .vgay(vgay), 
        .sx(`wordline), 
        .ex(`wordline + 16),
        .sy(150 + (st1 << 3)), 
        .ey(150 + (st2 << 3) - 8),
        .text(word1),
        .font_color(4), 
        .background_color(1),
        .pixel(pixel_w1)
    );
    text_display w2(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax), 
        .vgay(vgay), 
        .sx(`wordline), 
        .ex(`wordline + 16),
        .sy(150 + (st2 << 3)), 
        .ey(150 + (st3 << 3) - 8),
        .text(word2),
        .font_color(4), 
        .background_color(1),
        .pixel(pixel_w2)
    );
    text_display w3(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax), 
        .vgay(vgay), 
        .sx(`wordline), 
        .ex(`wordline + 16),
        .sy(150 + (st3 << 3)), 
        .ey(150 + (st4 << 3) - 8),
        .text(word3),
        .font_color(4), 
        .background_color(1),
        .pixel(pixel_w3)
    );
    text_display w4(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax), 
        .vgay(vgay), 
        .sx(`wordline), 
        .ex(`wordline + 16),
        .sy(150 + (st4 << 3)), 
        .ey(150 + ((st4 + len4) << 3)),
        .text(word4),
        .font_color(4), 
        .background_color(1),
        .pixel(pixel_w4)
    );
    text_display acctext(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax), .vgay (vgay), 
        .sx(`accline), .ex(`accline + 16), 
        .sy(`ystart), .ey(`ystart + 8 * 4), 
        .text({5'd3, 5'd3, 5'd1}), 
        .font_color(4), .background_color(0), 
        .pixel(pixel_acc_text)
    );
    num_display accdisplay(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax), .vgay (vgay), 
        .sx(`accline), .ex(`accline + 16), 
        .sy(`ystart + 8 * 4), .ey(`ystart + 8 * 8), 
        .num(acc), .dot(1), 
        .font_color(4), .background_color(0), 
        .pixel(pixel_acc)
    );
    text_display wpmtext(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax), .vgay (vgay), 
        .sx(`wpmline), .ex(`wpmline + 16), 
        .sy(`ystart), .ey(`ystart + 8 * 7), 
        .text({5'd13, 5'd16, 5'd23}),
        .font_color(4), .background_color(0), 
        .pixel(pixel_wpm_text)
    );
    num_display wpmdisplay(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax), .vgay (vgay), 
        .sx(`wpmline), .ex(`wpmline + 16), 
        .sy(`ystart + 8 * 4), .ey(`ystart + 8 * 7), 
        .num(wpm), .dot(0), 
        .font_color(4), .background_color(0), 
        .pixel(pixel_wpm)
    );

    wire [2:0] pixel_id, pixel_id1;
    find_max mx(
        .a1(pixel_type), 
        .a2(pixel_w0), 
        .a3(pixel_w1), 
        .a4(pixel_w2), 
        .a5(pixel_w3), 
        .a6(pixel_w4), 
        .a7(pixel_acc), 
        .a8(pixel_wpm), 
        .mx(pixel_id1)
    );
    find_max mx2(
        .a1(pixel_acc_text), 
        .a2(pixel_wpm_text), 
        .a3(pixel_id1), 
        .mx(pixel_id)
    );

    always @ (posedge clk_25MHz) begin
        case(pixel_id)
            0: pixel <= 12'hFFF;
            1: pixel <= 12'h0FF;
            2: pixel <= 12'hF00;
            3: pixel <= 12'h0F0;
            4: pixel <= 12'd0;
            default: pixel <= 12'h00F; // error
        endcase
    end

endmodule

module max2(
    input [2:0] a, b, 
    output [2:0] mx
);
    assign mx = a > b ? a : b;
endmodule
module find_max(
    input [2:0] a1, a2, a3, a4, a5, a6, a7, a8, 
    output [2:0] mx
);
    wire [2:0] mx12, mx34, mx56, mx78, mx13, mx57;
    max2(a1, a2, mx12);
    max2(a3, a4, mx34);
    max2(a5, a6, mx56);
    max2(a7, a8, mx78);
    max2(mx12, mx34, mx13);
    max2(mx56, mx78, mx57);
    max2(mx13, mx57, mx);
endmodule