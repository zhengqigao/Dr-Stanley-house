---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
--Game: Doctor's House - Enhanced Version
--Authors: Ren Yuchen, Gao Zhengqi, Liu Shiwei
--Date: 2018.12
--
--File: Items.hs
--Note: initialize items
--Designers: ALL
--Writers: ALL
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

module Items where

import Data_define

all_items = [ Item {item_picture = 12, item_scene = 21, trigger_picture = -1},     --小石像0 
              Item {item_picture = 15, item_scene = 22, trigger_picture = -1},     --纸飞机 
              Item {item_picture = 44, item_scene = 23, trigger_picture = -1},     --打火机2 
              Item {item_picture = 39, item_scene = 24, trigger_picture = 138},    --灰色钥匙  
              Item {item_picture = 47, item_scene = 29, trigger_picture = -1},     --名片4 
              Item {item_picture = 51, item_scene = 30, trigger_picture = -1},     --圆形钥匙 
              Item {item_picture = 55, item_scene = 32, trigger_picture = 137},    --黄绿色钥匙6 
              Item {item_picture = 62, item_scene = 37, trigger_picture = 136},    --墨绿色钥匙 
              Item {item_picture = 68, item_scene = 39, trigger_picture = 139},    --蓝色钥匙8 
              Item {item_picture = 73, item_scene = 42, trigger_picture = -1},     --电话线 
              Item {item_picture = 78, item_scene = 44, trigger_picture = -1},     --书本10 
              Item {item_picture = 84, item_scene = 47, trigger_picture = 134},    --橘色钥匙11 
              Item {item_picture = 89, item_scene = 50, trigger_picture = 135},    --土黄色钥匙12 
              Item {item_picture = 97, item_scene = 56, trigger_picture = -1},     --肉13 
              Item {item_picture = 99, item_scene = 57, trigger_picture = -1},     --盘子14 
              Item {item_picture = 102, item_scene = 58, trigger_picture = -1},    --酒15 
              Item {item_picture = 105, item_scene = 61, trigger_picture = 140},   --粉色钥匙16 
              Item {item_picture = 107, item_scene = 62, trigger_picture = -1},    --肉放在盘子上17 
              Item {item_picture = 109, item_scene = 63, trigger_picture = -1},    --加了酒的肉放在盘子上18 
              Item {item_picture = 113, item_scene = 64, trigger_picture = -1},    --空水杯19 
              Item {item_picture = 114, item_scene = 65, trigger_picture = -1},    --有水水杯20 
              Item {item_picture = 144, item_scene = 85, trigger_picture = -1}     --万能钥匙21 
                        ]
