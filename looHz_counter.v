module loHz_counter(
    input clk,
    output reg clk_div
);
    reg [23:0] num = 0,next_num = 1;
    initial begin
        num = 0;
        next_num = 1;
    end
    always@(posedge clk)begin
        num <= next_num;
    end
    always@(*)begin
        if(num == 24'd10000000)begin
            next_num = 0;
            clk_div = 1;
        end else begin
            next_num = num + 1;
            clk_div = 0;
        end
    end
    /*always@(*)begin
        clk_div = out;
    end*/
endmodule