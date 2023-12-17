{-# LANGUAGE OverloadedStrings #-}
module StatisticsMenu where

import Database.SQLite.Simple
import Data.Text(Text)
import qualified Data.String
import Models.StatisticsModel

showStats :: Connection -> IO()
showStats conn = do
    res <- query_ conn "select * from statistics" :: IO [StatisticsData]
    print res

addStats :: Connection -> IO()
addStats conn = do
    putStrLn("software_id: ")
    software_id <- getLine

    putStrLn("downloadings: ")
    downloadings <- getLine

    _ <- execute conn "insert into statistics (software_id, downloadings) values (?, ?)" (software_id, downloadings)

    putStrLn("")


editStats :: Connection -> IO()
editStats conn = do
    putStrLn("Enter software_id:")
    id <- getLine

    putStrLn("Select what you want to change:")
    putStrLn("1) downloadings")

    resp <- getChar
    _ <- getLine

    let choice = case resp of
            '1' -> "downloadings" :: String
            _ -> ""

    putStrLn("Enter new value: ")
    val <- getLine

    let querString = ("update statistics set " ++ choice ++ "= ? where software_id = ?") :: String
    let query_ = Data.String.fromString querString

    _ <- execute conn query_ (val, id)

    putStrLn("")

deleteStats :: Connection -> IO()
deleteStats conn = do
    putStrLn("Enter software_id:")
    id <- getLine

    _ <- execute conn "delete from statistics where software_id = ?" (Only id)

    putStrLn("")