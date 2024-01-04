`define c   32'd262
`define d   32'd294
`define e   32'd330
`define f   32'd350
`define g   32'd392  
`define a   32'd440
`define b   32'd494   
`define hc  32'd524   
`define hd  32'd588   
`define he  32'd660   
`define hf  32'd700   
`define hg  32'd784     
`define sil 32'd50000000 // slience

module clock_divider #(parameter n = 27)(
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

module audio(
    input clk,
    input rst,        // BTNC: active high reset
    input [1:0] state, 
    input [4:0] vol, 
    output audio_mclk, // master clock
    output audio_lrck, // left-right clock
    output audio_sck,  // serial clock
    output audio_sdin // serial audio data input
    );

    wire [15:0] audio_in_left, audio_in_right;

    wire [31:0] freqL, freqR;           // Raw frequency, produced by music module
    wire [21:0] freq_outL, freq_outR;    // Processed frequency, adapted to the clock rate of Basys3
    reg [15:0] next_led;
    reg [3:0] key;
    reg [19:0] value;
    reg [6:0] score, next_score;
    wire [31:0] exampleR, exampleL;
    wire ending;

    wire rst_de, rst_1, volUP_de, volUP_1, volDOWN_de, volDOWN_1;
    wire key_valid;
	wire [7:0] last_change;
	wire [127:0] key_down;

    wire clkDiv22, clkDiv20;
    
    clock_divider #(.n(22)) clock_22(.clk(clk), .clk_div(clkDiv22));    // for audio
    clock_divider #(.n(20)) clock_24(.clk(clk), .clk_div(clkDiv20));    // for audio
    
    reg [31:0] cnts, cnt2, cnt3;
    wire clkDiv;
    always @ (posedge clk or posedge rst) begin
        if(rst) cnts <= 0;
        else if(state == 1 && cnts < 30'd100000000) cnts <= cnts + 1;
        else cnts <= 0;
    end
    always @ (posedge clk) begin
        if(state == 1) cnt2 <= 0;
        else if(cnt2 < 170000000) cnt2 <= cnt2 + 1;
        else cnt2 <= 170000000;
    end
    always @ (posedge clk or posedge rst) begin
        if(rst) cnt3 <= 0;
        else if(state == 2 && cnt2 == 170000000 && cnt3 < 25'd3700000) cnt3 <= cnt3 + 1;
        else cnt3 <= 0;
    end
//    clock_divider #(.n(22)) clock_div(.clk(clk), .clk_div(clkDiv));    // for audio
    assign clkDiv = (cnt3 == 25'd3700000);


    // Player Control
    // [in]  reset, clock, _play, _slow, _music, and _mode
    // [out] beat number
    wire [11:0] ibeatNum, ibeatNumct;               // Beat counter
    wire [31:0] freql, freqr, ctL, ctR;
    player_control #(.LEN(527)) playerCtrl_00 ( 
        .clk(clkDiv),
        .reset(rst || state == 1),
        .en(state == 2 && cnt2 == 170000000), 
        .ibeat(ibeatNum)
    );

    music_example music_00 (
        .ibeatNum(ibeatNum),
        .en(1),
        .toneL(freqL),
        .toneR(freqR)
    );

    // Music module
    // [in]  beat number and en
    // [out] left & right raw frequency

    // freq_outL, freq_outR
    // Note gen makes no sound, if freq_out = 50000000 / `silence = 1
    assign freql = (state == 1 ? (cnts > 90000000 ? `sil : 524) : (state == 2 ? (cnt2 < 150000000 ? 1046 : (cnt2 < 170000000 ? `sil : freqL)) : `sil));
    assign freqr = (state == 1 ? (cnts > 90000000 ? `sil : 524) : (state == 2 ? (cnt2 < 150000000 ? 1046 : (cnt2 < 170000000 ? `sil : freqR)) : `sil));
    assign freq_outL = 50000000 / freql;
    assign freq_outR = 50000000 / freqr;

    // Note generation
    // [in]  processed frequency
    // [out] audio wave signal (using square wave here)
    note_gen noteGen_00(
        .clk(clk), 
        .rst(rst), 
        .volume(vol),
        .note_div_left(freq_outL), 
        .note_div_right(freq_outR), 
        .audio_left(audio_in_left),     // left sound audio
        .audio_right(audio_in_right)    // right sound audio
    );

    // Speaker controller
    speaker_control sc(
        .clk(clk), 
        .rst(rst), 
        .audio_in_left(audio_in_left),      // left channel audio data input
        .audio_in_right(audio_in_right),    // right channel audio data input
        .audio_mclk(audio_mclk),            // master clock
        .audio_lrck(audio_lrck),            // left-right clock
        .audio_sck(audio_sck),              // serial clock
        .audio_sdin(audio_sdin)             // serial audio data input
    );

endmodule

