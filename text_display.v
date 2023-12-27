module text_display(
    input clk,
    input valid,
    input [9:0] vgax, vgay,
    input [9:0] sx, sy,  
    input [124:0] text, // only alphabet
    output [11:0] pixel
);
    wire [10:0] addr;
    wire [7:0] data;
    ascii_rom rom(.clk(clk), .addr(addr), .data(data));

    wire [7:0] id;
    wire [6:0] ascii;
    wire [3:0] char_row;
    wire [2:0] char_bit;
    assign id = (vgay - sy) >> 3;
    assign ascii = (id < 25 ? text[id * 5 +: 5] + 65 : 32); // type[typeid] + 65
    assign char_row = (vgax - sx) & 4'b1111;
    assign char_bit = (vgay - sy) & 3'b111;

    assign addr = {ascii, char_row};

    wire xybit, biton;
    assign xybit = data[~char_bit];
    assign biton = valid && vgax >= sx && vgay >= sy ? xybit : 0;
    assign pixel = biton ? 12'h000 : 12'hFFF;
endmodule
