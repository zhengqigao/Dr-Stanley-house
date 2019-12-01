---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
--Game: Doctor's House - Enhanced Version
--Authors: Ren Yuchen, Gao Zhengqi, Liu Shiwei
--Date: 2018.12
--
--File: main.hs
--Note: main function for starting the game
--Designers: Gao Zhengqi && Ren Yuchen
--Writers: Ren Yuchen && Gao Zhengqi, Liu Shiwei
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Main(main) where

--Game Resources
import Data_define
import Interface
import Scenes
import Items
import Triggers
import Diag
import Locks
import Images
import Images_pos

--Record
import Record
import Reload

--Functions
import Trigger_functions
import Item_functions
import Auxiliary_functions

--SDL
import Control.Monad
import SDL.Vect
import qualified SDL
import Data.Monoid

--Music
import qualified SDL.Raw.Mixer as Mix
import Control.Applicative
import Control.Concurrent (threadDelay)
import Foreign.C.String
import Foreign.Ptr
import System.Environment
import System.Exit

--Text
import qualified SDL.Font
import Data.Text          (Text, unpack, pack)


main :: IO ()
main = do
  --play music
  SDL.initialize [SDL.InitAudio]
  Mix.openAudio 44100 Mix.AUDIO_S16LSB 2 4096
  Mix.allocateChannels 16
  music <- withCString "./bgm.mp3" $ \cstr -> Mix.loadMUS cstr
  temp <- Mix.playMusic music (-1)
  assert $ temp /= -1
  
  --set text
  SDL.Font.initialize
  font <- SDL.Font.load "films.Hellbound.ttf" 30

  --create window
  SDL.initialize [SDL.InitVideo]
  window <- SDL.createWindow "Doctor's House - Enhanced Version" SDL.defaultWindow { SDL.windowInitialSize = V2 screenWidth screenHeight }
  SDL.showWindow window
  screenSurface <- SDL.getWindowSurface window
  all_images_file <- load_file

  --draw_interface function
  let
    draw_interface interface all_scenes all_triggers = do
      SDL.surfaceBlit (all_images_file !! 3) Nothing screenSurface  (all_images_pos !! 3)  --draw bottom sidebar 
      SDL.surfaceBlit (all_images_file !! 5) Nothing screenSurface  (all_images_pos !! 5)  -- draw right sidebar
      
      --draw frame selection
      if (showed_first_item interface > -1 && 0 <= (selected_item interface) - (showed_first_item interface) && (selected_item interface) - (showed_first_item interface) <= 4) 
        then do
          let sel_it = i2ci (selected_item interface)
          let top_it = i2ci (showed_first_item interface)
          SDL.surfaceBlit (all_images_file !! iTEM_BOX_IMAGE_INDEX) Nothing screenSurface (Just (P (V2 iTEM_BOX_IMAGE_X1 (iTEM_BOX_IMAGE_Y1 + iTEM_BOX_HEIGHT * (sel_it - top_it)))))
        else 
          return $ Just (SDL.Rectangle (P (V2 0 0)) (V2 0 0))
      
      --draw items
      let loop_draw_items cur = do
          if (showed_first_item interface >= 0) && (cur + showed_first_item interface < length (possessed_items interface)) 
             then SDL.surfaceBlit (all_images_file !! (item_picture (all_items !! (possessed_items interface !! (cur + showed_first_item interface))))) Nothing screenSurface (Just (P (V2 iTEM_X1 (iTEM1_Y1 + iTEM_BOX_HEIGHT * i2ci cur))))
             else return $ Just (SDL.Rectangle (P (V2 0 0)) (V2 0 0))
          unless (cur == 4) (loop_draw_items (cur+1))
      loop_draw_items 0

      --draw dialog
      if (dialogue interface >= 0) 
        then do  --draw dialog
          diag_yes <- SDL.Font.solid font red (pack (all_dialogues !! (dialogue interface)))
          SDL.surfaceBlit diag_yes Nothing screenSurface (Just (P (V2 20 575))) 
        else do  --draw nothing
          dian_no <- SDL.Font.solid font red " "
          SDL.surfaceBlit dian_no Nothing screenSurface (Just (P (V2 20 575))) 

      --draw main scene
      let main_bg = background (all_scenes !! (main_scene interface))
      SDL.surfaceBlit (all_images_file !! main_bg) Nothing screenSurface (all_images_pos !! main_bg)  --draw main_background
      let main_tris = triggers (all_scenes !! (main_scene interface))
      let loop_draw_tris tris_list = do
          let cur_tri = all_triggers !! (head tris_list)
          if picture cur_tri >= 0
            then if ((trigger_type cur_tri) == KEY_HOLE)
                 then SDL.surfaceBlit (all_images_file !! (picture cur_tri)) Nothing screenSurface (Just (trigger_vertex cur_tri))  --draw rainbow key holes
                 else SDL.surfaceBlit (all_images_file !! (picture cur_tri)) Nothing screenSurface  (all_images_pos !! (picture cur_tri))  --draw other static triggers
            else return $ Just (SDL.Rectangle (P (V2 0 0)) (V2 0 0))  --draw nothing
          unless ((length tris_list) == 1) (loop_draw_tris (tail tris_list)) 
      unless (main_tris == []) (loop_draw_tris main_tris)  --draw main_triggers

      --draw current scene
      let cur_images = get_scene_images (current_scene interface) all_scenes all_triggers  --all current images
      let loop_draw_cur cur = do
          if (cur > -1) 
            then SDL.surfaceBlit (all_images_file !! (cur_images !! cur)) Nothing screenSurface  (all_images_pos !! (cur_images !! cur))
            else return $ Just (SDL.Rectangle (P (V2 0 0)) (V2 0 0))
          unless (cur==0)  (loop_draw_cur (cur-1))
      unless (current_scene interface == main_scene interface) (loop_draw_cur $ (length cur_images)-1)  --draw all current images 

      SDL.updateWindowSurface window

  --init draw
  draw_interface init_interface init_scenes init_triggers
  
  --game loop_run function
  let
    loop_run interface all_scenes all_triggers house_password_lock bronze_password_lock file_password_lock rainbow_lock = do
      event <- map SDL.eventPayload <$> ((<$>) (\a -> a:[]) SDL.waitEvent)  --get [one event]
      mousePos <- SDL.getAbsoluteMouseLocation  --get mouse position
  
      let whether_click = getAny $ foldMap (\case  
                SDL.MouseButtonEvent e -> Any $ SDL.mouseButtonEventMotion e == SDL.Pressed
                otherwise -> Any False) event
      let quit = SDL.QuitEvent `elem` event

      if whether_click  
        then  --deal with click event
          if (within_ra_pos mousePos ra_magnifier) && (selected_item interface >= 0)  --click magnifier
          then do let new_interface = event_magnifier interface
                  draw_interface new_interface all_scenes all_triggers
                  unless (quit) (loop_run new_interface all_scenes all_triggers house_password_lock bronze_password_lock file_password_lock rainbow_lock)
          else if (within_ra_pos mousePos ra_turn_page_up) && (showed_first_item interface > 0)  --click turn_page_up
               then do let new_interface = event_turnpageup interface
                       draw_interface new_interface all_scenes all_triggers
                       unless (quit) (loop_run new_interface all_scenes all_triggers house_password_lock bronze_password_lock file_password_lock rainbow_lock)
          else if (within_ra_pos mousePos ra_record) && (not (elem (main_scene interface) [87, 88, 89, 90]))
               then do r1 <- record_interface interface
                       r2 <- record_all_scenes all_scenes
                       r3 <- record_all_triggers all_triggers
                       r4 <- record_all_locks house_password_lock bronze_password_lock file_password_lock rainbow_lock
                       if r1 && r2 && r3 && r4
                       then do let new_interface = interface {current_scene = 91}
                               draw_interface new_interface all_scenes all_triggers
                               loop_run new_interface all_scenes all_triggers house_password_lock bronze_password_lock file_password_lock rainbow_lock
                       else do let new_interface = interface {current_scene = 92}
                               draw_interface new_interface all_scenes all_triggers
                               loop_run new_interface all_scenes all_triggers house_password_lock bronze_password_lock file_password_lock rainbow_lock                
          else if (within_ra_pos mousePos ra_reload) && (main_scene interface == 87)
               then do new_interface <- reload_interface interface
                       new_all_scenes <- reload_all_scenes all_scenes
                       new_all_triggers <- reload_all_triggers all_triggers
                       (new_house_password_lock, new_bronze_password_lock, new_file_password_lock, new_rainbow_lock) <- reload_all_locks house_password_lock bronze_password_lock file_password_lock rainbow_lock
                       draw_interface new_interface new_all_scenes new_all_triggers
                       unless (quit) (loop_run new_interface new_all_scenes new_all_triggers new_house_password_lock new_bronze_password_lock new_file_password_lock new_rainbow_lock)
          else if (within_ra_pos mousePos ra_menu) && (not (elem (main_scene interface) [87, 88, 89, 90]))
               then do draw_interface init_interface init_scenes init_triggers
                       unless (quit) (loop_run init_interface init_scenes init_triggers (house_password_lock { input_password = [0, 0, 0, 0, 0, 0] }) (bronze_password_lock { input_password = [0, 0, 0, 0, 0, 0, 0, 0] }) (file_password_lock { ad_input_password = [0, 0, 0, 0, 0, 0] }) (rainbow_lock { current_keys = [-1, -1, -1, -1, -1, -1, -1] }))
          else if (within_ra_pos mousePos ra_turn_page_down) && ((showed_first_item interface) + 5) < (length $ possessed_items interface)  --click turn_page_down
               then do let new_interface = event_turnpagedown interface
                       draw_interface new_interface all_scenes all_triggers
                       unless (quit) (loop_run new_interface all_scenes all_triggers house_password_lock bronze_password_lock file_password_lock rainbow_lock)
          else if (within_ra_pos mousePos ra_item1) && (showed_first_item interface) > -1 && showed_first_item interface /= selected_item interface  --click item-1
               then do let new_interface = event_item1 interface
                       draw_interface new_interface all_scenes all_triggers
                       unless (quit) (loop_run new_interface all_scenes all_triggers house_password_lock bronze_password_lock file_password_lock rainbow_lock)
          else if (within_ra_pos mousePos ra_item2) && ((showed_first_item interface) + 1) < (length $ possessed_items interface) && ((showed_first_item interface) + 1 /= selected_item interface)  --click item-2   
               then do let new_interface = event_item2 interface
                       draw_interface new_interface all_scenes all_triggers
                       unless (quit) (loop_run new_interface all_scenes all_triggers house_password_lock bronze_password_lock file_password_lock rainbow_lock)
          else if (within_ra_pos mousePos ra_item3) && ((showed_first_item interface) + 2) < (length $ possessed_items interface) && ((showed_first_item interface) + 2) /= selected_item interface  --click item-3   
               then do let new_interface = event_item3 interface
                       draw_interface new_interface all_scenes all_triggers
                       unless (quit) (loop_run new_interface all_scenes all_triggers house_password_lock bronze_password_lock file_password_lock rainbow_lock)
          else if (within_ra_pos mousePos ra_item4) && ((showed_first_item interface) + 3) < (length $ possessed_items interface) && ((showed_first_item interface) + 3) /= selected_item interface  --click item-4   
               then do let new_interface = event_item4 interface
                       draw_interface new_interface all_scenes all_triggers
                       unless (quit) (loop_run new_interface all_scenes all_triggers house_password_lock bronze_password_lock file_password_lock rainbow_lock)
          else if (within_ra_pos mousePos ra_item5) && ((showed_first_item interface) + 4) < (length $ possessed_items interface) && ((showed_first_item interface) + 4) /= selected_item interface   
               then do let new_interface = event_item5 interface  --click item-5
                       draw_interface new_interface all_scenes all_triggers
                       unless (quit) (loop_run new_interface all_scenes all_triggers house_password_lock bronze_password_lock file_password_lock rainbow_lock)
               else do let (user_quit, new_interface, new_all_scenes, new_all_triggers, new_house_password_lock, new_bronze_password_lock, new_file_password_lock, new_rainbow_lock) = try_triggers mousePos interface all_scenes all_triggers house_password_lock bronze_password_lock file_password_lock rainbow_lock  --click scene
                       draw_interface new_interface new_all_scenes new_all_triggers
                       unless (quit || user_quit) (loop_run new_interface new_all_scenes new_all_triggers new_house_password_lock new_bronze_password_lock new_file_password_lock new_rainbow_lock)
        else  --quit or loop_run
          unless (quit) (loop_run interface all_scenes all_triggers house_password_lock bronze_password_lock file_password_lock rainbow_lock)
  
  --start game
  loop_run init_interface init_scenes init_triggers house_password_lock bronze_password_lock file_password_lock rainbow_lock

  --quit game
  SDL.destroyWindow window
  SDL.quit


