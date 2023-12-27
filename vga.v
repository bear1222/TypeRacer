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
    input [6:0] wpm, 
    input [7:0] acc, 
    input [24:0] correct, 
    input times, 
//    input [124:0] type, // array
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
    clock_divider #(20) cd2(
        .clk(clk), 
        .clk_div(clk2)
    );
    reg [124:0] type;
    always @ (posedge rst or posedge clk2) begin
        if(rst) type <= 0;
        else type <= type + 1;
    end
    ////////////////////////



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

    wire [11:0] pixel_type;
    text_display type_in(
        .clk(clk), 
        .valid(valid), 
        .vgax(vgax), 
        .vgay(vgay), 
        .sx(370), 
        .sy(150), 
        .text(type),
        .pixel(pixel_type)
    );

    always @ (posedge clk_25MHz) begin
        pixel <= pixel_type;
    end

endmodule

/*
Record:
12/27
Q:
times?? 

*/