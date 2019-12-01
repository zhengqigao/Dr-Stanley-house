---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
--Game: Doctor's House - Enhanced Version
--Authors: Ren Yuchen, Gao Zhengqi, Liu Shiwei
--Date: 2018.12
--
--File: Data_define.hs
--Note: define data
--Designers: Ren Yuchen, Gao Zhengqi
--Writers: Ren Yuchen, Gao Zhengqi
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

module Data_define where

import SDL.Vect
import Foreign.C.Types


---------------------------------------------------------------------------------------------------------------------------------------
--define sdl2 data
---------------------------------------------------------------------------------------------------------------------------------------

data Mouse = Mouse { posM  :: (Point V2 CInt)
                   , state :: Bool}

data Rect_area = Rect_area { ra_vertex :: (Point V2 CInt)
                           , ra_size   :: V2 CInt
                           }


---------------------------------------------------------------------------------------------------------------------------------------
--define game data
---------------------------------------------------------------------------------------------------------------------------------------

data Triggertype =  HOUSE_PASSWORD_BUTTON | BRONZE_PASSWORD_BUTTON | ADVANCED_PASSWORD_BUTTON | KEY_HOLE | ORDINARY | MENU | END_GAME  deriving (Eq)

data Interface = Interface {  dialogue          :: Int
                            , possessed_items   :: [Int]
                            , selected_item     :: Int
                            , showed_first_item :: Int
                            , main_scene        :: Int
                            , current_scene     :: Int
                           }

data Scene = Scene {  background :: Int
                    , triggers   :: [Int]
                   }

data Trigger = Trigger {  picture :: Int
                        , trigger_vertex :: (Point V2 CInt)
                        , trigger_size :: V2 CInt
                        , trigger_type :: Triggertype
                        , needed_item :: Int
                        , backup_item :: Int
                        , trigger_data :: Int
                        , relation_trigger :: Int
                        , relation_trigger_new_scene :: Int
                        , relation_trigger_new_picture :: Int
                        , triggerself_new_picture :: Int
                        , fail_dialogue :: Int

                        , new_dialogue :: Int
                        , new_scene :: Int
                        , add_item :: Int
                        , delete_item :: Int
                        , selected_item_delete :: Bool
                        , change_main_scene :: Bool
                        , relation_scene :: Int
                        , relation_scene_trigger_delete :: Int
                        , relation_scene_trigger_add :: Int
                        , triggerself_delete :: Bool
                       }  deriving (Eq)

data Item = Item {  item_picture :: Int
                  , item_scene :: Int
                  , trigger_picture :: Int
                 }

data Password_Lock = Password_Lock { correct_password :: [Int]
                                   , input_password   :: [Int]
                                   }

data Advanced_Password_Lock = Advanced_Password_Lock { ad_correct_password :: [Int]
                                                     , ad_hidden_password  :: [Int]
                                                     , ad_input_password   :: [Int]
                                                     }                                

data Keys_Lock = Keys_Lock { correct_keys :: [Int]
                           , current_keys :: [Int]
                           }
