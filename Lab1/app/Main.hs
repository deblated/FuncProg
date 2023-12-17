{-# LANGUAGE OverloadedStrings #-}
module Main (main) where

import Database.SQLite.Simple
import MenuModule 


main :: IO ()
main = do
  conn <- open "mydatabase.db"
  execute_ conn "PRAGMA foreign_keys = ON"

  showMainMenu conn

  close conn
