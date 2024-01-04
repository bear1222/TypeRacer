module record(
  input clk,
  input rst,
  input mode,
  input [2:0] state,
  input [9:0] wpm,
  input [9:0] acc,
  input finish,
  output reg [9:0] wpm_best,
  output reg [9:0] wpm_average,
  output reg [9:0] acc_best,
  output reg [9:0] acc_average
);

  reg [9:0] next_wpm_best, next_wpm_average, next_acc_best, next_acc_average;
  reg [4:0] num, next_num;
  reg lock, next_lock;

  always @(posedge clk , posedge rst)begin
    if(rst)
      lock <= 0;
    else 
      lock <= next_lock;
  end

  always @(*) begin
    if(state == 3)begin
      next_lock = 1;
    end else if(state == 2)begin
      next_lock = 0;
    end else begin
      next_lock = lock;
    end
  end

  always @(posedge clk , posedge rst)begin
    if(rst)
      num <= 0;
    else 
      num <= next_num;
  end

  always @(*) begin
    if(state == 3)begin
      if(!lock)
        next_num = num + 1;
      else 
        next_num = num;
    end else begin
      next_num = num;
    end
  end

  always @(posedge clk , posedge rst) begin
    if(rst)
      wpm_best <= 0;
    else
      wpm_best <= next_wpm_best;
  end

  always @(*) begin
    if(state == 3)begin
      if(wpm > wpm_best)begin
        next_wpm_best = wpm;
      end else begin
        next_wpm_best = wpm_best;
      end
    end else begin
        next_wpm_best = wpm_best;
    end
  end

  always @(posedge clk , posedge rst) begin
    if(rst)
      wpm_average <= 0;
    else
      wpm_average <= next_wpm_average;
  end

  always @(*) begin
    if(state == 3 && !lock)begin
      next_wpm_average = (wpm_average * num  + wpm) / (num + 1);
    end else begin
      next_wpm_average = wpm_average;
    end
  end
  
  always @(posedge clk , posedge rst) begin
    if(rst)
      acc_best <= 0;
    else
      acc_best <= next_acc_best;
  end

  always @(*) begin
    if(state == 3)begin
      if(acc > acc_best)begin
        next_acc_best = acc;
      end else begin
        next_acc_best = acc_best;
      end
    end else begin
        next_acc_best = acc_best;
    end
  end

  always @(posedge clk , posedge rst) begin
    if(rst)
      acc_average <= 0;
    else
      acc_average <= next_acc_average;
  end

  always @(*) begin
    if(state == 3 && !lock)begin
      next_acc_average = (acc_average * num + acc) / (num + 1);
    end else begin
      next_acc_average = acc_average;
    end
  end
  
endmodule