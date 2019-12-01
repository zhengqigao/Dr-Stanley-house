---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
--Game: Doctor's House - Enhanced Version
--Authors: Ren Yuchen, Gao Zhengqi, Liu Shiwei
--Date: 2018.12
--
--File: Locks.hs
--Note: initialize locks
--Designers: Ren Yuchen
--Writers: Ren Yuchen
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

module Locks where

import Data_define

rainbow_lock = Keys_Lock { correct_keys = [7, 11, 6, 3, 8, 16, 12], current_keys = [-1, -1, -1, -1, -1, -1, -1] }

house_password_lock = Password_Lock { correct_password = [5, 3, 5, 2, 5, 2], input_password = [0, 0, 0, 0, 0, 0] }

bronze_password_lock = Password_Lock { correct_password = [8, 9, 7, 8, 6, 6, 8, 1], input_password = [0, 0, 0, 0, 0, 0, 0, 0] }

file_password_lock = Advanced_Password_Lock { ad_correct_password = [9, 1, 2, 4, 8, 6], ad_hidden_password = [9, 8, 6, 2, 1, 6], ad_input_password = [0, 0, 0, 0, 0, 0] }
