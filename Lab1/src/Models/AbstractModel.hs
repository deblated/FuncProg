module Models.AbstractModel where

import Database.SQLite.Simple.ToRow
import Database.SQLite.Simple.FromRow
import Data.Text(Text)
import Data.Int(Int64)

data AbstractData = AbstractData Int64 Text

instance FromRow AbstractData where
  fromRow = AbstractData <$> field <*> field

instance ToRow AbstractData where
  toRow (AbstractData software_id abstract_text) = toRow (software_id, abstract_text)

instance Show AbstractData where
  show (AbstractData software_id abstract_text) =
    "AbstractData { software_id = " ++ show software_id ++
    ", abstract_text = " ++ show abstract_text ++
    " }"