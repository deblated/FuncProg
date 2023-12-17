{-# LANGUAGE OverloadedStrings #-}
module AbstractMenu where

import Database.SQLite.Simple
import Data.Text(Text)
import qualified Data.String
import Models.AbstractModel

showAbs :: Connection -> IO()
showAbs conn = do
    res <- query_ conn "select * from abstract" :: IO [AbstractData]
    print res

addAbs :: Connection -> IO()
addAbs conn = do
    putStrLn("software_id: ")
    software_id <- getLine

    putStrLn("abstract_text: ")
    abstract_text <- getLine

    _ <- execute conn "insert into abstract (software_id, abstract_text) values (?, ?)" (software_id, abstract_text)

    putStrLn("")

editAbs :: Connection -> IO()
editAbs conn = do
    putStrLn("Enter software_id:")
    id <- getLine

    putStrLn("Select what you want to change:")
    putStrLn("1) abstract_text")

    resp <- getChar
    _ <- getLine

    let choice = case resp of
            '1' -> "abstract_text" :: String
            _ -> ""

    putStrLn("Enter new value: ")
    val <- getLine

    let querString = ("update previews set " ++ choice ++ "= ? where software_id = ?") :: String
    let query_ = Data.String.fromString querString

    _ <- execute conn query_ (val, id)

    putStrLn("")

deleteAbs :: Connection -> IO()
deleteAbs conn = do
    putStrLn("Enter software_id:")
    id <- getLine

    _ <- execute conn "delete from abstract where software_id = ?" (Only id)

    putStrLn("")