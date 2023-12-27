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
    input _play,      // SW0: Play/Pause
    input _start,     // SW1: Start/Exit
    input _mute,      // SW14: Mute
    input _mode,      // SW15: Mode
    input _volUP,     // BTNU: Vol up
    input _volDOWN,   // BTND: Vol down
    output audio_mclk, // master clock
    output audio_lrck, // left-right clock
    output audio_sck,  // serial clock
    output audio_sdin // serial audio data input
    );

    wire [15:0] audio_in_left, audio_in_right;

    wire [11:0] ibeatNum, ex_ibeat;               // Beat counter
    wire [31:0] freqL, freqR;           // Raw frequency, produced by music module
    wire [21:0] freq_outL, freq_outR;    // Processed frequency, adapted to the clock rate of Basys3
    wire [4:0] vol;
    reg [4:0] volume = 5'b00111, next_volume;
    reg [15:0] next_led;
    reg [3:0] key;
    reg [19:0] value;
    reg [31:0] freql, freqr, next_freql, next_freqr;
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
    

    // Player Control
    // [in]  reset, clock, _play, _slow, _music, and _mode
    // [out] beat number
    player_control #(.LEN(511)) playerCtrl_00 ( 
        .clk(clkDiv22),
        .reset(rst),
        ._play(_play), 
        ._mode(_mode),
        .ibeat(ibeatNum)
    );

    // Music module
    // [in]  beat number and en
    // [out] left & right raw frequency

    example music (
        .clk(clkDiv22),
        .reset(rst),
        ._start(_start), 
        ._mode(_mode),
        .ending(ending),
        .toneL(exampleL),
        .toneR(exampleR),
        .ibeat(ex_ibeat)
    );
    
    music_example music_00 (
        .ibeatNum(ibeatNum),
        .en(_play),
        .toneL(freqL),
        .toneR(freqR)
    );
    
    // freq_outL, freq_outR
    // Note gen makes no sound, if freq_out = 50000000 / `silence = 1
    assign freq_outL = (_mode) ? 50000000 / freqL : 50000000 / freql;
    assign freq_outR = (_mode) ? 50000000 / freqR : 50000000 / freqr;

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

    assign vol = (_mute) ? 0 : volume;

    always @(posedge clkDiv20 or posedge rst_1) begin
        if(rst_1) volume <= 5'b00111;
        else volume <= next_volume;
    end

    always @(*) begin
        if(!_mute)begin
            if(volDOWN_1)begin
                if(volume > 5'd1) next_volume = volume >> 1;
                else next_volume = 5'd1;
            end else if(volUP_1)begin
                if(volume < 5'b11111) next_volume = (volume << 1) + 1;
                else next_volume = 5'b11111;
            end else begin
                next_volume = volume;
            end
        end
        
    end
endmodule

