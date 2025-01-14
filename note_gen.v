module note_gen(
    input clk, // clock from crystal
    input rst, // active high reset
    input [4:0] volume, 
    input [21:0] note_div_left, // div for note generation
    input [21:0] note_div_right,
    output reg [15:0] audio_left,
    output reg [15:0] audio_right
    );

    // Declare internal signals
    reg [21:0] clk_cnt_next, clk_cnt;
    reg [21:0] clk_cnt_next_2, clk_cnt_2;
    reg b_clk, b_clk_next;
    reg c_clk, c_clk_next;

    // Note frequency generation
    // clk_cnt, clk_cnt_2, b_clk, c_clk
    always @(posedge clk or posedge rst)
        if (rst == 1'b1)
            begin
                clk_cnt <= 22'd0;
                clk_cnt_2 <= 22'd0;
                b_clk <= 1'b0;
                c_clk <= 1'b0;
            end
        else
            begin
                clk_cnt <= clk_cnt_next;
                clk_cnt_2 <= clk_cnt_next_2;
                b_clk <= b_clk_next;
                c_clk <= c_clk_next;
            end
    
    // clk_cnt_next, b_clk_next
    always @*
        if (clk_cnt == note_div_left)
            begin
                clk_cnt_next = 22'd0;
                b_clk_next = ~b_clk;
            end
        else
            begin
                clk_cnt_next = clk_cnt + 1'b1;
                b_clk_next = b_clk;
            end

    // clk_cnt_next_2, c_clk_next
    always @*
        if (clk_cnt_2 == note_div_right)
            begin
                clk_cnt_next_2 = 22'd0;
                c_clk_next = ~c_clk;
            end
        else
            begin
                clk_cnt_next_2 = clk_cnt_2 + 1'b1;
                c_clk_next = c_clk;
            end

    // Assign the amplitude of the note
    // Volume is controlled here

    always @(*) begin//?
        case (volume)
            5'b00000:begin
                audio_left = (note_div_left == 22'd1) ? 16'h0000 : 
                                    (b_clk == 1'b0) ? 16'h0000 : 16'h0000;
                audio_right = (note_div_right == 22'd1) ? 16'h0000 : 
                                    (c_clk == 1'b0) ? 16'h0000 : 16'h0000;
            end
            5'b00001:begin
                audio_left = (note_div_left == 22'd1) ? 16'h0000 : 
                                    (b_clk == 1'b0) ? 16'h80 : -16'h80;
                audio_right = (note_div_right == 22'd1) ? 16'h0000 : 
                                    (c_clk == 1'b0) ? 16'h80 : -16'h80;
            end 
            5'b00011:begin
                audio_left = (note_div_left == 22'd1) ? 16'h0000 : 
                                    (b_clk == 1'b0) ? 16'h160 : -16'h160;
                audio_right = (note_div_right == 22'd1) ? 16'h0000 : 
                                    (c_clk == 1'b0) ? 16'h160 : -16'h160;
            end
            5'b00111:begin
                audio_left = (note_div_left == 22'd1) ? 16'h0000 : 
                                    (b_clk == 1'b0) ? 16'h240 : -16'h240;
                audio_right = (note_div_right == 22'd1) ? 16'h0000 : 
                                    (c_clk == 1'b0) ? 16'h240 : -16'h240;
            end
            5'b01111:begin
                audio_left = (note_div_left == 22'd1) ? 16'h0000 : 
                                    (b_clk == 1'b0) ? 16'h320 : -16'h320;
                audio_right = (note_div_right == 22'd1) ? 16'h0000 : 
                                    (c_clk == 1'b0) ? 16'h320 : -16'h320;
            end
            5'b11111:begin
                audio_left = (note_div_left == 22'd1) ? 16'h0000 : 
                                    (b_clk == 1'b0) ? 16'h400 : -16'h400;
                audio_right = (note_div_right == 22'd1) ? 16'h0000 : 
                                    (c_clk == 1'b0) ? 16'h400 : -16'h400;
            end
            default:begin
                audio_left = (note_div_left == 22'd1) ? 16'h0000 : 
                                    (b_clk == 1'b0) ? 16'h240 : -16'h240;
                audio_right = (note_div_right == 22'd1) ? 16'h0000 : 
                                    (c_clk == 1'b0) ? 16'h240 : -16'h240;
            end 
        endcase
    end
    

    /*assign audio_left = (note_div_left == 22'd1) ? 16'h0000 : 
                                (b_clk == 1'b0) ? 16'h200 : -16'h200;
    assign audio_right = (note_div_right == 22'd1) ? 16'h0000 : 
                                (c_clk == 1'b0) ? 16'h200 : -16'h200;*/
endmodule