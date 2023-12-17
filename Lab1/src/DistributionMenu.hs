{-# LANGUAGE OverloadedStrings #-}
module DistributionMenu where

import Database.SQLite.Simple
import Data.Text(Text)
import qualified Data.String
import Models.DistributionModel

showDist :: Connection -> IO()
showDist conn = do
    res <- query_ conn "select * from distribution" :: IO [DistributionData]
    print res

addDist :: Connection -> IO()
addDist conn = do
    putStrLn("software_id: ")
    software_id <- getLine

    putStrLn("distribution_place: ")
    distribution_place <- getLine

    _ <- execute conn "insert into distribution (software_id, distribution_place) values (?, ?)" (software_id, distribution_place)

    putStrLn("")


editDist :: Connection -> IO()
editDist conn = do
    putStrLn("Enter software_id:")
    id <- getLine

    putStrLn("Select what you want to change:")
    putStrLn("1) distribution_place")

    resp <- getChar
    _ <- getLine

    let choice = case resp of
            '1' -> "distribution_place" :: String
            _ -> ""

    putStrLn("Enter new value: ")
    val <- getLine

    let querString = ("update distribution set " ++ choice ++ "= ? where software_id = ?") :: String
    let query_ = Data.String.fromString querString

    _ <- execute conn query_ (val, id)

    putStrLn("")

deleteDist :: Connection -> IO()
deleteDist conn = do
    putStrLn("Enter software_id:")
    id <- getLine

    _ <- execute conn "delete from distribution where software_id = ?" (Only id)

    putStrLn("")