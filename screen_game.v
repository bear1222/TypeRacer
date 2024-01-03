`define typeline 370
`define wordline 340
`define accline 40
`define wpmline 60
`define ystart 510
`define timeline 40
`define timeystart 50
`define carx 200
`define cary 80

module game_screen(
    input clk, 
    input rst, 
    input [9:0] percent, 
    input [9:0] wpm, 
    input [9:0] acc, 
    input [4:0] correct, tot,
    input [14:0] times, 
    input [74:0] type, // array
    input [47:0] rd, // array
    input valid, 
    input [9:0] vgax, vgay, 
    output reg [11:0] pixel
);
    wire clk_25MHz;
    clock_divider #(2) cd(
        .clk(clk), 
        .clk_div(clk_25MHz)
    );

    wire [74:0] word0, word1, word2, word3, word4;
    wire [4:0] len0, len1, len2, len3, len4;
    wire [7:0] id0, id1, id2, id3, id4;

    assign id0 = rd[0  +: 8];
    assign id1 = rd[8 +: 8];
    assign id2 = rd[16 +: 8];
    assign id3 = rd[24 +: 8];
    assign id4 = rd[32 +: 8];

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

    wire [11:0] pixel_car;

    wire [2:0] pixel_type, pixel_w0, pixel_w1, pixel_w2, pixel_w3, pixel_w4, pixel_acc, pixel_wpm, pixel_acc_text, pixel_wpm_text, pixel_time, pixel_time_text, pixel_mod;
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

    wire [9:0] sy0, sy1, sy2, sy3, sy4, ey0, ey1, ey2, ey3, ey4;
    assign sy0 = 150 + (st0 << 3);
    assign sy1 = 150 + (st1 << 3);
    assign sy2 = 150 + (st2 << 3);
    assign sy3 = 150 + (st3 << 3);
    assign sy4 = 150 + (st4 << 3);
    assign ey0 = sy1 - 8;
    assign ey1 = sy2 - 8;
    assign ey2 = sy3 - 8;
    assign ey3 = sy4 - 8;
    assign ey4 = 150 + ((st4 + len4) << 3);
    dict_display w0(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax), 
        .vgay(vgay), 
        .sx(`wordline), 
        .ex(`wordline + 16),
        .sy(sy0), 
        .ey(ey0),
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
        .sy(sy1), 
        .ey(ey1),
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
        .sy(sy2), 
        .ey(ey2),
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
        .sy(sy3), 
        .ey(ey3),
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
        .sy(sy4), 
        .ey(ey4), 
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
        .sy(`ystart + 8 * 4), .ey(`ystart + 8 * 7), 
        .num(acc), .dot(0), 
        .font_color(4), .background_color(0), 
        .pixel(pixel_acc)
    );
    ascii_display mod_display(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax), .vgay (vgay), 
        .sx(`accline), .ex(`accline + 16), 
        .sy(`ystart + 8 * 7), .ey(`ystart + 8 * 8), 
        .ascii(6'h25), 
        .font_color(4), .background_color(0), 
        .pixel(pixel_mod)
    );
    text_display wpmtext(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax), .vgay (vgay), 
        .sx(`wpmline), .ex(`wpmline + 16), 
        .sy(`ystart), .ey(`ystart + 8 * 4), 
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
    text_display timetext(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax), .vgay (vgay), 
        .sx(`timeline), .ex(`timeline + 16), 
        .sy(`timeystart), .ey(`timeystart + 8 * 5), 
        .text({5'd5, 5'd13, 5'd9, 5'd20}),
        .font_color(4), .background_color(0), 
        .pixel(pixel_time_text)
    );
    num_display timedisplay(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax), .vgay (vgay), 
        .sx(`timeline), .ex(`timeline + 16), 
        .sy(`timeystart + 8 * 5), .ey(`timeystart + 8 * 9), 
        .num(times), .dot(1), 
        .font_color(4), .background_color(0), 
        .pixel(pixel_time)
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
        .a1(pixel_id1), 
        .a2(pixel_wpm_text), 
        .a3(pixel_acc_text), 
        .a4(pixel_time), 
        .a5(pixel_time_text), 
        .a6(pixel_mod), 
        .a7(0), 
        .a8(0), 
        .mx(pixel_id)
    );

    wire incar;
    wire [11:0]car_addr;
    assign incar = vgax >= `carx && vgax < `carx + 48 && vgay >= `cary + (percent * 4) && vgay < `cary + 80 + (percent * 4);
    assign car_addr = incar ? ((vgax - `carx) * 80 + (vgay - `cary - (percent * 4))) : 0;
    blk_mem_gen_0 clk_mem_gen_0_inst(
        .clka(clk_25MHz), 
        .wea(0), 
        .addra(car_addr), 
        .dina(0), 
        .douta(pixel_car) 
    );

    always @ (posedge clk_25MHz) begin
        if(incar) pixel <= pixel_car;
        else if(vgax >= `carx + 52 && vgax < `carx + 56 && vgay >= `cary - 5 && vgay < `cary + 485) pixel <= 12'hFF0;
        else begin
            case(pixel_id)
                0: pixel <= 12'hFFF; // white
                1: pixel <= 12'h0FF; // blue
                2: pixel <= 12'hF00; // red
                3: pixel <= 12'h0F0; // green
                4: pixel <= 12'd0;   // black
                default: pixel <= 12'h00F; // error
            endcase
        end
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