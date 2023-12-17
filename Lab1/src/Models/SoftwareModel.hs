module Models.SoftwareModel where

import Database.SQLite.Simple.ToRow
import Database.SQLite.Simple.FromRow
import Data.Text(Text)
import Data.Int(Int64)

data SoftwareData = SoftwareData Int64 Text Text Text Text Text Text

instance FromRow SoftwareData where
  fromRow = SoftwareData <$> field <*> field <*> field <*> field <*> field <*> field <*> field

instance ToRow SoftwareData where
  toRow (SoftwareData id name author software_type version terms conditions) = toRow (id, name, author, software_type, version, terms, conditions)

instance Show SoftwareData where
  show (SoftwareData id name author software_type version terms conditions) =
    "SoftwareData { id = " ++ show id ++
    ", name = " ++ show name ++
    ", author = " ++ show author ++
    ", type = " ++ show software_type ++
    ", version = " ++ show version ++
    ", terms = " ++ show terms ++
    ", conditions = " ++ show conditions ++
    " }"