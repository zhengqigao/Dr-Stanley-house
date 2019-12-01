---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
--Game: Doctor's House - Enhanced Version
--Authors: Ren Yuchen, Gao Zhengqi, Liu Shiwei
--Date: 2018.12
--
--File: Interface.hs
--Note: initialize Interface
--Designers: ALL
--Writers: ALL
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

module Interface where

import SDL.Vect
import Foreign.C.Types
import qualified SDL
import qualified SDL.Font
import Data_define


---------------------------------------------------------------------------------------------------------------------------------------
--define screen
---------------------------------------------------------------------------------------------------------------------------------------

screenWidth, screenHeight :: CInt
(screenWidth, screenHeight) = (834, 611)


---------------------------------------------------------------------------------------------------------------------------------------
--initialize interface
---------------------------------------------------------------------------------------------------------------------------------------

init_interface = Interface {  dialogue = -1
                            , possessed_items = []
                            , selected_item = -1
                            , showed_first_item = -1
                            , main_scene = 87
                            , current_scene = 87
                           }


---------------------------------------------------------------------------------------------------------------------------------------
--define interface composition
---------------------------------------------------------------------------------------------------------------------------------------

ra_magnifier      = Rect_area {ra_vertex = (P (V2 775 391)), ra_size = V2 55 50} 
ra_turn_page_up   = Rect_area {ra_vertex = (P (V2 771 355)), ra_size = V2 30 30} 
ra_turn_page_down = Rect_area {ra_vertex = (P (V2 802 355)), ra_size = V2 30 30}
ra_item1          = Rect_area {ra_vertex = (P (V2 775 35)) , ra_size = V2 55 55} 
ra_item2          = Rect_area {ra_vertex = (P (V2 775 98)) , ra_size = V2 55 55} 
ra_item3          = Rect_area {ra_vertex = (P (V2 775 161)), ra_size = V2 55 55} 
ra_item4          = Rect_area {ra_vertex = (P (V2 775 224)), ra_size = V2 55 55} 
ra_item5          = Rect_area {ra_vertex = (P (V2 775 287)), ra_size = V2 55 55} 
ra_record         = Rect_area {ra_vertex = (P (V2 775 451)), ra_size = V2 55 50}
ra_menu           = Rect_area {ra_vertex = (P (V2 775 511)), ra_size = V2 55 50}   
ra_reload         = Rect_area {ra_vertex = (P (V2 86 312)), ra_size = V2 254 45}

iTEM_BOX_IMAGE_INDEX :: Int
iTEM_BOX_IMAGE_INDEX = 4
iTEM_BOX_IMAGE_X1 :: CInt
iTEM_BOX_IMAGE_X1 = 771  
iTEM_BOX_IMAGE_Y1 :: CInt
iTEM_BOX_IMAGE_Y1 = 31
iTEM_BOX_HEIGHT :: CInt
iTEM_BOX_HEIGHT = 64 
iTEM_X1 :: CInt
iTEM_X1 = 774 
iTEM1_Y1 :: CInt
iTEM1_Y1 = 35 


---------------------------------------------------------------------------------------------------------------------------------------
--define text
---------------------------------------------------------------------------------------------------------------------------------------

red :: SDL.Font.Color
red = SDL.V4 255 255 255 0
       
