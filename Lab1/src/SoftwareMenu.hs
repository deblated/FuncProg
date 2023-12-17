{-# LANGUAGE OverloadedStrings #-}
module SoftwareMenu where

import Database.SQLite.Simple
import Data.Text(Text)
import qualified Data.String
import Models.SoftwareModel

showSoft :: Connection -> IO()
showSoft conn = do
    res <- query_ conn "select * from software" :: IO [SoftwareData]
    print res

addSoft :: Connection -> IO()
addSoft conn = do
    putStrLn("name: ")
    name <- getLine

    putStrLn("author: ")
    author <- getLine

    putStrLn("type: ")
    software_type <- getLine

    putStrLn("version: ")
    version <- getLine

    putStrLn("terms: ")
    terms <- getLine

    putStrLn("conditions: ")
    conditions <- getLine

    _ <- execute conn "insert into software (name, author, type, version, terms, conditions) values (?, ?, ?, ?, ?, ?)" (name, author, software_type, version, terms, conditions)

    putStrLn("")

editSoft :: Connection -> IO()
editSoft conn = do
    putStrLn("Enter id:")
    id <- getLine

    putStrLn("Select what you want to change:")
    putStrLn("1) name")
    putStrLn("2) author")
    putStrLn("3) type")
    putStrLn("4) version")
    putStrLn("5) terms")
    putStrLn("6) conditions")

    resp <- getChar
    _ <- getLine

    let choice = case resp of
            '1' -> "name" :: String
            '2' -> "author" :: String
            '3' -> "type" :: String
            '4' -> "version" :: String
            '5' -> "terms" :: String
            '6' -> "conditions" :: String

            _ -> ""

    putStrLn("Enter new value: ")
    val <- getLine

    let querString = ("update software set " ++ choice ++ "= ? where id = ?") :: String
    let query_ = Data.String.fromString querString

    _ <- execute conn query_ (val, id)

    putStrLn("")

deleteSoft :: Connection -> IO()
deleteSoft conn = do
    putStrLn("Enter id:")
    id <- getLine

    _ <- execute conn "delete from software where id = ?" (Only id)

    putStrLn("")