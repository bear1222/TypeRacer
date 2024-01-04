`define titlex 30
`define titley 30

`define bestline 40
`define bestaccline 60
`define bestwpmline 80
`define aveline 120
`define aveaccline 140
`define avewpmline 160
`define ystart 510

// 150, x is good
`define selectline 120
`define twline 150
`define selecty 90

module menu_screen(
    input clk, 
    input rst, 
    input [9:0] vgax, vgay, 
    input valid, 
    input mode, 
    input [6:0] value, 
    input [9:0] wpm_best,
    input [9:0] wpm_average,
    input [9:0] acc_best,
    input [9:0] acc_average, 
    output reg [11:0] pixel
);

    wire clk_25MHz;
    clock_divider #(2) cd(
        .clk(clk), 
        .clk_div(clk_25MHz)
    );

    wire [2:0] pixel_title, pixel_id, pixel_id1, pixel_id2, pixel_small, pixel_big;
    wire [2:0] pixel_best_text, pixel_bestacc_text, pixel_bestacc, pixel_bestwpm_text, pixel_bestwpm, pixel_bestmod;
    wire [2:0] pixel_ave_text, pixel_aveacc_text, pixel_aveacc, pixel_avewpm_text, pixel_avewpm, pixel_avemod;
    wire [2:0] pixel_select_text, pixel_mode_text, pixel_tw, pixel_num;

    text_display title(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax >> 2), 
        .vgay(vgay >> 2), 
        .sx(`titlex), 
        .ex(`titlex + 16),
        .sy(`titley), 
        .ey(`titley + 8 * 9),
        .text({5'd18, 5'd5, 5'd3, 5'd1, 5'd18, 5'd5, 5'd16, 5'd25, 5'd20}), // TYPERACER
        .font_color(4), 
        .background_color(0),
        .pixel(pixel_title)
    );

    // best
    text_display besttext(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax), .vgay (vgay), 
        .sx(`bestline), .ex(`bestline + 16), 
        .sy(`ystart), .ey(`ystart + 8 * 4), 
        .text({5'd20, 5'd19, 5'd5, 5'd2}), 
        .font_color(4), .background_color(0), 
        .pixel(pixel_best_text)
    );
    text_display acctext(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax), .vgay (vgay), 
        .sx(`bestaccline), .ex(`bestaccline + 16), 
        .sy(`ystart), .ey(`ystart + 8 * 4), 
        .text({5'd3, 5'd3, 5'd1}), 
        .font_color(4), .background_color(0), 
        .pixel(pixel_bestacc_text)
    );
    num_display accdisplay(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax), .vgay (vgay), 
        .sx(`bestaccline), .ex(`bestaccline + 16), 
        .sy(`ystart + 8 * 4), .ey(`ystart + 8 * 7), 
        .num(acc_best), .dot(0), 
        .font_color(4), .background_color(0), 
        .pixel(pixel_bestacc)
    );
    ascii_display mod_display(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax), .vgay (vgay), 
        .sx(`bestaccline), .ex(`bestaccline + 16), 
        .sy(`ystart + 8 * 7), .ey(`ystart + 8 * 8), 
        .ascii(6'h25), 
        .font_color(4), .background_color(0), 
        .pixel(pixel_bestmod)
    );
    text_display wpmtext(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax), .vgay (vgay), 
        .sx(`bestwpmline), .ex(`bestwpmline + 16), 
        .sy(`ystart), .ey(`ystart + 8 * 4), 
        .text({5'd13, 5'd16, 5'd23}),
        .font_color(4), .background_color(0), 
        .pixel(pixel_bestwpm_text)
    );
    num_display wpmdisplay(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax), .vgay (vgay), 
        .sx(`bestwpmline), .ex(`bestwpmline + 16), 
        .sy(`ystart + 8 * 4), .ey(`ystart + 8 * 7), 
        .num(wpm_best), .dot(0), 
        .font_color(4), .background_color(0), 
        .pixel(pixel_bestwpm)
    );

    // ave
    text_display avetext(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax), .vgay (vgay), 
        .sx(`aveline), .ex(`aveline + 16), 
        .sy(`ystart), .ey(`ystart + 8 * 7), 
        .text({5'd5, 5'd7, 5'd1, 5'd18, 5'd5, 5'd22, 5'd1}), 
        .font_color(4), .background_color(0), 
        .pixel(pixel_ave_text)
    );
    text_display aveacctext(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax), .vgay (vgay), 
        .sx(`aveaccline), .ex(`aveaccline + 16), 
        .sy(`ystart), .ey(`ystart + 8 * 4), 
        .text({5'd3, 5'd3, 5'd1}), 
        .font_color(4), .background_color(0), 
        .pixel(pixel_aveacc_text)
    );
    num_display aveaccdisplay(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax), .vgay (vgay), 
        .sx(`aveaccline), .ex(`aveaccline + 16), 
        .sy(`ystart + 8 * 4), .ey(`ystart + 8 * 7), 
        .num(acc_average), .dot(0), 
        .font_color(4), .background_color(0), 
        .pixel(pixel_aveacc)
    );
    ascii_display avemod_display(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax), .vgay (vgay), 
        .sx(`aveaccline), .ex(`aveaccline + 16), 
        .sy(`ystart + 8 * 7), .ey(`ystart + 8 * 8), 
        .ascii(6'h25), 
        .font_color(4), .background_color(0), 
        .pixel(pixel_avemod)
    );
    text_display avewpmtext(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax), .vgay (vgay), 
        .sx(`avewpmline), .ex(`avewpmline + 16), 
        .sy(`ystart), .ey(`ystart + 8 * 4), 
        .text({5'd13, 5'd16, 5'd23}),
        .font_color(4), .background_color(0), 
        .pixel(pixel_avewpm_text)
    );
    num_display avewpmdisplay(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax), .vgay (vgay), 
        .sx(`avewpmline), .ex(`avewpmline + 16), 
        .sy(`ystart + 8 * 4), .ey(`ystart + 8 * 7), 
        .num(wpm_average), .dot(0), 
        .font_color(4), .background_color(0), 
        .pixel(pixel_avewpm)
    );

    // select mode
    text_display selecttext(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax >> 1), .vgay (vgay >> 1), 
        .sx(`selectline), .ex(`selectline + 16), 
        .sy(`selecty), .ey(`selecty + 8 * 7), 
        .text({5'd20, 5'd3, 5'd5, 5'd12, 5'd5, 5'd19}),
        .font_color(4), .background_color(0), 
        .pixel(pixel_select_text)
    );
    text_display modetext(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax >> 1), .vgay (vgay >> 1), 
        .sx(`selectline), .ex(`selectline + 16), 
        .sy(`selecty + 8 * 7), .ey(`selecty + 8 * 11), 
        .text({5'd5, 5'd4, 5'd15, 5'd13}), 
        .font_color(4), .background_color(0), 
        .pixel(pixel_mode_text)
    );
    ascii_display smaller_display(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax >> 1), .vgay (vgay >> 1), 
        .sx(`twline), .ex(`twline + 16), 
        .sy(`selecty + 6), .ey(`selecty + 8 + 6), 
        .ascii(6'h3c), 
        .font_color(4), .background_color(0), 
        .pixel(pixel_small)
    );
    text_display twtext(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax >> 1), .vgay (vgay >> 1), 
        .sx(`twline), .ex(`twline + 16), 
        .sy(`selecty + 8 + 6), .ey(`selecty + 8 * 6 + 6), 
        .text(mode ? {5'd4, 5'd18, 5'd15, 5'd23} : {5'd5, 5'd13, 5'd9, 5'd20}), // mode ? "word" : "time"
        .font_color(4), .background_color(0), 
        .pixel(pixel_tw)
    );
    num_display numdisplay(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax >> 1), .vgay (vgay >> 1), 
        .sx(`twline), .ex(`twline + 16), 
        .sy(`selecty + 6 + 8 * 6), .ey(`selecty + 6 + 8 * 9), 
        .num(value), .dot(0), 
        .font_color(4), .background_color(0), 
        .pixel(pixel_num)
    );
    ascii_display biger_display(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax >> 1), .vgay (vgay >> 1), 
        .sx(`twline), .ex(`twline + 16), 
        .sy(`selecty + 6 + 8 * 9), .ey(`selecty + 8 * 10 + 6), 
        .ascii(6'h3e), 
        .font_color(4), .background_color(0), 
        .pixel(pixel_big)
    );

    find_max fm1(
        .a1(pixel_title), 
        .a2(pixel_best_text), 
        .a3(pixel_bestacc_text), 
        .a4(pixel_bestacc), 
        .a5(pixel_bestmod), 
        .a6(pixel_bestwpm_text), 
        .a7(pixel_bestwpm), 
        .a8(pixel_ave_text), 
        .mx(pixel_id1)
    );
    find_max fm2(
        .a1(pixel_id1), 
        .a2(pixel_aveacc_text), 
        .a3(pixel_aveacc), 
        .a4(pixel_avemod), 
        .a5(pixel_avewpm_text), 
        .a6(pixel_avewpm), 
        .a7(pixel_select_text), 
        .a8(pixel_mode_text), 
        .mx(pixel_id2)
    );
    find_max fm3(
        .a1(pixel_id2), 
        .a2(pixel_tw), 
        .a3(pixel_num), 
        .a4(pixel_small), 
        .a5(pixel_big), 
        .a6(0), 
        .a7(0), 
        .a8(0), 
        .mx(pixel_id)
    );

    always @ (posedge clk_25MHz) begin
        case(pixel_id)
            0: pixel <= 12'hFFF; // white
            1: pixel <= 12'h0FF; // blue
            2: pixel <= 12'hF00; // red
            3: pixel <= 12'h0F0; // green
            4: pixel <= 12'd0;   // black
            default: pixel <= 12'h00F; // error
        endcase
    end

endmodule