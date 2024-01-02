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
    input dot, 
    input [2:0] font_color, 
    input [2:0] background_color,
    output [2:0] pixel
);
    wire [10:0] addr;
    wire [7:0] data;
    wire [15:0] nums; // 123 -> 0~3: 1, 4~7: 2, 8~11: 3
    wire [3:0] a, b, c, d, aa, bb;
    assign a = num / 100; assign b = num / 10 % 10; assign c = num % 10;
    assign aa = (a == 0 ? 10 : a);
    assign bb = (a == 0 && b == 0 ? 10 : b);
//     assign d = num % 10;
    assign nums = dot ? {c, 4'd11, b, aa} : {c, bb, aa};
    /////
    ascii_rom rom(.clk(clk), .addr(addr), .data(data));

    wire [9:0] id;
    wire [6:0] ascii;
    wire [3:0] char_row;
    wire [2:0] char_bit;
    assign id = (vgay - sy) >> 3;
    assign ascii = (nums[id * 4 +: 4] == 11 ? 46 : (nums[id * 4 +: 4] == 10 ? 7'h20 : nums[id * 4 +: 4] + 48));
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

module ascii_display(
    input clk,
    input valid,
    input [9:0] vgax, vgay,
    input [9:0] sx, sy, ex, ey, 
    input [6:0] ascii, 
    input [2:0] font_color, 
    input [2:0] background_color,
    output [2:0] pixel
);
    wire [10:0] addr;
    wire [7:0] data;
    ascii_rom rom(.clk(clk), .addr(addr), .data(data));

    wire [9:0] id;
    wire [3:0] char_row;
    wire [2:0] char_bit;
    assign id = (vgay - sy) >> 3;
    assign char_row = (vgax - sx) & 4'b1111;
    assign char_bit = (vgay - sy) & 3'b111;

    assign addr = {ascii, char_row};

    wire xybit;
    assign xybit = data[~char_bit];
    wire show;
    assign show = valid && vgax >= sx && vgay >= sy && vgax < ex && vgay < ey;
    assign pixel = show ? (xybit ? font_color : background_color) : 0;
endmodule