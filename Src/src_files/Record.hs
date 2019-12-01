---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
--Game: Doctor's House - Enhanced Version
--Authors: Ren Yuchen, Gao Zhengqi, Liu Shiwei
--Date: 2018.12
--
--File: Record.hs
--Note: record current game state
--Designers: Ren Yuchen
--Writers: Ren Yuchen
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

module Record where

import Data_define
import System.IO

record_interface :: Interface -> IO (Bool)
record_interface interface = do handle <- openFile "record_interface_data.txt" WriteMode
                                h_is_open <- hIsOpen handle
                                if h_is_open 
                                then do hPutStrLn handle (show (dialogue interface))
                                        hPutStrLn handle (show (possessed_items interface))
                                        hPutStrLn handle (show (selected_item interface))
                                        hPutStrLn handle (show (showed_first_item interface))
                                        hPutStrLn handle (show (main_scene interface))
                                        hClose handle
                                        return (True)
                                else return (False)

record_all_scenes :: [Scene] -> IO (Bool)
record_all_scenes all_scenes = do handle <- openFile "record_all_scenes.txt" WriteMode
                                  h_is_open <- hIsOpen handle
                                  if h_is_open 
                                  then do loop_record_all_scenes handle all_scenes
                                          hClose handle
                                          return (True)
                                  else return (False)

loop_record_all_scenes :: Handle -> [Scene] -> IO ()
loop_record_all_scenes handle all_scenes = do if length all_scenes > 0
                                              then do let cur_scene = head all_scenes
                                                      hPutStrLn handle (show (background cur_scene))
                                                      hPutStrLn handle (show (triggers cur_scene))
                                                      loop_record_all_scenes handle (tail all_scenes)
                                              else return ()

record_all_triggers :: [Trigger] -> IO (Bool)
record_all_triggers all_triggers = do handle <- openFile "record_all_triggers.txt" WriteMode
                                      h_is_open <- hIsOpen handle
                                      if h_is_open 
                                      then do loop_record_all_triggers handle all_triggers
                                              hClose handle
                                              return (True)
                                      else return (False)

loop_record_all_triggers :: Handle -> [Trigger] -> IO ()
loop_record_all_triggers handle all_triggers = do if length all_triggers > 0
                                                  then do let cur_trigger = head all_triggers
                                                          hPutStrLn handle (show (picture cur_trigger))
                                                          hPutStrLn handle (show (relation_trigger cur_trigger))
                                                          hPutStrLn handle (show (relation_trigger_new_scene cur_trigger))
                                                          hPutStrLn handle (show (relation_trigger_new_picture cur_trigger))
                                                          hPutStrLn handle (show (triggerself_new_picture cur_trigger))
                                                          hPutStrLn handle (show (fail_dialogue cur_trigger))
                                                          hPutStrLn handle (show (new_dialogue cur_trigger))
                                                          hPutStrLn handle (show (new_scene cur_trigger))
                                                          hPutStrLn handle (show (add_item cur_trigger))
                                                          hPutStrLn handle (show (delete_item cur_trigger))
                                                          hPutStrLn handle (show (relation_scene cur_trigger))
                                                          hPutStrLn handle (show (relation_scene_trigger_delete cur_trigger))
                                                          hPutStrLn handle (show (relation_scene_trigger_add cur_trigger))
                                                          loop_record_all_triggers handle (tail all_triggers)
                                                  else return ()

record_all_locks :: Password_Lock -> Password_Lock -> Advanced_Password_Lock -> Keys_Lock -> IO (Bool)
record_all_locks house_password_lock bronze_password_lock file_password_lock rainbow_lock = do handle <- openFile "record_locks_data.txt" WriteMode
                                                                                               h_is_open <- hIsOpen handle
                                                                                               if h_is_open 
                                                                                               then do hPutStrLn handle (show (input_password house_password_lock))
                                                                                                       hPutStrLn handle (show (input_password bronze_password_lock))
                                                                                                       hPutStrLn handle (show (ad_input_password file_password_lock))
                                                                                                       hPutStrLn handle (show (current_keys rainbow_lock))
                                                                                                       hClose handle
                                                                                                       return (True)
                                                                                               else return (False)

