{-# LANGUAGE OverloadedStrings #-}
module UsersMenu where

import Database.SQLite.Simple
import Data.Text(Text)
import qualified Data.String
import Models.UsersModel

showUsers :: Connection -> IO()
showUsers conn = do
    res <- query_ conn "select * from users" :: IO [UserData]
    print res

addUser :: Connection -> IO()
addUser conn = do
    putStrLn("Name: ")
    name <- getLine

    putStrLn("Email: ")
    email <- getLine

    putStrLn("Role: ")
    role <- getLine

    _ <- execute conn "insert into users (name, email, role) values (?, ?, ?)" (name, email, role)

            
    putStrLn("")

editUser :: Connection -> IO()
editUser conn = do
    putStrLn("Enter ID:")
    id <- getLine

    putStrLn("Select what you want to change:")
    putStrLn("1) name")
    putStrLn("2) email")
    putStrLn("3) role")

    resp <- getChar
    _ <- getLine

    let choise = case resp of
            '1' -> "name" :: String
            '2' -> "email" :: String
            '3' -> "role" :: String
            _ -> ""

    putStrLn("Enter new value: ")
    val <- getLine
    
    let querString = ("update users set " ++ choise ++ "= ? where id = ?") :: String

    let query_ = Data.String.fromString querString

    _ <- execute conn query_(val, id)

    putStrLn("")

deleteUser :: Connection -> IO()
deleteUser conn = do
    putStrLn("Enter ID:")
    id <- getLine

    _ <- execute conn "delete from users where id = ?" (Only id)

    putStrLn("")