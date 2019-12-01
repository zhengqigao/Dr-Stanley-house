---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
--Game: Doctor's House - Enhanced Version
--Authors: Ren Yuchen, Gao Zhengqi, Liu Shiwei
--Date: 2018.12
--
--File: Auxiliary_functions.hs
--Note: define auxiliary functions
--Designers: Ren Yuchen, Liu Shiwei
--Writers: Ren Yuchen, Liu Shiwei
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

module Auxiliary_functions where

import Data_define
import Foreign.C.Types
import SDL.Vect


--get scene's all images
get_scene_images :: Int -> [Scene] -> [Trigger] -> [Int]
get_scene_images current_scene_index all_scenes all_triggers = cur_triggers_images ++ (tolist (background cur_scene))    --triggers' images + scene image
     where cur_triggers_images = filter (>= 0) (map picture cur_triggers) 
           cur_triggers = [all_triggers !! index | index <- (triggers cur_scene)]
           cur_scene = all_scenes !! current_scene_index
           tolist x = if x == -1 then [] else [x]
                      
                      
--judge whether mouse is within the rectangular_area
within_ra_pos :: (Point V2 CInt) -> Rect_area -> Bool
within_ra_pos mousePos r = and ((>=) <$> mousePos <*> (ra_vertex r)) &&
                           and ((<=) <$> mousePos <*> (ra_vertex r) + P (ra_size r))


--judge whether mouse is within the trigger_area
within_tri_pos :: (Point V2 CInt) -> Trigger-> Bool
within_tri_pos mousePos t = and ((>=) <$> mousePos <*> (trigger_vertex t)) &&
                            and ((<=) <$> mousePos <*> (trigger_vertex t) + P (trigger_size t))


--change n'th to new in list
change_list_x :: [a] -> Int -> a -> [a]
change_list_x ls n new = (take n ls) ++ (new : (drop (n+1) ls))


--judge whether user selects a useful item
have_useful_item :: Int -> Trigger -> Bool
have_useful_item item tri = (needed_item tri == (-1)) || (needed_item tri == item) || ((backup_item tri == item) && (backup_item tri >= 0))


--judge whether the password_lock has been opened 
judge_open :: Password_Lock -> Bool
judge_open pl = correct_password pl == input_password pl


--delete one item
del_one_item :: Int -> Interface -> Interface
del_one_item it interface = if it > (-1)
                            then interface { possessed_items = [i | i <- (possessed_items interface), i /= it] 
                                           , selected_item = (-1)
                                           , showed_first_item = if (possessed_items interface) == [] then (-1) else 0 } 
                            else interface


--add one item
add_one_item :: Int -> Interface -> Interface
add_one_item it interface = if it > (-1)
                            then interface { possessed_items = it:(possessed_items interface)
                                           , selected_item = (-1)
                                           , showed_first_item = 0 } 
                            else interface


--delete selected item
del_sel_item :: Bool -> Interface -> Interface
del_sel_item cond interface = if cond
                              then interface { possessed_items = [i | i <- (possessed_items interface), i /= (possessed_items interface) !! (selected_item interface)]
                                             , selected_item = (-1)
                                             , showed_first_item = if (possessed_items interface) == [] then (-1) else 0 } 
                              else interface                                     


--change dialog
update_dialogue :: Int -> Interface -> Interface
update_dialogue d interface = interface { dialogue = d }


--change main_scene to current_scene
update_m_scene :: Bool -> Interface -> Interface
update_m_scene cond interface = interface { main_scene = if cond then current_scene interface else main_scene interface }


--change current_scene
update_cur_scene :: Int -> Interface -> Interface
update_cur_scene cs interface
  | cs > (-1)  = interface { current_scene = cs }  --change current_scene
  | cs == (-2) = interface { current_scene = main_scene interface }  --return to main_scene
  | otherwise  = interface
  

--Int to Cint
i2ci :: Int -> CInt
i2ci a = (fromIntegral a) :: CInt


--assert
assert :: Bool -> IO ()
assert x = if x
           then return ()
           else error "Assertion failed"

--invert from char to int
char2int :: Char -> Int
char2int ch
  |ch == '1' = 1
  |ch == '2' = 2
  |ch == '3' = 3
  |ch == '4' = 4
  |ch == '5' = 5
  |ch == '6' = 6
  |ch == '7' = 7
  |ch == '8' = 8
  |ch == '9' = 9
  |otherwise = 0

--invert from string to int
str2int :: String -> Int
str2int str = if head str == '-'
              then -(p_str2int (tail str))
              else p_str2int str

--invert from string to positive int
p_str2int :: String -> Int
p_str2int str = if length str == 1
                then char2int (head str)
                else (p_str2int (init str)) * 10 + char2int (last str)

--invert from string to int list
str2intlist :: String -> [Int]
str2intlist str = map str2int (words filt_core_str)
    where core_str = init (tail str)
          filt_core_str = map (\ch -> if ch == ',' then ' ' else ch) core_str

           
