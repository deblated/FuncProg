module Models.UsersModel where

import Database.SQLite.Simple.ToRow
import Database.SQLite.Simple.FromRow
import Data.Text(Text)
import Data.Int(Int64)

data UserData = UserData Int64 Text Text Text

instance FromRow UserData where
  fromRow = UserData <$> field <*> field <*> field <*> field

instance ToRow UserData where
  toRow (UserData id_ username email role) = toRow (id_, username, email, role)

instance Show UserData where
  show (UserData id_ username email role) =
    "UserData { userId = " ++ show id_ ++
    ", username = " ++ show username ++
    ", email = " ++ show email ++
    ", role = " ++ show role ++
    " }"