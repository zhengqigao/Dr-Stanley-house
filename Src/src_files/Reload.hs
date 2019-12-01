---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
--Game: Doctor's House - Enhanced Version
--Authors: Ren Yuchen, Gao Zhengqi, Liu Shiwei
--Date: 2018.12
--
--File: Reload.hs
--Note: reload previous game state
--Designers: Ren Yuchen
--Writers: Ren Yuchen
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

module Reload where

import Data_define
import System.IO
import Auxiliary_functions

reload_interface :: Interface -> IO Interface
reload_interface interface = do handle <- openFile "record_interface_data.txt" ReadMode
                                h_is_open <- hIsOpen handle
                                if h_is_open
                                then do content_dialogue <- hGetLine handle
                                        content_possessed_items <- hGetLine handle
                                        content_selected_item <- hGetLine handle
                                        content_showed_first_item <- hGetLine handle
                                        content_main_scene <- hGetLine handle
                                        hClose handle
                                        return Interface { dialogue = str2int content_dialogue
                                                         , possessed_items = str2intlist content_possessed_items
                                                         , selected_item = str2int content_selected_item
                                                         , showed_first_item = str2int content_showed_first_item
                                                         , main_scene = str2int content_main_scene
                                                         , current_scene = str2int content_main_scene }
                                else return interface
         
reload_all_scenes :: [Scene] -> IO [Scene]
reload_all_scenes all_scenes = do handle <- openFile "record_all_scenes.txt" ReadMode
                                  h_is_open <- hIsOpen handle
                                  if h_is_open
                                  then loop_reload_all_scenes handle all_scenes
                                  else return all_scenes

loop_reload_all_scenes :: Handle -> [Scene] -> IO [Scene]
loop_reload_all_scenes handle all_scenes = do h_is_eof <- hIsEOF handle
                                              if h_is_eof
                                              then do hClose handle
                                                      return all_scenes
                                              else do let cur_scene = head all_scenes
                                                      content_background <- hGetLine handle
                                                      content_triggers <- hGetLine handle
                                                      rest_scenes <- loop_reload_all_scenes handle (tail all_scenes)
                                                      return ((Scene {background = str2int content_background, triggers = str2intlist content_triggers}):rest_scenes)

reload_all_triggers :: [Trigger] -> IO [Trigger]
reload_all_triggers all_triggers = do handle <- openFile "record_all_triggers.txt" ReadMode
                                      h_is_open <- hIsOpen handle
                                      if h_is_open
                                      then loop_reload_all_triggers handle all_triggers
                                      else return all_triggers

loop_reload_all_triggers :: Handle -> [Trigger] -> IO [Trigger]
loop_reload_all_triggers handle all_triggers = do h_is_eof <- hIsEOF handle
                                                  if h_is_eof
                                                  then do hClose handle
                                                          return all_triggers
                                                  else do let cur_trigger = head all_triggers
                                                          content_picture <- hGetLine handle
                                                          content_relation_trigger <- hGetLine handle
                                                          content_relation_trigger_new_scene <- hGetLine handle
                                                          content_relation_trigger_new_picture <- hGetLine handle
                                                          content_triggerself_new_picture <- hGetLine handle
                                                          content_fail_dialogue <- hGetLine handle
                                                          content_new_dialogue <- hGetLine handle
                                                          content_new_scene <- hGetLine handle
                                                          content_add_item <- hGetLine handle
                                                          content_delete_item <- hGetLine handle
                                                          content_relation_scene <- hGetLine handle
                                                          content_relation_scene_trigger_delete <- hGetLine handle
                                                          content_relation_scene_trigger_add <- hGetLine handle
                                                          rest_triggers <- loop_reload_all_triggers handle (tail all_triggers)
                                                          return ((cur_trigger { picture = str2int content_picture
                                                                               , relation_trigger = str2int content_relation_trigger
                                                                               , relation_trigger_new_scene = str2int content_relation_trigger_new_scene
                                                                               , relation_trigger_new_picture = str2int content_relation_trigger_new_picture
                                                                               , triggerself_new_picture = str2int content_triggerself_new_picture
                                                                               , fail_dialogue = str2int content_fail_dialogue
                                                                               , new_dialogue = str2int content_new_dialogue
                                                                               , new_scene = str2int content_new_scene
                                                                               , add_item = str2int content_add_item
                                                                               , delete_item = str2int content_delete_item
                                                                               , relation_scene = str2int content_relation_scene
                                                                               , relation_scene_trigger_delete = str2int content_relation_scene_trigger_delete
                                                                               , relation_scene_trigger_add = str2int content_relation_scene_trigger_add
                                                                               }):rest_triggers)

reload_all_locks :: Password_Lock -> Password_Lock -> Advanced_Password_Lock -> Keys_Lock -> IO ((Password_Lock, Password_Lock, Advanced_Password_Lock, Keys_Lock))                                               
reload_all_locks house_password_lock bronze_password_lock file_password_lock rainbow_lock = do handle <- openFile "record_locks_data.txt" ReadMode
                                                                                               h_is_open <- hIsOpen handle
                                                                                               if h_is_open
                                                                                               then do content_input_password_1 <- hGetLine handle
                                                                                                       content_input_password_2 <- hGetLine handle
                                                                                                       content_ad_input_password <- hGetLine handle
                                                                                                       content_current_keys <- hGetLine handle
                                                                                                       hClose handle
                                                                                                       return ( house_password_lock { input_password = str2intlist content_input_password_1 }
                                                                                                              , bronze_password_lock { input_password = str2intlist content_input_password_2 }
                                                                                                              , file_password_lock { ad_input_password = str2intlist content_ad_input_password }
                                                                                                              , rainbow_lock { current_keys = str2intlist content_current_keys } )
                                                                                               else return (house_password_lock, bronze_password_lock, file_password_lock, rainbow_lock)


