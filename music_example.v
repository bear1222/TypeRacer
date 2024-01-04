`define c   32'd262   
`define d   32'd294
`define e   32'd330
`define f   32'd349
`define g   32'd392   
`define a   32'd440
`define b   32'd494   
`define hc  32'd524   
`define hd  32'd588   
`define he  32'd660   
`define hf  32'd698   
`define hg  32'd784   
`define ha  32'd880
`define hb  32'd988   
`define sil 32'd50000000

module music_example (
	input [11:0] ibeatNum,
	input en,
	output reg [31:0] toneL,
    output reg [31:0] toneR
);

    always @* begin
        if(en == 1) begin
            case(ibeatNum)
                12'd0: toneR =`g; 12'd1: toneR =`g;
                12'd2: toneR =`g; 12'd3: toneR =`g;
                12'd4: toneR =`a; 12'd5: toneR =`a;
                12'd6: toneR =`a; 12'd7: toneR =`a;
                12'd8: toneR =`hc; 12'd9: toneR =`hc;
                12'd10: toneR =`hc; 12'd11: toneR =`hc;
                12'd12: toneR =`a; 12'd13: toneR =`a;
                12'd14: toneR =`a; 12'd15: toneR =`a;
                
                12'd16: toneR =`he; 12'd17: toneR =`he;
                12'd18: toneR =`he; 12'd19: toneR =`he;
                12'd20: toneR =`he; 12'd21: toneR =`he;
                12'd22: toneR =`he; 12'd23: toneR =`he;
                12'd24: toneR =`he; 12'd25: toneR =`he;
                12'd26: toneR =`he; 12'd27: toneR =`sil;
                12'd28: toneR =`he; 12'd29: toneR =`he;
                12'd30: toneR =`he; 12'd31: toneR =`he;
                
                12'd32: toneR =`he; 12'd33: toneR =`he;
                12'd34: toneR =`he; 12'd35: toneR =`he;
                12'd36: toneR =`he; 12'd37: toneR =`he;
                12'd38: toneR =`he; 12'd39: toneR =`he;
                12'd40: toneR =`hd; 12'd41: toneR =`hd;
                12'd42: toneR =`hd; 12'd43: toneR =`hd;
                12'd44: toneR =`hd; 12'd45: toneR =`hd;
                12'd46: toneR =`hd; 12'd47: toneR =`hd;
                
                12'd48: toneR =`hd; 12'd49: toneR =`hd;
                12'd50: toneR =`hd; 12'd51: toneR =`hd;
                12'd52: toneR =`hd; 12'd53: toneR =`hd;
                12'd54: toneR =`hd; 12'd55: toneR =`hd;
                12'd56: toneR =`sil; 12'd57: toneR =`sil;
                12'd58: toneR =`sil; 12'd59: toneR =`sil;
                12'd60: toneR =`sil; 12'd61: toneR =`sil;
                12'd62: toneR =`sil; 12'd63: toneR =`sil;
                
                12'd64: toneR =`g; 12'd65: toneR =`g;
                12'd66: toneR =`g; 12'd67: toneR =`g;
                12'd68: toneR =`a; 12'd69: toneR =`a;
                12'd70: toneR =`a; 12'd71: toneR =`a;
                12'd72: toneR =`hc; 12'd73: toneR =`hc;
                12'd74: toneR =`hc; 12'd75: toneR =`hc;
                12'd76: toneR =`a; 12'd77: toneR =`a;
                12'd78: toneR =`a; 12'd79: toneR =`a;
                
                12'd80: toneR =`hd; 12'd81: toneR =`hd;
                12'd82: toneR =`hd; 12'd83: toneR =`hd;
                12'd84: toneR =`hd; 12'd85: toneR =`hd;
                12'd86: toneR =`hd; 12'd87: toneR =`hd;
                12'd88: toneR =`hd; 12'd89: toneR =`hd;
                12'd90: toneR =`hd; 12'd91: toneR =`sil;
                12'd92: toneR =`hd; 12'd93: toneR =`hd;
                12'd94: toneR =`hd; 12'd95: toneR =`hd;
                
                12'd96: toneR =`hd; 12'd97: toneR =`hd;
                12'd98: toneR =`hd; 12'd99: toneR =`hd;
                12'd100: toneR =`hd; 12'd101: toneR =`hd;
                12'd102: toneR =`hd; 12'd103: toneR =`hd;
                12'd104: toneR =`hc; 12'd105: toneR =`hc;
                12'd106: toneR =`hc; 12'd107: toneR =`hc;
                12'd108: toneR =`hc; 12'd109: toneR =`hc;
                12'd110: toneR =`hc; 12'd111: toneR =`hc;
                
                12'd112: toneR =`hc; 12'd113: toneR =`hc;
                12'd114: toneR =`hc; 12'd115: toneR =`hc;
                12'd116: toneR =`hc; 12'd117: toneR =`hc;
                12'd118: toneR =`hc; 12'd119: toneR =`hc;
                12'd120: toneR =`sil; 12'd121: toneR =`sil;
                12'd122: toneR =`sil; 12'd123: toneR =`sil;
                12'd124: toneR =`sil; 12'd125: toneR =`sil;
                12'd126: toneR =`sil; 12'd127: toneR =`sil;
                
                12'd128: toneR =`g; 12'd129: toneR =`g;
                12'd130: toneR =`g; 12'd131: toneR =`g;
                12'd132: toneR =`a; 12'd133: toneR =`a;
                12'd134: toneR =`a; 12'd135: toneR =`a;
                12'd136: toneR =`hc; 12'd137: toneR =`hc;
                12'd138: toneR =`hc; 12'd139: toneR =`hc;
                12'd140: toneR =`a; 12'd141: toneR =`a;
                12'd142: toneR =`a; 12'd143: toneR =`a;
                
                12'd144: toneR =`hc; 12'd145: toneR =`hc;
                12'd146: toneR =`hc; 12'd147: toneR =`hc;
                12'd148: toneR =`hc; 12'd149: toneR =`hc;
                12'd150: toneR =`hc; 12'd151: toneR =`hc;
                12'd152: toneR =`hc; 12'd153: toneR =`hc;
                12'd154: toneR =`hc; 12'd155: toneR =`hc;
                12'd156: toneR =`hc; 12'd157: toneR =`hc;
                12'd158: toneR =`hc; 12'd159: toneR =`hc;
                
                12'd160: toneR =`hd; 12'd161: toneR =`hd;
                12'd162: toneR =`hd; 12'd163: toneR =`hd;
                12'd164: toneR =`hd; 12'd165: toneR =`hd;
                12'd166: toneR =`hd; 12'd167: toneR =`hd;
                12'd168: toneR =`b; 12'd169: toneR =`b;
                12'd170: toneR =`b; 12'd171: toneR =`b;
                12'd172: toneR =`b; 12'd173: toneR =`b;
                12'd174: toneR =`b; 12'd175: toneR =`b;
                
                12'd176: toneR =`b; 12'd177: toneR =`b;
                12'd178: toneR =`b; 12'd179: toneR =`b;
                12'd180: toneR =`b; 12'd181: toneR =`b;
                12'd182: toneR =`b; 12'd183: toneR =`b;
                12'd184: toneR =`a; 12'd185: toneR =`a;
                12'd186: toneR =`a; 12'd187: toneR =`a;
                12'd188: toneR =`a; 12'd189: toneR =`a;
                12'd190: toneR =`a; 12'd191: toneR =`a;
                
                12'd192: toneR =`g; 12'd193: toneR =`g;
                12'd194: toneR =`g; 12'd195: toneR =`g;
                12'd196: toneR =`g; 12'd197: toneR =`g;
                12'd198: toneR =`g; 12'd199: toneR =`g;
                12'd200: toneR =`g; 12'd201: toneR =`g;
                12'd202: toneR =`g; 12'd203: toneR =`g;
                12'd204: toneR =`g; 12'd205: toneR =`g;
                12'd206: toneR =`g; 12'd207: toneR =`g;
                
                12'd208: toneR =`hd; 12'd209: toneR =`hd;
                12'd210: toneR =`hd; 12'd211: toneR =`hd;
                12'd212: toneR =`hd; 12'd213: toneR =`hd;
                12'd214: toneR =`hd; 12'd215: toneR =`hd;
                12'd216: toneR =`hd; 12'd217: toneR =`hd;
                12'd218: toneR =`hd; 12'd219: toneR =`hd;
                12'd220: toneR =`hd; 12'd221: toneR =`hd;
                12'd222: toneR =`hd; 12'd223: toneR =`hd;
                
                12'd224: toneR =`hc; 12'd225: toneR =`hc;
                12'd226: toneR =`hc; 12'd227: toneR =`hc;
                12'd228: toneR =`hc; 12'd229: toneR =`hc;
                12'd230: toneR =`hc; 12'd231: toneR =`hc;
                12'd232: toneR =`hc; 12'd233: toneR =`hc;
                12'd234: toneR =`hc; 12'd235: toneR =`hc;
                12'd236: toneR =`hc; 12'd237: toneR =`hc;
                12'd238: toneR =`hc; 12'd239: toneR =`hc;
                
                12'd240: toneR =`hc; 12'd241: toneR =`hc;
                12'd242: toneR =`hc; 12'd243: toneR =`hc;
                12'd244: toneR =`hc; 12'd245: toneR =`hc;
                12'd246: toneR =`hc; 12'd247: toneR =`hc;
                12'd248: toneR =`hc; 12'd249: toneR =`hc;
                12'd250: toneR =`hc; 12'd251: toneR =`hc;
                12'd252: toneR =`hc; 12'd253: toneR =`hc;
                12'd254: toneR =`hc; 12'd255: toneR =`hc;
                
                12'd256: toneR =`g; 12'd257: toneR =`g;
                12'd258: toneR =`g; 12'd259: toneR =`g;
                12'd260: toneR =`a; 12'd261: toneR =`a;
                12'd262: toneR =`a; 12'd263: toneR =`a;
                12'd264: toneR =`hc; 12'd265: toneR =`hc;
                12'd266: toneR =`hc; 12'd267: toneR =`hc;
                12'd268: toneR =`a; 12'd269: toneR =`a;
                12'd270: toneR =`a; 12'd271: toneR =`a;
                
                12'd272: toneR =`he; 12'd273: toneR =`he;
                12'd274: toneR =`he; 12'd275: toneR =`he;
                12'd276: toneR =`he; 12'd277: toneR =`he;
                12'd278: toneR =`he; 12'd279: toneR =`he;
                12'd280: toneR =`he; 12'd281: toneR =`he;
                12'd282: toneR =`he; 12'd283: toneR =`sil;
                12'd284: toneR =`he; 12'd285: toneR =`he;
                12'd286: toneR =`he; 12'd287: toneR =`he;
                
                12'd288: toneR =`he; 12'd289: toneR =`he;
                12'd290: toneR =`he; 12'd291: toneR =`he;
                12'd292: toneR =`he; 12'd293: toneR =`he;
                12'd294: toneR =`he; 12'd295: toneR =`he;
                12'd296: toneR =`hd; 12'd297: toneR =`hd;
                12'd298: toneR =`hd; 12'd299: toneR =`hd;
                12'd300: toneR =`hd; 12'd301: toneR =`hd;
                12'd302: toneR =`hd; 12'd303: toneR =`hd;
                
                12'd304: toneR =`hd; 12'd305: toneR =`hd;
                12'd306: toneR =`hd; 12'd307: toneR =`hd;
                12'd308: toneR =`hd; 12'd309: toneR =`hd;
                12'd310: toneR =`hd; 12'd311: toneR =`hd;
                12'd312: toneR =`sil; 12'd313: toneR =`sil;
                12'd314: toneR =`sil; 12'd315: toneR =`sil;
                12'd316: toneR =`sil; 12'd317: toneR =`sil;
                12'd318: toneR =`sil; 12'd319: toneR =`sil;
                
                12'd320: toneR =`g; 12'd321: toneR =`g;
                12'd322: toneR =`g; 12'd323: toneR =`g;
                12'd324: toneR =`a; 12'd325: toneR =`a;
                12'd326: toneR =`a; 12'd327: toneR =`a;
                12'd328: toneR =`hc; 12'd329: toneR =`hc;
                12'd330: toneR =`hc; 12'd331: toneR =`hc;
                12'd332: toneR =`a; 12'd333: toneR =`a;
                12'd334: toneR =`a; 12'd335: toneR =`a;
                
                12'd336: toneR =`hg; 12'd337: toneR =`hg;
                12'd338: toneR =`hg; 12'd339: toneR =`hg;
                12'd340: toneR =`hg; 12'd341: toneR =`hg;
                12'd342: toneR =`hg; 12'd343: toneR =`hg;
                12'd344: toneR =`hg; 12'd345: toneR =`hg;
                12'd346: toneR =`hg; 12'd347: toneR =`hg;
                12'd348: toneR =`hg; 12'd349: toneR =`hg;
                12'd350: toneR =`hg; 12'd351: toneR =`hg;
                
                12'd352: toneR =`b; 12'd353: toneR =`b;
                12'd354: toneR =`b; 12'd355: toneR =`b;
                12'd356: toneR =`b; 12'd357: toneR =`b;
                12'd358: toneR =`b; 12'd359: toneR =`b;
                12'd360: toneR =`hc; 12'd361: toneR =`hc;
                12'd362: toneR =`hc; 12'd363: toneR =`hc;
                12'd364: toneR =`hc; 12'd365: toneR =`hc;
                12'd366: toneR =`hc; 12'd367: toneR =`hc;
                
                12'd368: toneR =`hc; 12'd369: toneR =`hc;
                12'd370: toneR =`hc; 12'd371: toneR =`hc;
                12'd372: toneR =`b; 12'd373: toneR =`b;
                12'd374: toneR =`b; 12'd375: toneR =`b;
                12'd376: toneR =`a; 12'd377: toneR =`a;
                12'd378: toneR =`a; 12'd379: toneR =`a;
                12'd380: toneR =`a; 12'd381: toneR =`a;
                12'd382: toneR =`a; 12'd383: toneR =`a;
                
                12'd384: toneR =`g; 12'd385: toneR =`g;
                12'd386: toneR =`g; 12'd387: toneR =`g;
                12'd388: toneR =`a; 12'd389: toneR =`a;
                12'd390: toneR =`a; 12'd391: toneR =`a;
                12'd392: toneR =`hc; 12'd393: toneR =`hc;
                12'd394: toneR =`hc; 12'd395: toneR =`hc;
                12'd396: toneR =`a; 12'd397: toneR =`a;
                12'd398: toneR =`a; 12'd399: toneR =`a;
                
                12'd400: toneR =`hc; 12'd401: toneR =`hc;
                12'd402: toneR =`hc; 12'd403: toneR =`hc;
                12'd404: toneR =`hc; 12'd405: toneR =`hc;
                12'd406: toneR =`hc; 12'd407: toneR =`hc;
                12'd408: toneR =`hc; 12'd409: toneR =`hc;
                12'd410: toneR =`hc; 12'd411: toneR =`hc;
                12'd412: toneR =`hc; 12'd413: toneR =`hc;
                12'd414: toneR =`hc; 12'd415: toneR =`hc;
                
                12'd416: toneR =`hd; 12'd417: toneR =`hd;
                12'd418: toneR =`hd; 12'd419: toneR =`hd;
                12'd420: toneR =`hd; 12'd421: toneR =`hd;
                12'd422: toneR =`hd; 12'd423: toneR =`hd;
                12'd424: toneR =`b; 12'd425: toneR =`b;
                12'd426: toneR =`b; 12'd427: toneR =`b;
                12'd428: toneR =`b; 12'd429: toneR =`b;
                12'd430: toneR =`b; 12'd431: toneR =`b;
                
                12'd432: toneR =`b; 12'd433: toneR =`b;
                12'd434: toneR =`b; 12'd435: toneR =`b;
                12'd436: toneR =`b; 12'd437: toneR =`b;
                12'd438: toneR =`b; 12'd439: toneR =`b;
                12'd440: toneR =`a; 12'd441: toneR =`a;
                12'd442: toneR =`a; 12'd443: toneR =`a;
                12'd444: toneR =`a; 12'd445: toneR =`a;
                12'd446: toneR =`a; 12'd447: toneR =`a;
                
                12'd448: toneR =`g; 12'd449: toneR =`g;
                12'd450: toneR =`g; 12'd451: toneR =`g;
                12'd452: toneR =`g; 12'd453: toneR =`g;
                12'd454: toneR =`g; 12'd455: toneR =`g;
                12'd456: toneR =`g; 12'd457: toneR =`g;
                12'd458: toneR =`g; 12'd459: toneR =`g;
                12'd460: toneR =`g; 12'd461: toneR =`g;
                12'd462: toneR =`g; 12'd463: toneR =`g;
                
                12'd464: toneR =`hd; 12'd465: toneR =`hd;
                12'd466: toneR =`hd; 12'd467: toneR =`hd;
                12'd468: toneR =`hd; 12'd469: toneR =`hd;
                12'd470: toneR =`hd; 12'd471: toneR =`hd;
                12'd472: toneR =`hd; 12'd473: toneR =`hd;
                12'd474: toneR =`hd; 12'd475: toneR =`hd;
                12'd476: toneR =`hd; 12'd477: toneR =`hd;
                12'd478: toneR =`hd; 12'd479: toneR =`hd;
                
                12'd480: toneR =`hc; 12'd481: toneR =`hc;
                12'd482: toneR =`hc; 12'd483: toneR =`hc;
                12'd484: toneR =`hc; 12'd485: toneR =`hc;
                12'd486: toneR =`hc; 12'd487: toneR =`hc;
                12'd488: toneR =`hc; 12'd489: toneR =`hc;
                12'd490: toneR =`hc; 12'd491: toneR =`hc;
                12'd492: toneR =`hc; 12'd493: toneR =`hc;
                12'd494: toneR =`hc; 12'd495: toneR =`hc;
                
                12'd496: toneR =`hc; 12'd497: toneR =`hc;
                12'd498: toneR =`hc; 12'd499: toneR =`hc;
                12'd500: toneR =`hc; 12'd501: toneR =`hc;
                12'd502: toneR =`hc; 12'd503: toneR =`hc;
                12'd504: toneR =`hc; 12'd505: toneR =`hc;
                12'd506: toneR =`hc; 12'd507: toneR =`hc;
                12'd508: toneR =`hc; 12'd509: toneR =`hc;
                12'd510: toneR =`hc; 12'd511: toneR =`hc;
                
                12'd512: toneR =`sil; 12'd513: toneR =`sil;
                12'd514: toneR =`sil; 12'd515: toneR =`sil;
                12'd516: toneR =`sil; 12'd517: toneR =`sil;
                12'd518: toneR =`sil; 12'd519: toneR =`sil;
                12'd520: toneR =`sil; 12'd521: toneR =`sil;
                12'd522: toneR =`sil; 12'd523: toneR =`sil;
                12'd524: toneR =`sil; 12'd525: toneR =`sil;
                12'd526: toneR =`sil; 12'd527: toneR =`sil;

                default: toneR = `sil;
            endcase
        end else begin
            toneR = `sil;
        end
    end

    always @(*) begin
        if(en == 1)begin
            case(ibeatNum)
                12'd0: toneL =`g; 12'd1: toneL =`g;
                12'd2: toneL =`g; 12'd3: toneL =`g;
                12'd4: toneL =`a; 12'd5: toneL =`a;
                12'd6: toneL =`a; 12'd7: toneL =`a;
                12'd8: toneL =`hc; 12'd9: toneL =`hc;
                12'd10: toneL =`hc; 12'd11: toneL =`hc;
                12'd12: toneL =`a; 12'd13: toneL =`a;
                12'd14: toneL =`a; 12'd15: toneL =`a;

                12'd16: toneL =`he; 12'd17: toneL =`he;
                12'd18: toneL =`he; 12'd19: toneL =`he;
                12'd20: toneL =`he; 12'd21: toneL =`he;
                12'd22: toneL =`he; 12'd23: toneL =`he;
                12'd24: toneL =`he; 12'd25: toneL =`he;
                12'd26: toneL =`he; 12'd27: toneL =`sil;
                12'd28: toneL =`he; 12'd29: toneL =`he;
                12'd30: toneL =`he; 12'd31: toneL =`he;

                12'd32: toneL =`he; 12'd33: toneL =`he;
                12'd34: toneL =`he; 12'd35: toneL =`he;
                12'd36: toneL =`he; 12'd37: toneL =`he;
                12'd38: toneL =`he; 12'd39: toneL =`he;
                12'd40: toneL =`hd; 12'd41: toneL =`hd;
                12'd42: toneL =`hd; 12'd43: toneL =`hd;
                12'd44: toneL =`hd; 12'd45: toneL =`hd;
                12'd46: toneL =`hd; 12'd47: toneL =`hd;

                12'd48: toneL =`hd; 12'd49: toneL =`hd;
                12'd50: toneL =`hd; 12'd51: toneL =`hd;
                12'd52: toneL =`hd; 12'd53: toneL =`hd;
                12'd54: toneL =`hd; 12'd55: toneL =`hd;
                12'd56: toneL =`sil; 12'd57: toneL =`sil;
                12'd58: toneL =`sil; 12'd59: toneL =`sil;
                12'd60: toneL =`sil; 12'd61: toneL =`sil;
                12'd62: toneL =`sil; 12'd63: toneL =`sil;

                12'd64: toneL =`g; 12'd65: toneL =`g;
                12'd66: toneL =`g; 12'd67: toneL =`g;
                12'd68: toneL =`a; 12'd69: toneL =`a;
                12'd70: toneL =`a; 12'd71: toneL =`a;
                12'd72: toneL =`hc; 12'd73: toneL =`hc;
                12'd74: toneL =`hc; 12'd75: toneL =`hc;
                12'd76: toneL =`a; 12'd77: toneL =`a;
                12'd78: toneL =`a; 12'd79: toneL =`a;

                12'd80: toneL =`hd; 12'd81: toneL =`hd;
                12'd82: toneL =`hd; 12'd83: toneL =`hd;
                12'd84: toneL =`hd; 12'd85: toneL =`hd;
                12'd86: toneL =`hd; 12'd87: toneL =`hd;
                12'd88: toneL =`hd; 12'd89: toneL =`hd;
                12'd90: toneL =`hd; 12'd91: toneL =`sil;
                12'd92: toneL =`hd; 12'd93: toneL =`hd;
                12'd94: toneL =`hd; 12'd95: toneL =`hd;

                12'd96: toneL =`hd; 12'd97: toneL =`hd;
                12'd98: toneL =`hd; 12'd99: toneL =`hd;
                12'd100: toneL =`hd; 12'd101: toneL =`hd;
                12'd102: toneL =`hd; 12'd103: toneL =`hd;
                12'd104: toneL =`hc; 12'd105: toneL =`hc;
                12'd106: toneL =`hc; 12'd107: toneL =`hc;
                12'd108: toneL =`hc; 12'd109: toneL =`hc;
                12'd110: toneL =`hc; 12'd111: toneL =`hc;

                12'd112: toneL =`hc; 12'd113: toneL =`hc;
                12'd114: toneL =`hc; 12'd115: toneL =`hc;
                12'd116: toneL =`hc; 12'd117: toneL =`hc;
                12'd118: toneL =`hc; 12'd119: toneL =`hc;
                12'd120: toneL =`sil; 12'd121: toneL =`sil;
                12'd122: toneL =`sil; 12'd123: toneL =`sil;
                12'd124: toneL =`sil; 12'd125: toneL =`sil;
                12'd126: toneL =`sil; 12'd127: toneL =`sil;

                12'd128: toneL =`g; 12'd129: toneL =`g;
                12'd130: toneL =`g; 12'd131: toneL =`g;
                12'd132: toneL =`a; 12'd133: toneL =`a;
                12'd134: toneL =`a; 12'd135: toneL =`a;
                12'd136: toneL =`hc; 12'd137: toneL =`hc;
                12'd138: toneL =`hc; 12'd139: toneL =`hc;
                12'd140: toneL =`a; 12'd141: toneL =`a;
                12'd142: toneL =`a; 12'd143: toneL =`a;

                12'd144: toneL =`hc; 12'd145: toneL =`hc;
                12'd146: toneL =`hc; 12'd147: toneL =`hc;
                12'd148: toneL =`hc; 12'd149: toneL =`hc;
                12'd150: toneL =`hc; 12'd151: toneL =`hc;
                12'd152: toneL =`hc; 12'd153: toneL =`hc;
                12'd154: toneL =`hc; 12'd155: toneL =`hc;
                12'd156: toneL =`hc; 12'd157: toneL =`hc;
                12'd158: toneL =`hc; 12'd159: toneL =`hc;

                12'd160: toneL =`hd; 12'd161: toneL =`hd;
                12'd162: toneL =`hd; 12'd163: toneL =`hd;
                12'd164: toneL =`hd; 12'd165: toneL =`hd;
                12'd166: toneL =`hd; 12'd167: toneL =`hd;
                12'd168: toneL =`b; 12'd169: toneL =`b;
                12'd170: toneL =`b; 12'd171: toneL =`b;
                12'd172: toneL =`b; 12'd173: toneL =`b;
                12'd174: toneL =`b; 12'd175: toneL =`b;

                12'd176: toneL =`b; 12'd177: toneL =`b;
                12'd178: toneL =`b; 12'd179: toneL =`b;
                12'd180: toneL =`b; 12'd181: toneL =`b;
                12'd182: toneL =`b; 12'd183: toneL =`b;
                12'd184: toneL =`a; 12'd185: toneL =`a;
                12'd186: toneL =`a; 12'd187: toneL =`a;
                12'd188: toneL =`a; 12'd189: toneL =`a;
                12'd190: toneL =`a; 12'd191: toneL =`a;

                12'd192: toneL =`g; 12'd193: toneL =`g;
                12'd194: toneL =`g; 12'd195: toneL =`g;
                12'd196: toneL =`g; 12'd197: toneL =`g;
                12'd198: toneL =`g; 12'd199: toneL =`g;
                12'd200: toneL =`g; 12'd201: toneL =`g;
                12'd202: toneL =`g; 12'd203: toneL =`g;
                12'd204: toneL =`g; 12'd205: toneL =`g;
                12'd206: toneL =`g; 12'd207: toneL =`g;

                12'd208: toneL =`hd; 12'd209: toneL =`hd;
                12'd210: toneL =`hd; 12'd211: toneL =`hd;
                12'd212: toneL =`hd; 12'd213: toneL =`hd;
                12'd214: toneL =`hd; 12'd215: toneL =`hd;
                12'd216: toneL =`hd; 12'd217: toneL =`hd;
                12'd218: toneL =`hd; 12'd219: toneL =`hd;
                12'd220: toneL =`hd; 12'd221: toneL =`hd;
                12'd222: toneL =`hd; 12'd223: toneL =`hd;

                12'd224: toneL =`hc; 12'd225: toneL =`hc;
                12'd226: toneL =`hc; 12'd227: toneL =`hc;
                12'd228: toneL =`hc; 12'd229: toneL =`hc;
                12'd230: toneL =`hc; 12'd231: toneL =`hc;
                12'd232: toneL =`hc; 12'd233: toneL =`hc;
                12'd234: toneL =`hc; 12'd235: toneL =`hc;
                12'd236: toneL =`hc; 12'd237: toneL =`hc;
                12'd238: toneL =`hc; 12'd239: toneL =`hc;

                12'd240: toneL =`hc; 12'd241: toneL =`hc;
                12'd242: toneL =`hc; 12'd243: toneL =`hc;
                12'd244: toneL =`hc; 12'd245: toneL =`hc;
                12'd246: toneL =`hc; 12'd247: toneL =`hc;
                12'd248: toneL =`hc; 12'd249: toneL =`hc;
                12'd250: toneL =`hc; 12'd251: toneL =`hc;
                12'd252: toneL =`hc; 12'd253: toneL =`hc;
                12'd254: toneL =`hc; 12'd255: toneL =`hc;

                12'd256: toneL =`g; 12'd257: toneL =`g;
                12'd258: toneL =`g; 12'd259: toneL =`g;
                12'd260: toneL =`a; 12'd261: toneL =`a;
                12'd262: toneL =`a; 12'd263: toneL =`a;
                12'd264: toneL =`hc; 12'd265: toneL =`hc;
                12'd266: toneL =`hc; 12'd267: toneL =`hc;
                12'd268: toneL =`a; 12'd269: toneL =`a;
                12'd270: toneL =`a; 12'd271: toneL =`a;

                12'd272: toneL =`he; 12'd273: toneL =`he;
                12'd274: toneL =`he; 12'd275: toneL =`he;
                12'd276: toneL =`he; 12'd277: toneL =`he;
                12'd278: toneL =`he; 12'd279: toneL =`he;
                12'd280: toneL =`he; 12'd281: toneL =`he;
                12'd282: toneL =`he; 12'd283: toneL =`sil;
                12'd284: toneL =`he; 12'd285: toneL =`he;
                12'd286: toneL =`he; 12'd287: toneL =`he;

                12'd288: toneL =`he; 12'd289: toneL =`he;
                12'd290: toneL =`he; 12'd291: toneL =`he;
                12'd292: toneL =`he; 12'd293: toneL =`he;
                12'd294: toneL =`he; 12'd295: toneL =`he;
                12'd296: toneL =`hd; 12'd297: toneL =`hd;
                12'd298: toneL =`hd; 12'd299: toneL =`hd;
                12'd300: toneL =`hd; 12'd301: toneL =`hd;
                12'd302: toneL =`hd; 12'd303: toneL =`hd;

                12'd304: toneL =`hd; 12'd305: toneL =`hd;
                12'd306: toneL =`hd; 12'd307: toneL =`hd;
                12'd308: toneL =`hd; 12'd309: toneL =`hd;
                12'd310: toneL =`hd; 12'd311: toneL =`hd;
                12'd312: toneL =`sil; 12'd313: toneL =`sil;
                12'd314: toneL =`sil; 12'd315: toneL =`sil;
                12'd316: toneL =`sil; 12'd317: toneL =`sil;
                12'd318: toneL =`sil; 12'd319: toneL =`sil;

                12'd320: toneL =`g; 12'd321: toneL =`g;
                12'd322: toneL =`g; 12'd323: toneL =`g;
                12'd324: toneL =`a; 12'd325: toneL =`a;
                12'd326: toneL =`a; 12'd327: toneL =`a;
                12'd328: toneL =`hc; 12'd329: toneL =`hc;
                12'd330: toneL =`hc; 12'd331: toneL =`hc;
                12'd332: toneL =`a; 12'd333: toneL =`a;
                12'd334: toneL =`a; 12'd335: toneL =`a;

                12'd336: toneL =`hg; 12'd337: toneL =`hg;
                12'd338: toneL =`hg; 12'd339: toneL =`hg;
                12'd340: toneL =`hg; 12'd341: toneL =`hg;
                12'd342: toneL =`hg; 12'd343: toneL =`hg;
                12'd344: toneL =`hg; 12'd345: toneL =`hg;
                12'd346: toneL =`hg; 12'd347: toneL =`hg;
                12'd348: toneL =`hg; 12'd349: toneL =`hg;
                12'd350: toneL =`hg; 12'd351: toneL =`hg;

                12'd352: toneL =`b; 12'd353: toneL =`b;
                12'd354: toneL =`b; 12'd355: toneL =`b;
                12'd356: toneL =`b; 12'd357: toneL =`b;
                12'd358: toneL =`b; 12'd359: toneL =`b;
                12'd360: toneL =`hc; 12'd361: toneL =`hc;
                12'd362: toneL =`hc; 12'd363: toneL =`hc;
                12'd364: toneL =`hc; 12'd365: toneL =`hc;
                12'd366: toneL =`hc; 12'd367: toneL =`hc;

                12'd368: toneL =`hc; 12'd369: toneL =`hc;
                12'd370: toneL =`hc; 12'd371: toneL =`hc;
                12'd372: toneL =`b; 12'd373: toneL =`b;
                12'd374: toneL =`b; 12'd375: toneL =`b;
                12'd376: toneL =`a; 12'd377: toneL =`a;
                12'd378: toneL =`a; 12'd379: toneL =`a;
                12'd380: toneL =`a; 12'd381: toneL =`a;
                12'd382: toneL =`a; 12'd383: toneL =`a;

                12'd384: toneL =`g; 12'd385: toneL =`g;
                12'd386: toneL =`g; 12'd387: toneL =`g;
                12'd388: toneL =`a; 12'd389: toneL =`a;
                12'd390: toneL =`a; 12'd391: toneL =`a;
                12'd392: toneL =`hc; 12'd393: toneL =`hc;
                12'd394: toneL =`hc; 12'd395: toneL =`hc;
                12'd396: toneL =`a; 12'd397: toneL =`a;
                12'd398: toneL =`a; 12'd399: toneL =`a;

                12'd400: toneL =`hc; 12'd401: toneL =`hc;
                12'd402: toneL =`hc; 12'd403: toneL =`hc;
                12'd404: toneL =`hc; 12'd405: toneL =`hc;
                12'd406: toneL =`hc; 12'd407: toneL =`hc;
                12'd408: toneL =`hc; 12'd409: toneL =`hc;
                12'd410: toneL =`hc; 12'd411: toneL =`hc;
                12'd412: toneL =`hc; 12'd413: toneL =`hc;
                12'd414: toneL =`hc; 12'd415: toneL =`hc;

                12'd416: toneL =`hd; 12'd417: toneL =`hd;
                12'd418: toneL =`hd; 12'd419: toneL =`hd;
                12'd420: toneL =`hd; 12'd421: toneL =`hd;
                12'd422: toneL =`hd; 12'd423: toneL =`hd;
                12'd424: toneL =`b; 12'd425: toneL =`b;
                12'd426: toneL =`b; 12'd427: toneL =`b;
                12'd428: toneL =`b; 12'd429: toneL =`b;
                12'd430: toneL =`b; 12'd431: toneL =`b;

                12'd432: toneL =`b; 12'd433: toneL =`b;
                12'd434: toneL =`b; 12'd435: toneL =`b;
                12'd436: toneL =`b; 12'd437: toneL =`b;
                12'd438: toneL =`b; 12'd439: toneL =`b;
                12'd440: toneL =`a; 12'd441: toneL =`a;
                12'd442: toneL =`a; 12'd443: toneL =`a;
                12'd444: toneL =`a; 12'd445: toneL =`a;
                12'd446: toneL =`a; 12'd447: toneL =`a;

                12'd448: toneL =`g; 12'd449: toneL =`g;
                12'd450: toneL =`g; 12'd451: toneL =`g;
                12'd452: toneL =`g; 12'd453: toneL =`g;
                12'd454: toneL =`g; 12'd455: toneL =`g;
                12'd456: toneL =`g; 12'd457: toneL =`g;
                12'd458: toneL =`g; 12'd459: toneL =`g;
                12'd460: toneL =`g; 12'd461: toneL =`g;
                12'd462: toneL =`g; 12'd463: toneL =`g;

                12'd464: toneL =`hd; 12'd465: toneL =`hd;
                12'd466: toneL =`hd; 12'd467: toneL =`hd;
                12'd468: toneL =`hd; 12'd469: toneL =`hd;
                12'd470: toneL =`hd; 12'd471: toneL =`hd;
                12'd472: toneL =`hd; 12'd473: toneL =`hd;
                12'd474: toneL =`hd; 12'd475: toneL =`hd;
                12'd476: toneL =`hd; 12'd477: toneL =`hd;
                12'd478: toneL =`hd; 12'd479: toneL =`hd;

                12'd480: toneL =`hc; 12'd481: toneL =`hc;
                12'd482: toneL =`hc; 12'd483: toneL =`hc;
                12'd484: toneL =`hc; 12'd485: toneL =`hc;
                12'd486: toneL =`hc; 12'd487: toneL =`hc;
                12'd488: toneL =`hc; 12'd489: toneL =`hc;
                12'd490: toneL =`hc; 12'd491: toneL =`hc;
                12'd492: toneL =`hc; 12'd493: toneL =`hc;
                12'd494: toneL =`hc; 12'd495: toneL =`hc;

                12'd496: toneL =`hc; 12'd497: toneL =`hc;
                12'd498: toneL =`hc; 12'd499: toneL =`hc;
                12'd500: toneL =`hc; 12'd501: toneL =`hc;
                12'd502: toneL =`hc; 12'd503: toneL =`hc;
                12'd504: toneL =`hc; 12'd505: toneL =`hc;
                12'd506: toneL =`hc; 12'd507: toneL =`hc;
                12'd508: toneL =`hc; 12'd509: toneL =`hc;
                12'd510: toneL =`hc; 12'd511: toneL =`hc;

                12'd512: toneL =`sil; 12'd513: toneL =`sil;
                12'd514: toneL =`sil; 12'd515: toneL =`sil;
                12'd516: toneL =`sil; 12'd517: toneL =`sil;
                12'd518: toneL =`sil; 12'd519: toneL =`sil;
                12'd520: toneL =`sil; 12'd521: toneL =`sil;
                12'd522: toneL =`sil; 12'd523: toneL =`sil;
                12'd524: toneL =`sil; 12'd525: toneL =`sil;
                12'd526: toneL =`sil; 12'd527: toneL =`sil;

                default : toneL = `sil;
            endcase
        end
        else begin
            toneL = `sil;
        end
    end
endmodule