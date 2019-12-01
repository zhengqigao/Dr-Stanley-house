---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
--Game: Doctor's House - Enhanced Version
--Authors: Ren Yuchen, Gao Zhengqi, Liu Shiwei
--Date: 2018.12
--
--File: Images_pos.hs
--Note: initialize images position
--Designers: ALL
--Writers: ALL
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

module Images_pos where

import Data_define
import SDL.Vect
import Foreign.C.Types
import Control.Monad

all_images_pos::[Maybe (Point V2 CInt)]

all_images_pos = [ Just (P (V2 0 0)),                  --0 
                                   Just (P (V2 0 0)),        --1 
                                   Just (P (V2 0 0)),        --2 
                                   Just (P (V2 771 0)),      --3 
                                   Just (P (V2 0 0)),        --4 
                                   Just (P (V2 0 579)),      --5 
                                   Just (P (V2 0 0)),        --6 
                                   Just (P (V2 0 0)),        --7 
                                   Just (P (V2 0 0)),        --8 
                                   Just (P (V2 343 295)),    --9 
                                   Just (P (V2 0 0)),        --10 
                                   Just (P (V2 0 0)),        --11 
                                   Just (P (V2 0 0)),        --12 
                                   Just (P (V2 203 329)),    --13 
                                   Just (P (V2 561 487)),    --14 
                                   Just (P (V2 0 0)),        --15 
                                   Just (P (V2 0 0)),        --16 
                                   Just (P (V2 0 0)),        --17 
                                   Just (P (V2 0 0)),        --18 
                                   Just (P (V2 0 0)),        --19 
                                   Just (P (V2 0 0)),        --20 
                                   Just (P (V2 0 0)),        --21 
                                   Just (P (V2 0 0)),        --22 
                                   Just (P (V2 0 0)),        --23 
                                   Just (P (V2 151 204)),    --24 
                                   Just (P (V2 301 441)),    --25 
                                   Just (P (V2 0 0)),        --26 
                                   Just (P (V2 0 0)),        --27 
                                   Just (P (V2 0 0)),        --28 
                                   Just (P (V2 0 0)),        --29 
                                   Just (P (V2 374 326)),    --30 
                                   Just (P (V2 0 0)),        --31 
                                   Just (P (V2 653 512)),    --32 
                                   Just (P (V2 0 0)),        --33 
                                   Just (P (V2 0 0)),        --34 
                                   Just (P (V2 150 100)),    --35 
                                   Just (P (V2 150 100)),    --36 
                                   Just (P (V2 150 100)),    --37 
                                   Just (P (V2 150 100)),    --38 
                                   Just (P (V2 0 0)),        --39 
                                   Just (P (V2 361 208)),    --40 
                                   Just (P (V2 263 163)),    --41 
                                   Just (P (V2 0 0)),        --42 
                                   Just (P (V2 0 0)),        --43 
                                   Just (P (V2 0 0)),        --44 
                                   Just (P (V2 0 0)),        --45 
                                   Just (P (V2 0 0)),        --46 
                                   Just (P (V2 0 0)),        --47 
                                   Just (P (V2 150 100)),    --48 
                                   Just (P (V2 0 312)),      --49 
                                   Just (P (V2 246 323)),    --50 
                                   Just (P (V2 246 323)),    --51 
                                   Just (P (V2 150 100)),    --52 
                                   Just (P (V2 0 0)),        --53 
                                   Just (P (V2 384 229)),    --54 
                                   Just (P (V2 384 229)),    --55 
                                   Just (P (V2 150 100)),    --56 
                                   Just (P (V2 0 0)),        --57 
                                   Just (P (V2 0 0)),        --58 
                                   Just (P (V2 0 0)),        --59 
                                   Just (P (V2 0 0)),        --60 
                                   Just (P (V2 152 302)),    --61 
                                   Just (P (V2 0 0)),        --62 
                                   Just (P (V2 150 100)),    --63 
                                   Just (P (V2 291 207)),    --64 
                                   Just (P (V2 95 320)),     --65 
                                   Just (P (V2 0 0)),        --66 
                                   Just (P (V2 150 100)),    --67 
                                   Just (P (V2 0 0)),        --68 
                                   Just (P (V2 192 234)),    --69 
                                   Just (P (V2 0 0)),        --70 
                                   Just (P (V2 0 0)),        --71 
                                   Just (P (V2 44 190)),     --72 
                                   Just (P (V2 0 0)),        --73 
                                   Just (P (V2 150 100)),    --74 
                                   Just (P (V2 179 178)),    --75 
                                   Just (P (V2 0 0)),        --76 
                                   Just (P (V2 317 190)),    --77 
                                   Just (P (V2 0 0)),        --78 
                                   Just (P (V2 150 100)),    --79 
                                   Just (P (V2 0 0)),        --80 
                                   Just (P (V2 433 195)),    --81 
                                   Just (P (V2 0 0)),        --82 
                                   Just (P (V2 455 330)),    --83 
                                   Just (P (V2 0 0)),        --84 
                                   Just (P (V2 150 100)),    --85 
                                   Just (P (V2 0 0)),        --86 
                                   Just (P (V2 0 0)),        --87 
                                   Just (P (V2 310 299)),    --88 
                                   Just (P (V2 0 0)),        --89 
                                   Just (P (V2 150 100)),    --90 
                                   Just (P (V2 0 0)),        --91 
                                   Just (P (V2 0 0)),        --92 
                                   Just (P (V2 0 0)),        --93 
                                   Just (P (V2 0 0)),        --94 
                                   Just (P (V2 0 0)),        --95 
                                   Just (P (V2 0 0)),        --96 
                                   Just (P (V2 0 0)),        --97 
                                   Just (P (V2 150 100)),    --98 
                                   Just (P (V2 0 0)),        --99 
                                   Just (P (V2 150 100)),    --100 
                                   Just (P (V2 36 506)),     --101 
                                   Just (P (V2 0 0)),        --102 
                                   Just (P (V2 150 100)),    --103 
                                   Just (P (V2 0 0)),        --104 
                                   Just (P (V2 0 0)),        --105 
                                   Just (P (V2 150 100)),    --106 
                                   Just (P (V2 0 0)),        --107 
                                   Just (P (V2 150 100)),    --108 
                                   Just (P (V2 0 0)),        --109 
                                   Just (P (V2 150 100)),    --110 
                                   Just (P (V2 472 407)),    --111 
                                   Just (P (V2 0 0)),        --112 
                                   Just (P (V2 0 0)),        --113 
                                   Just (P (V2 0 0)),        --114 
                                   Just (P (V2 150 100)),    --115 
                                   Just (P (V2 150 100)),    --116 
                                   Just (P (V2 150 100)),    --117 
                                   Just (P (V2 150 100)),    --118 
                                   Just (P (V2 150 100)),    --119 
                                   Just (P (V2 150 100)),    --120 
                                   Just (P (V2 0 0)),        --121 
                                   Just (P (V2 0 0)),        --122 
                                   Just (P (V2 0 0)),        --123 
                                   Just (P (V2 0 0)),        --124 
                                   Just (P (V2 0 0)),        --125 
                                   Just (P (V2 0 0)),        --126 
                                   Just (P (V2 478 250)),    --127 
                                   Just (P (V2 0 0)),        --128 
                                   Just (P (V2 0 0)),        --129 
                                   Just (P (V2 0 0)),        --130 
                                   Just (P (V2 0 0)),        --131 
                                   Just (P (V2 0 0)),        --132 
                                   Just (P (V2 0 0)),        --133 
                                   Just (P (V2 0 0)),        --134 
                                   Just (P (V2 0 0)),        --135 
                                   Just (P (V2 0 0)),        --136 
                                   Just (P (V2 0 0)),        --137 
                                   Just (P (V2 0 0)),        --138 
                                   Just (P (V2 0 0)),        --139 
                                   Just (P (V2 0 0)),        --140 
                                   Just (P (V2 0 0)),        --141 
                                   Just (P (V2 0 0)),        --142 
                                   Just (P (V2 430 436)),    --143 
                                   Just (P (V2 0 0)),        --144 
                                   Just (P (V2 150 100)),    --145 
                                   Just (P (V2 0 0)),        --146 
                                   Just (P (V2 374 326)),    --147 
                                   Just (P (V2 0 0)),        --148 
                                   Just (P (V2 0 0)),        --149 
                                   Just (P (V2 0 0)),        --150 
                                   Just (P (V2 0 0)),        --151 
                                   Just (P (V2 150 100)),    --35 
                                   Just (P (V2 150 100))    --35 
                                 ]
