---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
--Game: Doctor's House - Enhanced Version
--Authors: Ren Yuchen, Gao Zhengqi, Liu Shiwei
--Date: 2018.12
--
--File: Trigger_functions.hs
--Note: deal with trigger_event
--Designers: Ren Yuchen
--Writers: Ren Yuchen
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

module Trigger_functions where

import Data_define
import Auxiliary_functions
import Foreign.C.Types
import SDL.Vect
import Interface
import Scenes
import Items
import Triggers
import Locks


--judge whether user clicks a trigger
try_triggers :: (Point V2 CInt) -> Interface -> [Scene] -> [Trigger] -> Password_Lock -> Password_Lock -> Advanced_Password_Lock -> Keys_Lock -> (Bool, Interface, [Scene], [Trigger], Password_Lock, Password_Lock, Advanced_Password_Lock, Keys_Lock)
try_triggers mousePos interface all_scenes all_triggers house_password_lock bronze_password_lock file_password_lock rainbow_lock
  | (my_trigger == []) && (fail_trigger == []) = (False, (update_dialogue (-1) interface), all_scenes, all_triggers, house_password_lock, bronze_password_lock, file_password_lock, rainbow_lock)    --click nothing
  | fail_trigger /= [] = (False, (update_dialogue (fail_dialogue (head fail_trigger)) interface), all_scenes, all_triggers, house_password_lock, bronze_password_lock, file_password_lock, rainbow_lock)    --click a trigger with wrong item
  | otherwise = trigger_event my_trigger_index interface all_scenes all_triggers house_password_lock bronze_password_lock file_password_lock rainbow_lock    --click a trigger with right item
    where has_triggers = [all_triggers !! i | i <- (triggers (all_scenes !! (current_scene interface)))]
          my_trigger = [t | t <- has_triggers, within_tri_pos mousePos t, have_useful_item use_item t]
          fail_trigger = [t | t <- has_triggers, within_tri_pos mousePos t, not (have_useful_item use_item t)]
          my_trigger_index = head [n | (n,t) <- zip [0..] all_triggers, t == head my_trigger]
          use_item = if (selected_item interface) < 0 
                     then (-1) 
                     else (possessed_items interface) !! (selected_item interface)
                     
                     
                     
--trigger event and update resources
trigger_event :: Int -> Interface -> [Scene] -> [Trigger] -> Password_Lock -> Password_Lock -> Advanced_Password_Lock -> Keys_Lock -> (Bool, Interface, [Scene], [Trigger], Password_Lock, Password_Lock, Advanced_Password_Lock, Keys_Lock)
trigger_event my_tri_index interface all_scenes all_triggers house_password_lock bronze_password_lock file_password_lock rainbow_lock
  | (trigger_type my_tri == HOUSE_PASSWORD_BUTTON) && (judge_open house_password_lock) = (False, interface, all_scenes, all_triggers, house_password_lock, bronze_password_lock, file_password_lock, rainbow_lock)   --click opened house password button
  | ((trigger_type my_tri) == HOUSE_PASSWORD_BUTTON) && (not (judge_open house_password_lock)) = (False, interface, all_scenes, house_new_all_triggers, new_house_password_lock, bronze_password_lock, file_password_lock, rainbow_lock)   --click closed house password button
  | (trigger_type my_tri) == BRONZE_PASSWORD_BUTTON = (False, bronze_new_interface, all_scenes, bronze_new_all_triggers, house_password_lock, new_bronze_password_lock, file_password_lock, rainbow_lock)   --click bronze password button
  | (trigger_type my_tri) == ADVANCED_PASSWORD_BUTTON = (False, advanced_new_interface, all_scenes, all_triggers, house_password_lock, bronze_password_lock, new_file_password_lock, rainbow_lock)   --click file password button
  | (trigger_type my_tri) == KEY_HOLE = (False, rainbow_new_interface, all_scenes, rainbow_new_all_triggers, house_password_lock, bronze_password_lock, file_password_lock, new_rainbow_lock)   --click rainbow key holes
  | (trigger_type my_tri) == MENU = (False, init_interface, init_scenes, init_triggers, house_password_lock { input_password = [0, 0, 0, 0, 0, 0] }, bronze_password_lock { input_password = [0, 0, 0, 0, 0, 0, 0, 0] }, file_password_lock { ad_input_password = [0, 0, 0, 0, 0, 0] }, rainbow_lock { current_keys = [-1, -1, -1, -1, -1, -1, -1] })   --return to menu
  | (trigger_type my_tri) == END_GAME = (True, interface, all_scenes, all_triggers, house_password_lock, bronze_password_lock, file_password_lock, rainbow_lock)   --choose to quit
  | otherwise = (False, ordinary_new_interface, ordinary_new_all_scenes, ordinary_new_all_triggers, house_password_lock, bronze_password_lock, file_password_lock, rainbow_lock)   --click other ordinary triggers
        where my_tri = all_triggers !! my_tri_index
        
              --click closed house password button
              new_house_password_lock = house_password_lock { input_password = (trigger_data my_tri) : (init (input_password house_password_lock)) }    --input a password
              house_new_all_triggers = if judge_open new_house_password_lock 
                                       then change_list_x all_triggers 16 ((all_triggers !! 16) {picture = 127, new_scene = 6})
                                       else all_triggers
              
              --click bronze password button
              new_bronze_password_lock = bronze_password_lock { input_password = (trigger_data my_tri) : (init (input_password bronze_password_lock)) }    --input a password
              bronze_new_interface = if judge_open new_bronze_password_lock 
                                     then update_m_scene True (update_cur_scene 75 interface)
                                     else interface
              bronze_new_all_triggers = if (judge_open new_bronze_password_lock) 
                                        then change_list_x all_triggers 116 ((all_triggers !! 116) {new_scene = 76})
                                        else all_triggers
              
              --click file password button
              new_file_password_lock = file_password_lock { ad_input_password = (trigger_data my_tri) : (init (ad_input_password file_password_lock)) }    --input a password  
              advanced_new_interface = if (ad_correct_password new_file_password_lock == ad_input_password new_file_password_lock)  --input correct password
                                       then update_dialogue 15 (update_cur_scene 84 interface)
                                       else if (ad_hidden_password new_file_password_lock == ad_input_password new_file_password_lock)  --input hidden password
                                            then update_m_scene True (update_dialogue 14 (update_cur_scene 52 interface))
                                            else interface
              
              --click rainbow key holes
              pull_out_key_item = if rainbow_lock_pos >= 0 
                                  then (current_keys rainbow_lock) !! rainbow_lock_pos  --pull out a key from a key hole
                                  else (-1)
              rainbow_lock_pos = trigger_data my_tri  --key hole position
              rainbow_lock_item = if selected_item interface >= 0
                                  then (possessed_items interface) !! (selected_item interface)  --use a key
                                  else (-1)
              new_rainbow_lock = if pull_out_key_item >= 0    --pull out a key
                                 then rainbow_lock { current_keys = [if k == pull_out_key_item then (-1) else k | k <- (current_keys rainbow_lock)] } 
                                 else if elem rainbow_lock_item [3, 6, 7, 8, 11, 12, 16]    --insert a key
                                      then rainbow_lock { current_keys = change_list_x (current_keys rainbow_lock) rainbow_lock_pos rainbow_lock_item } 
                                      else rainbow_lock
              rainbow_new_all_triggers = if pull_out_key_item >= 0    --pull out a key
                                         then change_list_x all_triggers my_tri_index ((all_triggers !! my_tri_index) { picture = -1 })
                                         else if elem rainbow_lock_item [3, 6, 7, 8, 11, 12, 16]    --insert a key
                                              then if (correct_keys new_rainbow_lock) == (current_keys new_rainbow_lock) 
                                                   then change_list_x all_triggers 66 ((all_triggers !! 66) { new_scene = 52 })   --open
                                                   else change_list_x all_triggers (154 + rainbow_lock_pos) ((all_triggers !! (154 + rainbow_lock_pos)) { picture = trigger_picture (all_items !! rainbow_lock_item) })    --just insert a key
                                              else all_triggers 
              rainbow_new_interface = if pull_out_key_item >= 0    --pull out a key
                                      then add_one_item pull_out_key_item interface
                                      else if elem rainbow_lock_item [3, 6, 7, 8, 11, 12, 16]    --insert a key
                                           then if (correct_keys new_rainbow_lock) == (current_keys new_rainbow_lock)
                                                then update_m_scene True (del_sel_item True (update_cur_scene 82 (update_dialogue 23 interface)))  --open
                                                else del_sel_item True interface  --just insert a key
                                           else interface                                       
              
              --click other ordinary triggers
              del_trigger tri tri_list = if tri < 0 then tri_list else [t | t <- tri_list, t /= tri]
              add_trigger tri tri_list = if tri < 0 then tri_list else (tri:tri_list)
              ordinary_new_all_scenes_relation = if triggerself_delete my_tri  -- delete triggerself first
                                                 then change_list_x all_scenes (current_scene interface) ((all_scenes !! (current_scene interface)) {triggers = [t | t <- triggers (all_scenes !! (current_scene interface)), t /= my_tri_index]})
                                                 else all_scenes
              update_trigger_pic all_triggers = if triggerself_new_picture my_tri < 0
                                                then all_triggers
                                                else change_list_x all_triggers my_tri_index (my_tri {picture = triggerself_new_picture my_tri})
              update_relation_trigger all_triggers = if relation_trigger my_tri < 0
                                                     then all_triggers
                                                     else change_list_x all_triggers (relation_trigger my_tri) ((all_triggers !! (relation_trigger my_tri)) { picture = if (relation_trigger_new_picture my_tri) < 0 then picture (all_triggers !! (relation_trigger my_tri)) else relation_trigger_new_picture my_tri 
                                                                                                                                                            , new_scene = if (relation_trigger_new_scene my_tri) < 0 then new_scene (all_triggers !! (relation_trigger my_tri)) else relation_trigger_new_scene my_tri })
              ordinary_new_interface = update_dialogue (new_dialogue my_tri) (add_one_item (add_item my_tri) (del_one_item (delete_item my_tri) (del_sel_item (selected_item_delete my_tri) (update_m_scene (change_main_scene my_tri) (update_cur_scene (new_scene my_tri) interface)))))
              ordinary_new_all_scenes = if (relation_scene my_tri) >= 0
                                        then change_list_x ordinary_new_all_scenes_relation (relation_scene my_tri) ((ordinary_new_all_scenes_relation !! (relation_scene my_tri)) {triggers = add_trigger (relation_scene_trigger_add my_tri) (del_trigger (relation_scene_trigger_delete my_tri) (triggers (ordinary_new_all_scenes_relation !! (relation_scene my_tri))))})
                                        else ordinary_new_all_scenes_relation
              ordinary_new_all_triggers = update_relation_trigger (update_trigger_pic all_triggers)
              
