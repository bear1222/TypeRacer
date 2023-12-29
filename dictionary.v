module dictionary(
	input [7:0] id,
	output reg [4:0] wordnum,
	output reg [74:0] word // 5 bits per alphabet, length <= 15
);
	always @ * begin
		case(id) 
            1: begin
                wordnum = 8;
                word = {5'd25,5'd3,5'd1,5'd18,5'd21,5'd3,5'd3,5'd1};
            end
            2: begin
                wordnum = 3;
                word = {5'd4,5'd4,5'd1};
            end
            3: begin
                wordnum = 3;
                word = {5'd12,5'd12,5'd1};
            end
            4: begin
                wordnum = 5;
                word = {5'd23,5'd15,5'd12,5'd12,5'd1};
            end
            5: begin
                wordnum = 6;
                word = {5'd20,5'd14,5'd21,5'd15,5'd13,5'd1};
            end
            6: begin
                wordnum = 5;
                word = {5'd25,5'd18,5'd7,5'd14,5'd1};
            end
            7: begin
                wordnum = 6;
                word = {5'd12,5'd1,5'd13,5'd9,5'd14,5'd1};
            end
            8: begin
                wordnum = 6;
                word = {5'd18,5'd5,5'd23,5'd19,5'd14,5'd1};
            end
            9: begin
                wordnum = 5;
                word = {5'd5,5'd12,5'd16,5'd16,5'd1};
            end
            10: begin
                wordnum = 3;
                word = {5'd5,5'd18,5'd1};
            end
            11: begin
                wordnum = 4;
                word = {5'd25,5'd13,5'd18,5'd1};
            end
            12: begin
                wordnum = 6;
                word = {5'd4,5'd14,5'd21,5'd15,5'd18,5'd1};
            end
            13: begin
                wordnum = 4;
                word = {5'd11,5'd3,5'd1,5'd2};
            end
            14: begin
                wordnum = 6;
                word = {5'd1,5'd14,5'd1,5'd14,5'd1,5'd2};
            end
            15: begin
                wordnum = 6;
                word = {5'd5,5'd18,5'd15,5'd6,5'd5,5'd2};
            end
            16: begin
                wordnum = 5;
                word = {5'd14,5'd9,5'd7,5'd5,5'd2};
            end
            17: begin
                wordnum = 8;
                word = {5'd18,5'd5,5'd14,5'd14,5'd9,5'd7,5'd5,5'd2};
            end
            18: begin
                wordnum = 4;
                word = {5'd20,5'd1,5'd15,5'd2};
            end
            19: begin
                wordnum = 4;
                word = {5'd11,5'd15,5'd15,5'd2};
            end
            20: begin
                wordnum = 4;
                word = {5'd8,5'd20,5'd15,5'd2};
            end
            21: begin
                wordnum = 3;
                word = {5'd24,5'd15,5'd2};
            end
            22: begin
                wordnum = 3;
                word = {5'd19,5'd21,5'd2};
            end
            23: begin
                wordnum = 3;
                word = {5'd20,5'd21,5'd2};
            end
            24: begin
                wordnum = 3;
                word = {5'd20,5'd1,5'd3};
            end
            25: begin
                wordnum = 5;
                word = {5'd18,5'd9,5'd1,5'd8,5'd3};
            end
            26: begin
                wordnum = 5;
                word = {5'd11,5'd3,5'd5,5'd8,5'd3};
            end
            27: begin
                wordnum = 5;
                word = {5'd4,5'd12,5'd9,5'd8,5'd3};
            end
            28: begin
                wordnum = 4;
                word = {5'd25,5'd20,5'd9,5'd3};
            end
            29: begin
                wordnum = 6;
                word = {5'd5,5'd5,5'd6,5'd6,5'd15,5'd3};
            end
            30: begin
                wordnum = 6;
                word = {5'd14,5'd13,5'd21,5'd12,5'd15,5'd3};
            end
            31: begin
                wordnum = 8;
                word = {5'd18,5'd5,5'd20,5'd21,5'd16,5'd13,5'd15,5'd3};
            end
            32: begin
                wordnum = 7;
                word = {5'd25,5'd18,5'd20,5'd14,5'd21,5'd15,5'd3};
            end
            33: begin
                wordnum = 6;
                word = {5'd5,5'd19,5'd18,5'd21,5'd15,5'd3};
            end
            34: begin
                wordnum = 5;
                word = {5'd13,5'd1,5'd5,5'd18,5'd3};
            end
            35: begin
                wordnum = 4;
                word = {5'd5,5'd20,5'd1,5'd4};
            end
            36: begin
                wordnum = 3;
                word = {5'd25,5'd1,5'd4};
            end
            37: begin
                wordnum = 6;
                word = {5'd20,5'd18,5'd1,5'd16,5'd5,5'd4};
            end
            38: begin
                wordnum = 10;
                word = {5'd25,5'd20,5'd12,5'd21,5'd3,5'd9,5'd6,5'd6,5'd9,5'd4};
            end
            39: begin
                wordnum = 8;
                word = {5'd18,5'd5,5'd22,5'd15,5'd3,5'd19,5'd9,5'd4};
            end
            40: begin
                wordnum = 8;
                word = {5'd5,5'd3,5'd14,5'd1,5'd20,5'd19,5'd9,5'd4};
            end
            41: begin
                wordnum = 3;
                word = {5'd7,5'd15,5'd4};
            end
            42: begin
                wordnum = 4;
                word = {5'd14,5'd23,5'd15,5'd4};
            end
            43: begin
                wordnum = 8;
                word = {5'd4,5'd1,5'd15,5'd12,5'd14,5'd23,5'd15,5'd4};
            end
            44: begin
                wordnum = 5;
                word = {5'd11,5'd14,5'd9,5'd18,5'd4};
            end
            45: begin
                wordnum = 4;
                word = {5'd13,5'd21,5'd18,5'd4};
            end
            46: begin
                wordnum = 4;
                word = {5'd8,5'd3,5'd1,5'd5};
            end
            47: begin
                wordnum = 4;
                word = {5'd20,5'd9,5'd4,5'd5};
            end
            48: begin
                wordnum = 11;
                word = {5'd25,5'd20,5'd9,5'd3,5'd9,5'd18,5'd20,5'd3,5'd5,5'd12,5'd5};
            end
            49: begin
                wordnum = 7;
                word = {5'd20,5'd14,5'd5,5'd13,5'd5,5'd12,5'd5};
            end
            50: begin
                wordnum = 13;
                word = {5'd20,5'd14,5'd5,5'd13,5'd14,5'd9,5'd1,5'd20,5'd18,5'd5,5'd20,5'd14,5'd5};
            end
            51: begin
                wordnum = 5;
                word = {5'd5,5'd19,5'd1,5'd18,5'd5};
            end
            52: begin
                wordnum = 4;
                word = {5'd14,5'd5,5'd22,5'd5};
            end
            53: begin
                wordnum = 8;
                word = {5'd5,5'd19,5'd9,5'd3,5'd18,5'd5,5'd24,5'd5};
            end
            54: begin
                wordnum = 4;
                word = {5'd12,5'd5,5'd5,5'd6};
            end
            55: begin
                wordnum = 3;
                word = {5'd23,5'd5,5'd6};
            end
            56: begin
                wordnum = 4;
                word = {5'd5,5'd12,5'd9,5'd6};
            end
            57: begin
                wordnum = 5;
                word = {5'd20,5'd19,5'd18,5'd9,5'd6};
            end
            58: begin
                wordnum = 5;
                word = {5'd19,5'd21,5'd3,5'd15,5'd6};
            end
            59: begin
                wordnum = 6;
                word = {5'd23,5'd15,5'd12,5'd12,5'd15,5'd6};
            end
            60: begin
                wordnum = 4;
                word = {5'd4,5'd15,5'd15,5'd6};
            end
            61: begin
                wordnum = 5;
                word = {5'd5,5'd3,5'd18,5'd15,5'd6};
            end
            62: begin
                wordnum = 6;
                word = {5'd20,5'd5,5'd7,5'd18,5'd15,5'd6};
            end
            63: begin
                wordnum = 4;
                word = {5'd18,5'd21,5'd15,5'd6};
            end
            64: begin
                wordnum = 6;
                word = {5'd4,5'd14,5'd5,5'd9,5'd18,5'd6};
            end
            65: begin
                wordnum = 4;
                word = {5'd5,5'd13,5'd1,5'd7};
            end
            66: begin
                wordnum = 4;
                word = {5'd5,5'd22,5'd9,5'd7};
            end
            67: begin
                wordnum = 6;
                word = {5'd7,5'd14,5'd9,5'd22,5'd9,5'd7};
            end
            68: begin
                wordnum = 6;
                word = {5'd12,5'd1,5'd2,5'd15,5'd12,5'd7};
            end
            69: begin
                wordnum = 4;
                word = {5'd20,5'd1,5'd15,5'd7};
            end
            70: begin
                wordnum = 5;
                word = {5'd20,5'd1,5'd5,5'd18,5'd7};
            end
            71: begin
                wordnum = 5;
                word = {5'd25,5'd16,5'd16,5'd1,5'd8};
            end
            72: begin
                wordnum = 4;
                word = {5'd5,5'd22,5'd1,5'd8};
            end
            73: begin
                wordnum = 6;
                word = {5'd7,5'd14,5'd9,5'd22,5'd1,5'd8};
            end
            74: begin
                wordnum = 4;
                word = {5'd5,5'd18,5'd5,5'd8};
            end
            75: begin
                wordnum = 4;
                word = {5'd8,5'd7,5'd9,5'd8};
            end
            76: begin
                wordnum = 4;
                word = {5'd12,5'd12,5'd9,5'd8};
            end
            77: begin
                wordnum = 4;
                word = {5'd4,5'd12,5'd15,5'd8};
            end
            78: begin
                wordnum = 4;
                word = {5'd5,5'd13,5'd15,5'd8};
            end
            79: begin
                wordnum = 4;
                word = {5'd18,5'd21,5'd15,5'd8};
            end
            80: begin
                wordnum = 5;
                word = {5'd5,5'd19,5'd21,5'd15,5'd8};
            end
            81: begin
                wordnum = 3;
                word = {5'd23,5'd15,5'd8};
            end
            82: begin
                wordnum = 3;
                word = {5'd5,5'd3,5'd9};
            end
            83: begin
                wordnum = 7;
                word = {5'd5,5'd4,5'd21,5'd12,5'd3,5'd14,5'd9};
            end
            84: begin
                wordnum = 5;
                word = {5'd20,5'd21,5'd16,5'd14,5'd9};
            end
            85: begin
                wordnum = 6;
                word = {5'd5,5'd4,5'd9,5'd19,5'd14,5'd9};
            end
            86: begin
                wordnum = 13;
                word = {5'd12,5'd1,5'd14,5'd15,5'd9,5'd20,5'd1,5'd14,5'd18,5'd5,5'd20,5'd14,5'd9};
            end
            87: begin
                wordnum = 4;
                word = {5'd15,5'd20,5'd14,5'd9};
            end
            88: begin
                wordnum = 12;
                word = {5'd14,5'd15,5'd9,5'd20,5'd3,5'd21,5'd4,5'd15,5'd18,5'd20,5'd14,5'd9};
            end
            89: begin
                wordnum = 6;
                word = {5'd20,5'd14,5'd5,5'd22,5'd14,5'd9};
            end
            90: begin
                wordnum = 2;
                word = {5'd19,5'd9};
            end
            91: begin
                wordnum = 5;
                word = {5'd18,5'd5,5'd11,5'd15,5'd10};
            end
            92: begin
                wordnum = 5;
                word = {5'd5,5'd3,5'd9,5'd21,5'd10};
            end
            93: begin
                wordnum = 3;
                word = {5'd25,5'd5,5'd11};
            end
            94: begin
                wordnum = 8;
                word = {5'd4,5'd18,5'd1,5'd15,5'd2,5'd25,5'd5,5'd11};
            end
            95: begin
                wordnum = 3;
                word = {5'd4,5'd9,5'd11};
            end
            96: begin
                wordnum = 4;
                word = {5'd12,5'd12,5'd9,5'd11};
            end
            97: begin
                wordnum = 8;
                word = {5'd5,5'd7,5'd1,5'd21,5'd7,5'd14,5'd1,5'd12};
            end
            98: begin
                wordnum = 4;
                word = {5'd4,5'd1,5'd5,5'd12};
            end
            99: begin
                wordnum = 5;
                word = {5'd5,5'd22,5'd1,5'd5,5'd12};
            end
            100: begin
                wordnum = 5;
                word = {5'd14,5'd15,5'd13,5'd5,5'd12};
            end
            101: begin
                wordnum = 4;
                word = {5'd19,5'd19,5'd5,5'd12};
            end
            102: begin
                wordnum = 6;
                word = {5'd18,5'd5,5'd20,5'd20,5'd5,5'd12};
            end
            103: begin
                wordnum = 4;
                word = {5'd5,5'd14,5'd9,5'd12};
            end
            104: begin
                wordnum = 6;
                word = {5'd14,5'd5,5'd20,5'd19,5'd9,5'd12};
            end
            105: begin
                wordnum = 6;
                word = {5'd5,5'd12,5'd20,5'd20,5'd9,5'd12};
            end
            106: begin
                wordnum = 4;
                word = {5'd11,5'd3,5'd15,5'd12};
            end
            107: begin
                wordnum = 4;
                word = {5'd11,5'd15,5'd15,5'd12};
            end
            108: begin
                wordnum = 4;
                word = {5'd5,5'd19,5'd15,5'd12};
            end
            109: begin
                wordnum = 5;
                word = {5'd18,5'd5,5'd19,5'd15,5'd12};
            end
            110: begin
                wordnum = 4;
                word = {5'd19,5'd19,5'd15,5'd12};
            end
            111: begin
                wordnum = 3;
                word = {5'd4,5'd1,5'd13};
            end
            112: begin
                wordnum = 4;
                word = {5'd12,5'd9,5'd1,5'd13};
            end
            113: begin
                wordnum = 3;
                word = {5'd14,5'd1,5'd13};
            end
            114: begin
                wordnum = 3;
                word = {5'd16,5'd1,5'd13};
            end
            115: begin
                wordnum = 6;
                word = {5'd18,5'd5,5'd20,5'd19,5'd1,5'd13};
            end
            116: begin
                wordnum = 6;
                word = {5'd18,5'd5,5'd2,5'd13,5'd5,5'd13};
            end
            117: begin
                wordnum = 4;
                word = {5'd11,5'd12,5'd9,5'd13};
            end
            118: begin
                wordnum = 5;
                word = {5'd19,5'd21,5'd14,5'd9,5'd13};
            end
            119: begin
                wordnum = 6;
                word = {5'd5,5'd20,5'd21,5'd14,5'd9,5'd13};
            end
            120: begin
                wordnum = 7;
                word = {5'd5,5'd11,5'd1,5'd20,5'd19,5'd9,5'd13};
            end
            121: begin
                wordnum = 6;
                word = {5'd25,5'd5,5'd11,5'd14,5'd15,5'd13};
            end
            122: begin
                wordnum = 5;
                word = {5'd8,5'd20,5'd14,5'd15,5'd13};
            end
            123: begin
                wordnum = 4;
                word = {5'd5,5'd18,5'd15,5'd13};
            end
            124: begin
                wordnum = 5;
                word = {5'd5,5'd19,5'd21,5'd15,5'd13};
            end
            125: begin
                wordnum = 5;
                word = {5'd3,5'd9,5'd19,5'd21,5'd13};
            end
            126: begin
                wordnum = 4;
                word = {5'd4,5'd5,5'd5,5'd14};
            end
            127: begin
                wordnum = 5;
                word = {5'd18,5'd5,5'd22,5'd5,5'd14};
            end
            128: begin
                wordnum = 3;
                word = {5'd23,5'd5,5'd14};
            end
            129: begin
                wordnum = 2;
                word = {5'd15,5'd14};
            end
            130: begin
                wordnum = 3;
                word = {5'd20,5'd15,5'd14};
            end
            131: begin
                wordnum = 4;
                word = {5'd5,5'd20,5'd15,5'd14};
            end
            132: begin
                wordnum = 3;
                word = {5'd23,5'd15,5'd14};
            end
            133: begin
                wordnum = 6;
                word = {5'd18,5'd5,5'd2,5'd13,5'd21,5'd14};
            end
            134: begin
                wordnum = 3;
                word = {5'd6,5'd6,5'd15};
            end
            135: begin
                wordnum = 3;
                word = {5'd4,5'd12,5'd15};
            end
            136: begin
                wordnum = 2;
                word = {5'd14,5'd15};
            end
            137: begin
                wordnum = 4;
                word = {5'd5,5'd3,5'd14,5'd15};
            end
            138: begin
                wordnum = 3;
                word = {5'd5,5'd14,5'd15};
            end
            139: begin
                wordnum = 6;
                word = {5'd5,5'd14,5'd9,5'd12,5'd14,5'd15};
            end
            140: begin
                wordnum = 4;
                word = {5'd14,5'd5,5'd16,5'd15};
            end
            141: begin
                wordnum = 7;
                word = {5'd5,5'd20,5'd1,5'd18,5'd5,5'd16,5'd15};
            end
            142: begin
                wordnum = 6;
                word = {5'd20,5'd21,5'd16,5'd20,5'd21,5'd15};
            end
            143: begin
                wordnum = 7;
                word = {5'd5,5'd4,5'd9,5'd19,5'd20,5'd21,5'd15};
            end
            144: begin
                wordnum = 4;
                word = {5'd5,5'd7,5'd1,5'd16};
            end
            145: begin
                wordnum = 4;
                word = {5'd18,5'd9,5'd1,5'd16};
            end
            146: begin
                wordnum = 6;
                word = {5'd20,5'd14,5'd5,5'd18,5'd1,5'd16};
            end
            147: begin
                wordnum = 4;
                word = {5'd11,5'd18,5'd1,5'd16};
            end
            148: begin
                wordnum = 4;
                word = {5'd20,5'd18,5'd1,5'd16};
            end
            149: begin
                wordnum = 6;
                word = {5'd12,5'd9,5'd3,5'd14,5'd5,5'd16};
            end
            150: begin
                wordnum = 6;
                word = {5'd14,5'd15,5'd19,5'd18,5'd5,5'd16};
            end
            151: begin
                wordnum = 5;
                word = {5'd5,5'd14,5'd15,5'd8,5'd16};
            end
            152: begin
                wordnum = 5;
                word = {5'd15,5'd14,5'd1,5'd9,5'd16};
            end
            153: begin
                wordnum = 5;
                word = {5'd5,5'd3,5'd1,5'd12,5'd16};
            end
            154: begin
                wordnum = 4;
                word = {5'd25,5'd1,5'd12,5'd16};
            end
            155: begin
                wordnum = 4;
                word = {5'd11,5'd18,5'd15,5'd16};
            end
            156: begin
                wordnum = 8;
                word = {5'd5,5'd12,5'd2,5'd9,5'd19,5'd19,5'd15,5'd16};
            end
            157: begin
                wordnum = 7;
                word = {5'd13,5'd5,5'd12,5'd2,5'd15,5'd18,5'd16};
            end
            158: begin
                wordnum = 7;
                word = {5'd4,5'd5,5'd5,5'd3,5'd15,5'd18,5'd16};
            end
            159: begin
                wordnum = 7;
                word = {5'd5,5'd3,5'd21,5'd4,5'd15,5'd18,5'd16};
            end
            160: begin
                wordnum = 7;
                word = {5'd13,5'd1,5'd18,5'd7,5'd15,5'd18,5'd16};
            end
            161: begin
                wordnum = 7;
                word = {5'd20,5'd3,5'd5,5'd10,5'd15,5'd18,5'd16};
            end
            162: begin
                wordnum = 3;
                word = {5'd20,5'd21,5'd16};
            end
            163: begin
                wordnum = 8;
                word = {5'd14,5'd15,5'd9,5'd20,5'd19,5'd5,5'd21,5'd17};
            end
            164: begin
                wordnum = 5;
                word = {5'd5,5'd19,5'd9,5'd1,5'd18};
            end
            165: begin
                wordnum = 6;
                word = {5'd13,5'd15,5'd4,5'd14,5'd1,5'd18};
            end
            166: begin
                wordnum = 5;
                word = {5'd8,5'd3,5'd1,5'd5,5'd18};
            end
            167: begin
                wordnum = 4;
                word = {5'd4,5'd1,5'd5,5'd18};
            end
            168: begin
                wordnum = 7;
                word = {5'd7,5'd14,5'd9,5'd4,5'd1,5'd5,5'd18};
            end
            169: begin
                wordnum = 4;
                word = {5'd12,5'd1,5'd5,5'd18};
            end
            170: begin
                wordnum = 7;
                word = {5'd5,5'd22,5'd9,5'd5,5'd3,5'd5,5'd18};
            end
            171: begin
                wordnum = 6;
                word = {5'd5,5'd3,5'd21,5'd4,5'd5,5'd18};
            end
            172: begin
                wordnum = 7;
                word = {5'd8,5'd19,5'd5,5'd18,5'd6,5'd5,5'd18};
            end
            173: begin
                wordnum = 8;
                word = {5'd18,5'd5,5'd2,5'd13,5'd5,5'd13,5'd5,5'd18};
            end
            174: begin
                wordnum = 8;
                word = {5'd8,5'd3,5'd18,5'd1,5'd5,5'd19,5'd5,5'd18};
            end
            175: begin
                wordnum = 4;
                word = {5'd8,5'd3,5'd9,5'd18};
            end
            176: begin
                wordnum = 4;
                word = {5'd13,5'd15,5'd15,5'd18};
            end
            177: begin
                wordnum = 3;
                word = {5'd23,5'd15,5'd18};
            end
            178: begin
                wordnum = 3;
                word = {5'd4,5'd1,5'd19};
            end
            179: begin
                wordnum = 6;
                word = {5'd12,5'd15,5'd15,5'd8,5'd3,5'd19};
            end
            180: begin
                wordnum = 7;
                word = {5'd5,5'd3,5'd14,5'd5,5'd9,5'd3,5'd19};
            end
            181: begin
                wordnum = 5;
                word = {5'd5,5'd18,5'd15,5'd3,5'd19};
            end
            182: begin
                wordnum = 6;
                word = {5'd14,5'd5,5'd5,5'd18,5'd3,5'd19};
            end
            183: begin
                wordnum = 6;
                word = {5'd8,5'd3,5'd18,5'd1,5'd5,5'd19};
            end
            184: begin
                wordnum = 6;
                word = {5'd4,5'd14,5'd15,5'd3,5'd5,5'd19};
            end
            185: begin
                wordnum = 3;
                word = {5'd5,5'd5,5'd19};
            end
            186: begin
                wordnum = 4;
                word = {5'd13,5'd5,5'd5,5'd19};
            end
            187: begin
                wordnum = 4;
                word = {5'd4,5'd14,5'd5,5'd19};
            end
            188: begin
                wordnum = 3;
                word = {5'd20,5'd5,5'd19};
            end
            189: begin
                wordnum = 5;
                word = {5'd20,5'd5,5'd5,5'd8,5'd19};
            end
            190: begin
                wordnum = 4;
                word = {5'd16,5'd9,5'd8,5'd19};
            end
            191: begin
                wordnum = 5;
                word = {5'd20,5'd8,5'd7,5'd9,5'd19};
            end
            192: begin
                wordnum = 4;
                word = {5'd7,5'd14,5'd9,5'd19};
            end
            193: begin
                wordnum = 3;
                word = {5'd20,5'd9,5'd19};
            end
            194: begin
                wordnum = 5;
                word = {5'd20,5'd18,5'd1,5'd13,5'd19};
            end
            195: begin
                wordnum = 2;
                word = {5'd15,5'd19};
            end
            196: begin
                wordnum = 4;
                word = {5'd5,5'd13,5'd15,5'd19};
            end
            197: begin
                wordnum = 5;
                word = {5'd5,5'd3,5'd1,5'd16,5'd19};
            end
            198: begin
                wordnum = 5;
                word = {5'd4,5'd5,5'd5,5'd16,5'd19};
            end
            199: begin
                wordnum = 5;
                word = {5'd4,5'd14,5'd1,5'd20,5'd19};
            end
            200: begin
                wordnum = 4;
                word = {5'd18,5'd1,5'd20,5'd19};
            end
            201: begin
                wordnum = 5;
                word = {5'd20,5'd18,5'd1,5'd20,5'd19};
            end
            202: begin
                wordnum = 5;
                word = {5'd12,5'd12,5'd9,5'd20,5'd19};
            end
            203: begin
                wordnum = 5;
                word = {5'd5,5'd14,5'd15,5'd20,5'd19};
            end
            204: begin
                wordnum = 4;
                word = {5'd16,5'd15,5'd20,5'd19};
            end
            205: begin
                wordnum = 5;
                word = {5'd5,5'd18,5'd15,5'd20,5'd19};
            end
            206: begin
                wordnum = 7;
                word = {5'd20,5'd14,5'd5,5'd4,5'd21,5'd20,5'd19};
            end
            207: begin
                wordnum = 3;
                word = {5'd14,5'd21,5'd19};
            end
            208: begin
                wordnum = 5;
                word = {5'd5,5'd12,5'd2,5'd1,5'd20};
            end
            209: begin
                wordnum = 3;
                word = {5'd1,5'd5,5'd20};
            end
            210: begin
                wordnum = 7;
                word = {5'd18,5'd5,5'd8,5'd3,5'd1,5'd5,5'd20};
            end
            211: begin
                wordnum = 10;
                word = {5'd14,5'd15,5'd9,5'd19,5'd9,5'd22,5'd5,5'd12,5'd5,5'd20};
            end
            212: begin
                wordnum = 4;
                word = {5'd20,5'd1,5'd8,5'd20};
            end
            213: begin
                wordnum = 5;
                word = {5'd11,5'd14,5'd9,5'd8,5'd20};
            end
            214: begin
                wordnum = 5;
                word = {5'd5,5'd19,5'd15,5'd8,5'd20};
            end
            215: begin
                wordnum = 5;
                word = {5'd5,5'd5,5'd18,5'd8,5'd20};
            end
            216: begin
                wordnum = 7;
                word = {5'd8,5'd7,5'd21,5'd15,5'd18,5'd8,5'd20};
            end
            217: begin
                wordnum = 5;
                word = {5'd20,5'd8,5'd7,5'd9,5'd20};
            end
            218: begin
                wordnum = 4;
                word = {5'd5,5'd13,5'd9,5'd20};
            end
            219: begin
                wordnum = 3;
                word = {5'd15,5'd15,5'd20};
            end
            220: begin
                wordnum = 5;
                word = {5'd14,5'd9,5'd1,5'd18,5'd20};
            end
            221: begin
                wordnum = 4;
                word = {5'd5,5'd5,5'd18,5'd20};
            end
            222: begin
                wordnum = 7;
                word = {5'd5,5'd12,5'd2,5'd21,5'd15,5'd18,5'd20};
            end
            223: begin
                wordnum = 4;
                word = {5'd14,5'd18,5'd21,5'd20};
            end
            224: begin
                wordnum = 5;
                word = {5'd5,5'd3,5'd9,5'd23,5'd20};
            end
            225: begin
                wordnum = 3;
                word = {5'd15,5'd23,5'd20};
            end
            226: begin
                wordnum = 4;
                word = {5'd5,5'd16,5'd25,5'd20};
            end
            227: begin
                wordnum = 5;
                word = {5'd18,5'd5,5'd4,5'd14,5'd21};
            end
            228: begin
                wordnum = 10;
                word = {5'd4,5'd14,5'd1,5'd20,5'd19,5'd18,5'd5,5'd4,5'd14,5'd21};
            end
            229: begin
                wordnum = 6;
                word = {5'd4,5'd1,5'd15,5'd12,5'd16,5'd21};
            end
            230: begin
                wordnum = 4;
                word = {5'd14,5'd15,5'd16,5'd21};
            end
            231: begin
                wordnum = 3;
                word = {5'd5,5'd19,5'd21};
            end
            232: begin
                wordnum = 4;
                word = {5'd18,5'd5,5'd19,5'd21};
            end
            233: begin
                wordnum = 5;
                word = {5'd15,5'd5,5'd4,5'd9,5'd22};
            end
            234: begin
                wordnum = 4;
                word = {5'd23,5'd5,5'd9,5'd22};
            end
            235: begin
                wordnum = 4;
                word = {5'd11,5'd12,5'd1,5'd23};
            end
            236: begin
                wordnum = 4;
                word = {5'd20,5'd14,5'd1,5'd23};
            end
            237: begin
                wordnum = 3;
                word = {5'd18,5'd1,5'd23};
            end
            238: begin
                wordnum = 5;
                word = {5'd5,5'd20,5'd19,5'd1,5'd23};
            end
            239: begin
                wordnum = 5;
                word = {5'd8,5'd3,5'd20,5'd1,5'd23};
            end
            240: begin
                wordnum = 2;
                word = {5'd5,5'd23};
            end
            241: begin
                wordnum = 6;
                word = {5'd14,5'd15,5'd16,5'd1,5'd5,5'd23};
            end
            242: begin
                wordnum = 7;
                word = {5'd5,5'd20,5'd9,5'd19,5'd2,5'd5,5'd23};
            end
            243: begin
                wordnum = 6;
                word = {5'd20,5'd8,5'd7,5'd9,5'd5,5'd23};
            end
            244: begin
                wordnum = 4;
                word = {5'd14,5'd5,5'd8,5'd23};
            end
            245: begin
                wordnum = 5;
                word = {5'd5,5'd18,5'd5,5'd8,5'd23};
            end
            246: begin
                wordnum = 5;
                word = {5'd5,5'd20,5'd9,5'd8,5'd23};
            end
            247: begin
                wordnum = 3;
                word = {5'd15,5'd8,5'd23};
            end
            248: begin
                wordnum = 3;
                word = {5'd14,5'd9,5'd23};
            end
            249: begin
                wordnum = 6;
                word = {5'd23,5'd15,5'd4,5'd14,5'd9,5'd23};
            end
            250: begin
                wordnum = 6;
                word = {5'd18,5'd5,5'd4,5'd14,5'd15,5'd23};
            end
            251: begin
                wordnum = 4;
                word = {5'd11,5'd18,5'd15,5'd23};
            end
            252: begin
                wordnum = 7;
                word = {5'd7,5'd14,5'd9,5'd11,5'd18,5'd15,5'd23};
            end
            253: begin
                wordnum = 5;
                word = {5'd4,5'd12,5'd18,5'd15,5'd23};
            end
            254: begin
                wordnum = 5;
                word = {5'd4,5'd12,5'd21,5'd15,5'd23};
            end
            255: begin
                wordnum = 4;
                word = {5'd18,5'd1,5'd5,5'd25};
            end
			default: begin
				wordnum = 0;
				word = 0;
			end
		endcase
	end


endmodule