module text_display(
    input clk,
    input valid,
    input [9:0] vgax, vgay,
    input [9:0] sx, sy, ex, ey, 
    input [124:0] text, // only alphabet
    input [2:0] font_color, 
    input [2:0] background_color,
    output [2:0] pixel
);
    wire [10:0] addr;
    wire [7:0] data;
    ascii_rom rom(.clk(clk), .addr(addr), .data(data));

    wire [9:0] id;
    wire [6:0] ascii;
    wire [3:0] char_row;
    wire [2:0] char_bit;
    assign id = (vgay - sy) >> 3;
    assign ascii = (id < 25 && text[id * 5 +: 5] > 0 ? text[id * 5 +: 5] + 64 : 32); // type[typeid] + 65
    assign char_row = (vgax - sx) & 4'b1111;
    assign char_bit = (vgay - sy) & 3'b111;

    assign addr = {ascii, char_row};

    wire xybit;
    assign xybit = data[~char_bit];
    wire show;
    assign show = valid && vgax >= sx && vgay >= sy && vgax < ex && vgay < ey;
    assign pixel = show ? (xybit ? font_color : background_color) : 0;
endmodule

module dict_display(
    input clk,
    input valid,
    input [9:0] vgax, vgay,
    input [9:0] sx, sy, ex, ey, 
    input [124:0] text, // only alphabet
    input [5:0] correct, tot, 
    input [2:0] font_color, 
    input [2:0] background_color,
    output [2:0] pixel
);
    wire [10:0] addr;
    wire [7:0] data;
    ascii_rom rom(.clk(clk), .addr(addr), .data(data));

    wire [9:0] id;
    wire [6:0] ascii;
    wire [3:0] char_row;
    wire [2:0] char_bit;
    assign id = (vgay - sy) >> 3;
    assign ascii = (id < 25 && text[id * 5 +: 5] > 0 ? text[id * 5 +: 5] + 64 : 32); // type[typeid] + 65
    assign char_row = (vgax - sx) & 4'b1111;
    assign char_bit = (vgay - sy) & 3'b111;

    assign addr = {ascii, char_row};

    wire xybit;
    assign xybit = data[~char_bit];
    wire show;
    assign show = valid && vgax >= sx && vgay >= sy && vgax < ex && vgay < ey;
    assign pixel = show ? (xybit ? font_color : (id < tot ? (id < correct ? 3 : 2) : background_color)) : 0;
endmodule

module num_display(
    input clk,
    input valid,
    input [9:0] vgax, vgay,
    input [9:0] sx, sy, ex, ey, 
    input [9:0] num, // 0~1000
    input [2:0] dot, 
    input [2:0] font_color, 
    input [2:0] background_color,
    output [2:0] pixel
);
    wire [10:0] addr;
    wire [7:0] data;
    wire [11:0] nums; // 123 -> 0~3: 1, 4~7: 2, 8~11: 3
    wire [3:0] a, b, c;
    assign a = num / 100; assign b = num / 10 % 10; assign c = num % 10;
    assign nums = {a, b, c};
    /////
    ascii_rom rom(.clk(clk), .addr(addr), .data(data));

    wire [9:0] id;
    wire [6:0] ascii;
    wire [3:0] char_row;
    wire [2:0] char_bit;
    assign id = (vgay - sy) >> 3;
//    assign ascii = (id < 25 && text[id * 5 +: 5] > 0 ? text[id * 5 +: 5] + 64 : 32); // type[typeid] + 65
    assign char_row = (vgax - sx) & 4'b1111;
    assign char_bit = (vgay - sy) & 3'b111;

    assign addr = {ascii, char_row};

    wire xybit;
    assign xybit = data[~char_bit];
    wire show;
    assign show = valid && vgax >= sx && vgay >= sy && vgax < ex && vgay < ey;
    assign pixel = show ? (xybit ? font_color : background_color) : 0;
endmodule