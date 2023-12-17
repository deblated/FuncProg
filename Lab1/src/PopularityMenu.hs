{-# LANGUAGE OverloadedStrings #-}
module PopularityMenu where

import Database.SQLite.Simple
import Data.Text(Text)
import qualified Data.String
import Models.PopularityModel

showPop :: Connection -> IO()
showPop conn = do
    res <- query_ conn "select * from popularity" :: IO [PopularityData]
    print res

addPop :: Connection -> IO()
addPop conn = do
    putStrLn("Software ID: ")
    software_id <- getLine

    putStrLn("User ID: ")
    user_id <- getLine

    putStrLn("Score: ")
    score <- getLine

    _ <- execute conn "insert into popularity (software_id, user_id, score) values (?, ?, ?)" (software_id, user_id, score)
      
    putStrLn("")

editPop :: Connection -> IO()
editPop conn = do
    putStrLn("Enter software ID:")

    software_id <- getLine

    putStrLn("Enter user ID:")

    user_id <- getLine

    putStrLn("Select what you want to change:")
    putStrLn("1) score")

    resp <- getChar
    _ <- getLine

    let choise = case resp of
            '1' -> "score" :: String
            _ -> ""

    putStrLn("Enter new value: ")
    val <- getLine
    
    let querString = ("update popularity set " ++ choise ++ "= ? where software_id = ? AND user_id = ?") :: String

    let query_ = Data.String.fromString querString

    _ <- execute conn  query_ (val, software_id, user_id)

    putStrLn("")

deletePop :: Connection -> IO()
deletePop conn = do
    putStrLn("Enter software ID:")
    software_id <- getLine

    putStrLn("Enter user ID:")
    user_id <- getLine

    _ <- execute conn "delete from statistics where software_id = ? AND user_id = ?" (software_id, user_id)

    putStrLn("")