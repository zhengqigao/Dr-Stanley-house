---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
--Game: Doctor's House - Enhanced Version
--Authors: Ren Yuchen, Gao Zhengqi, Liu Shiwei
--Date: 2018.12
--
--File: Scenes.hs
--Note: initialize scene
--Designers: ALL
--Writers: ALL
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

module Scenes where

import Data_define
 
init_scenes = [  Scene { background = 0, triggers = [0,1,9] }          --主场景0
              , Scene { background = 1, triggers = [2,3,6] }          --拾取小石像处
                          , Scene { background = 2, triggers = [4,95] }           --狗圈2
                          , Scene { background = 6, triggers = [5,11] }           --拾取纸飞机处
                          , Scene { background = 8, triggers = [7,8] }            --拾取小石像放大4
                          , Scene { background = 10, triggers = [10,16,121,122,123,124,125,126,127,128,129,130] } --主场景蓝色密码锁门门放大
                          , Scene { background = 16, triggers = [12,13,14,15] }   --走廊一6
                          , Scene { background = 17, triggers = [17,18] }         --走廊二
                          , Scene { background = 18, triggers = [19,20,21] }      --从走廊三8
                          , Scene { background = 19, triggers = [22,23] }         --黄色门里面的第一个厕所
                          , Scene { background = 20, triggers = [24,25] }         --客厅10
                          , Scene { background = 21, triggers = [26,27,28,29] }   --走廊四
                          , Scene { background = 22, triggers = [30,31,32,33] }   --卧室12
                          , Scene { background = 23, triggers = [35,36] }         --厕所1大图
                          , Scene { background = 26, triggers = [37,38] }         --客厅大图14
                          , Scene { background = 27, triggers = [39,40,41] }      --走廊五
                          , Scene { background = 28, triggers = [42,43,44] }      --餐厅16
                          , Scene { background = 29, triggers = [83,84,86] }      --厨房一
                          , Scene { background = 31, triggers = [45,46] }         --卧室桌面18
                          , Scene { background = 33, triggers = [47,48] }         --卧室床上
                          , Scene { background = 34, triggers = [49,50] }         --浴室20
                          , Scene { background = 35, triggers = [34] }            --小石像大图
                          , Scene { background = 36, triggers = [34,106] }        --纸飞机大图22
                          , Scene { background = 37, triggers = [34] }            --打火机大图
                          , Scene { background = 38, triggers = [34] }            --灰色钥匙大图24
                          , Scene { background = 42, triggers = [53,54,55,56] }   --走廊六
                          , Scene { background = 43, triggers = [57,58] }         --第二个厕所26
                          , Scene { background = 45, triggers = [103,104,105] }   --水杯点开大图
                          , Scene { background = 46, triggers = [61,62] }         --天井28
                          , Scene { background = 48, triggers = [34,109] }        --名片大图
                          , Scene { background = 52, triggers = [34] }            --圆形钥匙大图30
                          , Scene { background = 53, triggers = [51,52] }         --浴室点开大图
                          , Scene { background = 56, triggers = [34] }            --黄绿色钥匙大图32
                          , Scene { background = 57, triggers = [65,66,67] }      --走廊七
                          , Scene { background = 58, triggers = [68,69] }         --杂物间34
                          , Scene { background = 59, triggers = [70,71,72,79] }   --书房
                          , Scene { background = 60, triggers = [59,60] }         --厕所二大图36
                          , Scene { background = 63, triggers = [34] }            --墨绿色钥匙大图
                          , Scene { background = 66, triggers = [63,64] }         --天井点开大图38
                          , Scene { background = 67, triggers = [34] }            --蓝色钥匙大图
                          , Scene { background = 70, triggers = [110,111] }       --二楼卧室(无密码锁和犯人)40
                          , Scene { background = 71, triggers = [101,179] }       --二楼关博士的房间41
                          , Scene { background = 74, triggers = [34] }            --电话线大图42
                          , Scene { background = 76, triggers = [73,74] }         --点开书架大图43
                          , Scene { background = 79, triggers = [34,107] }        --书大图44（除了红色X之外还有一个翻页的trigger）
                          , Scene { background = 80, triggers = [75,76] }         --屋顶
                          , Scene { background = 82, triggers = [77,78] }         --屋顶点开大图46
                          , Scene { background = 85, triggers = [34] }            --橘色钥匙大图
                          , Scene { background = 86, triggers = [34] }            --密室密码锁大图48
                          , Scene { background = 87, triggers = [81,82] }         --二楼阳台
                          , Scene { background = 90, triggers = [34] }            --土黄色钥匙大图50
                          , Scene { background = 91, triggers = [162,163] }       --二楼卧室(有密码锁无犯人)51
                          , Scene { background = 92, triggers = [176] }           --二楼卧室(有密码锁地上有犯人)52
                          , Scene { background = 93, triggers = [34] }            --二楼卧室密码锁53
                          , Scene { background = 94, triggers = [85,87] }         --厨房拿肉的地方54
                          , Scene { background = 96, triggers = [89,90,91,92] }   --厨房拿盘子和酒的地方55
                          , Scene { background = 98, triggers = [34] }            --肉大图56
                          , Scene { background = 100, triggers = [34,93] }        --盘子大图57（盘子大图上有一个放肉的trigger）
                          , Scene { background = 103, triggers = [34] }           --酒大图58
                          , Scene { background = 104, triggers = [98] }           --放了肉之后狗的图片59
                          , Scene { background = 112, triggers = [99,100] }       --放了肉之后点了狗的图片60
                          , Scene { background = 106, triggers = [34] }           --粉色钥匙大图61
                          , Scene { background = 108, triggers = [34,94] }        --肉放在盘子大图62（放了肉的盘子大图上有一个放酒的trigger）
                          , Scene { background = 110, triggers = [34] }           --加了酒的肉放在盘子大图63
                          , Scene { background = 115, triggers = [34] }           --空水杯大图64
                          , Scene { background = 116, triggers = [34] }           --倒了水的杯子大图65
                          , Scene { background = 117, triggers = [34] }           --纸飞机展开大图66
                          , Scene { background = 118, triggers = [34,108] }       --书本翻页一大图67（除了红色X之外还有一个翻页的trigger）
                          , Scene { background = 119, triggers = [34] }           --书本翻页二大图68
                          , Scene { background = 120, triggers = [34] }           --名片背面大图69
                          , Scene { background = 121, triggers = [112,113,114] }  --二楼卧室厕所70
                          , Scene { background = 122, triggers = [115] }          --二楼卧室厕所关灯71
                          , Scene { background = 123, triggers = [118,112,152] }  --二楼卧室厕所拿下镜子72
                          , Scene { background = 124, triggers = [119,154,155,156,157,158,159,160] }                                --二楼卧室厕所插钥匙大图73（每一个钥匙孔都是一个trigger）
                          , Scene { background = 125, triggers = [120,131,132,133,134,135,136,137,138,139,140] }        --二楼卧室厕所密码锁大图74（每一个密码锁按键都是一个trigger）
                          , Scene { background = 126, triggers = [141,142] }                --二楼卧室厕所解开密码锁后小石像凹槽大图75
                          , Scene { background = 128, triggers = [112,144,145] }    --二楼卧室厕所拿下镜子墙上有小石像凹槽无小石像76
                          , Scene { background = 129, triggers = [143] }            --放上小石像凹槽大图77
                          , Scene { background = 130, triggers = [112,147,150] }    --二楼卧室厕所拿下镜子墙上有小石像凹槽78
                          , Scene { background = 131, triggers = [146] }            --二楼卧室厕所拿下镜子墙上无小石像凹槽关灯79
                          , Scene { background = 132, triggers = [148,181] }        --二楼卧室厕所拿下镜子墙上有小石像凹槽关灯80
                          , Scene { background = 133, triggers = [153] }            --二楼卧室厕所关灯81
                          , Scene { background = 130, triggers = [161] }            --二楼卧室厕所拿下镜子墙上有小石像凹槽82
                          , Scene { background = 141, triggers = [164,165,166,167,168,169,170,171,172,173,174] }        --暗门密码锁大图83
                          , Scene { background = 142, triggers = [187] }                        --秘密文件84
                          , Scene { background = 145, triggers = [34 ] }            --万能钥匙大图85
                          , Scene { background = 146, triggers = [182] }            --查看彩虹大图86
                          , Scene { background = 148, triggers = [183,184] }        --游戏开始界面87
                          , Scene { background = 149, triggers = [185] }            --游戏剧情说明 88
                          , Scene { background = 150, triggers = [186] }            --游戏成功 89
                          , Scene { background = 151, triggers = [186] }            --游戏失败 90
                          , Scene { background = 152, triggers = [34] }            --record successful 91
                          , Scene { background = 153, triggers = [34] }            --record fail 92
             ]
