---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
--Game: Doctor's House - Enhanced Version
--Authors: Ren Yuchen, Gao Zhengqi, Liu Shiwei
--Date: 2018.12
--
--File: Item_functions.hs
--Note: define item bar functions
--Designers: Ren Yuchen
--Writers: Ren Yuchen && Gao Zhengqi
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

module Item_functions where

import Data_define
import SDL.Vect
import Foreign.C.Types
import Items


--click magnifier
event_magnifier :: Interface -> Interface
event_magnifier interface = if elem (main_scene interface) [87, 88, 89, 90]
                            then interface
                            else interface { dialogue = ((possessed_items interface) !! (selected_item interface)) + 26
                                           , current_scene = item_scene $ all_items !! ((possessed_items interface) !! (selected_item interface)) }
                            

--click turn_page_up
event_turnpageup :: Interface -> Interface
event_turnpageup interface = interface { showed_first_item = (showed_first_item interface) - 1 }


--click turn_page_down
event_turnpagedown :: Interface -> Interface
event_turnpagedown interface = interface { showed_first_item = (showed_first_item interface) + 1 }


--click item-1
event_item1 :: Interface -> Interface
event_item1 interface = interface { selected_item = (showed_first_item interface) }


--click item-2
event_item2 :: Interface -> Interface
event_item2 interface = interface { selected_item = (showed_first_item interface) + 1 }


--click item-3
event_item3 :: Interface -> Interface
event_item3 interface = interface { selected_item = (showed_first_item interface) + 2 }


--click item-4
event_item4 :: Interface -> Interface
event_item4 interface = interface { selected_item = (showed_first_item interface) + 3 }


--click item-5
event_item5 :: Interface -> Interface
event_item5 interface = interface { selected_item = (showed_first_item interface) + 4 }
