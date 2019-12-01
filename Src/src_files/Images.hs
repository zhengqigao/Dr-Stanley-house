---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
--Game: Doctor's House - Enhanced Version
--Authors: Ren Yuchen, Gao Zhengqi, Liu Shiwei
--Date: 2018.12
--
--File: Images.hs
--Note: initialize image files
--Designers: ALL
--Writers: ALL
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

module Images where

import qualified SDL

getDataFileName :: FilePath -> IO FilePath
getDataFileName = return

load_file =   do
        x1 <- getDataFileName "E/1/1/0.bmp" >>= SDL.loadBMP
        x2 <- getDataFileName "E/1/1/1_2.bmp" >>= SDL.loadBMP
        x3 <- getDataFileName "E/1/1/3.bmp" >>= SDL.loadBMP
        x4 <- getDataFileName "E/2/4.bmp" >>= SDL.loadBMP
        x5 <- getDataFileName "E/2/5.bmp" >>= SDL.loadBMP
        x6 <- getDataFileName "E/2/6.bmp" >>= SDL.loadBMP
        x7 <- getDataFileName "E/1/1/4_2.bmp" >>= SDL.loadBMP
        x8 <- getDataFileName "E/1/1/4_1.bmp" >>= SDL.loadBMP
        x9 <- getDataFileName "E/1/1/2_1.bmp" >>= SDL.loadBMP
        x10 <- getDataFileName "E/1/1/2_2.bmp" >>= SDL.loadBMP
        x11 <- getDataFileName "E/1/1/7_1.bmp" >>= SDL.loadBMP
        x12 <- getDataFileName "E/1/1/1_2.bmp" >>= SDL.loadBMP
        x13 <- getDataFileName "E/2/1/21.bmp" >>= SDL.loadBMP
        x14 <- getDataFileName "E/1/1/1_1.bmp" >>= SDL.loadBMP
        x15 <- getDataFileName "E/1/1/4_1.bmp" >>= SDL.loadBMP
        x16 <- getDataFileName "E/2/1/5.bmp" >>= SDL.loadBMP
        x17 <- getDataFileName "E/1/4/1.bmp" >>= SDL.loadBMP
        x18 <- getDataFileName "E/1/4/2.bmp" >>= SDL.loadBMP
        x19 <- getDataFileName "E/1/4/3.bmp" >>= SDL.loadBMP
        x20 <- getDataFileName "E/1/2/1_2.bmp" >>= SDL.loadBMP
        x21 <- getDataFileName "E/1/2/3_2.bmp" >>= SDL.loadBMP
        x22 <- getDataFileName "E/1/4/4.bmp" >>= SDL.loadBMP
        x23 <- getDataFileName "E/1/3/1_4.bmp" >>= SDL.loadBMP
        x24 <- getDataFileName "E/1/2/2_2.bmp" >>= SDL.loadBMP
        x25 <- getDataFileName "E/1/2/1_1.bmp" >>= SDL.loadBMP
        x26 <- getDataFileName "E/1/2/3_1.bmp" >>= SDL.loadBMP
        x27 <- getDataFileName "E/1/2/4_2.bmp" >>= SDL.loadBMP
        x28 <- getDataFileName "E/1/4/5.bmp" >>= SDL.loadBMP
        x29 <- getDataFileName "E/1/2/18_1.bmp" >>= SDL.loadBMP
        x30 <- getDataFileName "E/1/5/1.bmp" >>= SDL.loadBMP
        x31 <- getDataFileName "E/1/3/1_2.bmp" >>= SDL.loadBMP
        x32 <- getDataFileName "E/1/3/3_1.bmp" >>= SDL.loadBMP
        x33 <- getDataFileName "E/1/3/1_3.bmp" >>= SDL.loadBMP
        x34 <- getDataFileName "E/1/3/2_1.bmp" >>= SDL.loadBMP
        x35 <- getDataFileName "E/1/2/7_1.bmp" >>= SDL.loadBMP
        x36 <- getDataFileName "E/3/0.bmp" >>= SDL.loadBMP
        x37 <- getDataFileName "E/3/1.bmp" >>= SDL.loadBMP
        x38 <- getDataFileName "E/3/13.bmp" >>= SDL.loadBMP
        x39 <- getDataFileName "E/3/5.bmp" >>= SDL.loadBMP
        x40 <- getDataFileName "E/2/1/4.bmp" >>= SDL.loadBMP
        x41 <- getDataFileName "E/1/2/4_1.bmp" >>= SDL.loadBMP
        x42 <- getDataFileName "E/1/2/2_1.bmp" >>= SDL.loadBMP
        x43 <- getDataFileName "E/1/4/6.bmp" >>= SDL.loadBMP
        x44 <- getDataFileName "E/1/2/5_2.bmp" >>= SDL.loadBMP
        x45 <- getDataFileName "E/2/1/1.bmp" >>= SDL.loadBMP
        x46 <- getDataFileName "E/1/2/18_2.bmp" >>= SDL.loadBMP
        x47 <- getDataFileName "E/1/2/9_2.bmp" >>= SDL.loadBMP
        x48 <- getDataFileName "E/2/1/23.bmp" >>= SDL.loadBMP
        x49 <- getDataFileName "E/3/11.bmp" >>= SDL.loadBMP
        x50 <- getDataFileName "E/1/3/3_2.bmp" >>= SDL.loadBMP
        x51 <- getDataFileName "E/1/3/2_2.bmp" >>= SDL.loadBMP
        x52 <- getDataFileName "E/2/1/6.bmp" >>= SDL.loadBMP
        x53 <- getDataFileName "E/3/10.bmp" >>= SDL.loadBMP
        x54 <- getDataFileName "E/1/2/8_2.bmp" >>= SDL.loadBMP
        x55 <- getDataFileName "E/1/2/8_1.bmp" >>= SDL.loadBMP
        x56 <- getDataFileName "E/2/1/7.bmp" >>= SDL.loadBMP
        x57 <- getDataFileName "E/3/8.bmp" >>= SDL.loadBMP
        x58 <- getDataFileName "E/1/4/7.bmp" >>= SDL.loadBMP
        x59 <- getDataFileName "E/1/2/17_2.bmp" >>= SDL.loadBMP
        x60 <- getDataFileName "E/1/2/11_2.bmp" >>= SDL.loadBMP
        x61 <- getDataFileName "E/1/2/6_2.bmp" >>= SDL.loadBMP
        x62 <- getDataFileName "E/1/2/5_1.bmp" >>= SDL.loadBMP
        x63 <- getDataFileName "E/2/1/3.bmp" >>= SDL.loadBMP
        x64 <- getDataFileName "E/3/7.bmp" >>= SDL.loadBMP
        x65 <- getDataFileName "E/1/2/6_1.bmp" >>= SDL.loadBMP
        x66 <- getDataFileName "E/1/2/9_1.bmp" >>= SDL.loadBMP
        x67 <- getDataFileName "E/1/2/10_2.bmp" >>= SDL.loadBMP
        x68 <- getDataFileName "E/3/6.bmp" >>= SDL.loadBMP
        x69 <- getDataFileName "E/2/1/16.bmp" >>= SDL.loadBMP
        x70 <- getDataFileName "E/1/2/10_1.bmp" >>= SDL.loadBMP
        x71 <- getDataFileName "E/1/7/1.bmp" >>= SDL.loadBMP
        x72 <- getDataFileName "E/1/7/5.bmp" >>= SDL.loadBMP
        x73 <- getDataFileName "E/1/2/17_1.bmp" >>= SDL.loadBMP
        x74 <- getDataFileName "E/2/1/20.bmp" >>= SDL.loadBMP
        x75 <- getDataFileName "E/3/23.bmp" >>= SDL.loadBMP
        x76 <- getDataFileName "E/1/2/11_1.bmp" >>= SDL.loadBMP
        x77 <- getDataFileName "E/1/2/12_2.bmp" >>= SDL.loadBMP
        x78 <- getDataFileName "E/1/2/12_1.bmp" >>= SDL.loadBMP
        x79 <- getDataFileName "E/2/1/17.bmp" >>= SDL.loadBMP
        x80 <- getDataFileName "E/3/19.bmp" >>= SDL.loadBMP
        x81 <- getDataFileName "E/1/2/13_2.bmp" >>= SDL.loadBMP
        x82 <- getDataFileName "E/1/2/13_1.bmp" >>= SDL.loadBMP
        x83 <- getDataFileName "E/1/2/14_2.bmp" >>= SDL.loadBMP
        x84 <- getDataFileName "E/1/2/14_1.bmp" >>= SDL.loadBMP
        x85 <- getDataFileName "E/2/1/18.bmp" >>= SDL.loadBMP
        x86 <- getDataFileName "E/3/4.bmp" >>= SDL.loadBMP
        x87 <- getDataFileName "E/1/7/4.bmp" >>= SDL.loadBMP
        x88 <- getDataFileName "E/1/2/15_2.bmp" >>= SDL.loadBMP
        x89 <- getDataFileName "E/1/2/15_1.bmp" >>= SDL.loadBMP
        x90 <- getDataFileName "E/2/1/19.bmp" >>= SDL.loadBMP
        x91 <- getDataFileName "E/3/9.bmp" >>= SDL.loadBMP
        x92 <- getDataFileName "E/1/7/3.bmp" >>= SDL.loadBMP
        x93 <- getDataFileName "E/1/7/2.bmp" >>= SDL.loadBMP
        x94 <- getDataFileName "E/1/7/4.bmp" >>= SDL.loadBMP
        x95 <- getDataFileName "E/1/5/2_2.bmp" >>= SDL.loadBMP
        x96 <- getDataFileName "E/1/5/2_3.bmp" >>= SDL.loadBMP
        x97 <- getDataFileName "E/1/5/3_1.bmp" >>= SDL.loadBMP
        x98 <- getDataFileName "E/2/1/8.bmp" >>= SDL.loadBMP
        x99 <- getDataFileName "E/3/16.bmp" >>= SDL.loadBMP
        x100 <- getDataFileName "E/2/1/9.bmp" >>= SDL.loadBMP
        x101 <- getDataFileName "E/3/15.bmp" >>= SDL.loadBMP
        x102 <- getDataFileName "E/1/5/3_3.bmp" >>= SDL.loadBMP
        x103 <- getDataFileName "E/2/1/10.bmp" >>= SDL.loadBMP
        x104 <- getDataFileName "E/3/14.bmp" >>= SDL.loadBMP
        x105 <- getDataFileName "E/1/1/5.bmp" >>= SDL.loadBMP
        x106 <- getDataFileName "E/2/1/13.bmp" >>= SDL.loadBMP
        x107 <- getDataFileName "E/3/3.bmp" >>= SDL.loadBMP
        x108 <- getDataFileName "E/2/1/11.bmp" >>= SDL.loadBMP
        x109 <- getDataFileName "E/3/17.bmp" >>= SDL.loadBMP
        x110 <- getDataFileName "E/2/1/12.bmp" >>= SDL.loadBMP
        x111 <- getDataFileName "E/3/18.bmp" >>= SDL.loadBMP
        x112 <- getDataFileName "E/1/1/6_2.bmp" >>= SDL.loadBMP
        x113 <- getDataFileName "E/1/1/6_1.bmp" >>= SDL.loadBMP
        x114 <- getDataFileName "E/2/1/14.bmp" >>= SDL.loadBMP
        x115 <- getDataFileName "E/2/1/15.bmp" >>= SDL.loadBMP
        x116 <- getDataFileName "E/3/24.bmp" >>= SDL.loadBMP
        x117 <- getDataFileName "E/3/25.bmp" >>= SDL.loadBMP
        x118 <- getDataFileName "E/3/2.bmp" >>= SDL.loadBMP
        x119 <- getDataFileName "E/3/21.bmp" >>= SDL.loadBMP
        x120 <- getDataFileName "E/3/22.bmp" >>= SDL.loadBMP
        x121 <- getDataFileName "E/3/12.bmp" >>= SDL.loadBMP
        x122 <- getDataFileName "E/1/6/1.bmp" >>= SDL.loadBMP
        x123 <- getDataFileName "E/1/6/2.bmp" >>= SDL.loadBMP
        x124 <- getDataFileName "E/1/6/3.bmp" >>= SDL.loadBMP
        x125 <- getDataFileName "E/1/6/11_1.bmp" >>= SDL.loadBMP
        x126 <- getDataFileName "E/1/6/5.bmp" >>= SDL.loadBMP
        x127 <- getDataFileName "E/1/6/6.bmp" >>= SDL.loadBMP
        x128 <- getDataFileName "E/1/1/7_2.bmp" >>= SDL.loadBMP
        x129 <- getDataFileName "E/1/6/7.bmp" >>= SDL.loadBMP
        x130 <- getDataFileName "E/1/6/9.bmp" >>= SDL.loadBMP
        x131 <- getDataFileName "E/1/6/10.bmp" >>= SDL.loadBMP
        x132 <- getDataFileName "E/1/6/8.bmp" >>= SDL.loadBMP
        x133 <- getDataFileName "E/1/6/12.bmp" >>= SDL.loadBMP
        x134 <- getDataFileName "E/1/6/4.bmp" >>= SDL.loadBMP
        x135 <- getDataFileName "E/1/6/14.bmp" >>= SDL.loadBMP
        x136 <- getDataFileName "E/1/6/15.bmp" >>= SDL.loadBMP
        x137 <- getDataFileName "E/1/6/16.bmp" >>= SDL.loadBMP
        x138 <- getDataFileName "E/1/6/17.bmp" >>= SDL.loadBMP
        x139 <- getDataFileName "E/1/6/18.bmp" >>= SDL.loadBMP
        x140 <- getDataFileName "E/1/6/19.bmp" >>= SDL.loadBMP
        x141 <- getDataFileName "E/1/6/20.bmp" >>= SDL.loadBMP
        x142 <- getDataFileName "E/1/7/4.bmp" >>= SDL.loadBMP
        x143 <- getDataFileName "E/1/7/6.bmp" >>= SDL.loadBMP
        x144 <- getDataFileName "E/1/7/7.bmp" >>= SDL.loadBMP
        x145 <- getDataFileName "E/1/7/8.bmp" >>= SDL.loadBMP
        x146 <- getDataFileName "E/1/7/9.bmp" >>= SDL.loadBMP
        x147 <- getDataFileName "E/1/6/13.bmp" >>= SDL.loadBMP
        x148 <- getDataFileName "E/1/3/3_3.bmp" >>= SDL.loadBMP
        x149 <- getDataFileName "E/4/1.bmp" >>= SDL.loadBMP
        x150 <- getDataFileName "E/4/2.bmp" >>= SDL.loadBMP
        x151 <- getDataFileName "E/4/3.bmp" >>= SDL.loadBMP
        x152 <- getDataFileName "E/4/4.bmp" >>= SDL.loadBMP
        x153 <- getDataFileName "E/3/27.bmp" >>= SDL.loadBMP
        x154 <- getDataFileName "E/3/28.bmp" >>= SDL.loadBMP
        let all_images_file=x1:x2:x3:x4:x5:x6:x7:x8:x9:x10:x11:x12:x13:x14:x15:x16:x17:x18:x19:x20:x21:x22:x23:x24:x25:x26:x27:x28:x29:x30:x31:x32:x33:x34:x35:x36:x37:x38:x39:x40:x41:x42:x43:x44:x45:x46:x47:x48:x49:x50:x51:x52:x53:x54:x55:x56:x57:x58:x59:x60:x61:x62:x63:x64:x65:x66:x67:x68:x69:x70:x71:x72:x73:x74:x75:x76:x77:x78:x79:x80:x81:x82:x83:x84:x85:x86:x87:x88:x89:x90:x91:x92:x93:x94:x95:x96:x97:x98:x99:x100:x101:x102:x103:x104:x105:x106:x107:x108:x109:x110:x111:x112:x113:x114:x115:x116:x117:x118:x119:x120:x121:x122:x123:x124:x125:x126:x127:x128:x129:x130:x131:x132:x133:x134:x135:x136:x137:x138:x139:x140:x141:x142:x143:x144:x145:x146:x147:x148:x149:x150:x151:x152:x153:x154:[]
        return all_images_file
