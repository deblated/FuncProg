module Models.PopularityModel where

import Database.SQLite.Simple.ToRow
import Database.SQLite.Simple.FromRow
import Data.Text(Text)
import Data.Int(Int64)

data PopularityData = PopularityData Int64 Int64 Int64

instance FromRow PopularityData where
  fromRow = PopularityData <$> field <*> field <*> field

instance ToRow PopularityData where
  toRow (PopularityData software_id user_id score) = toRow (software_id, user_id, score)

instance Show PopularityData where
  show (PopularityData software_id user_id score) =
    "PopularityData { software_id = " ++ show software_id ++
    ", user_id = " ++ show user_id ++
    ", score = " ++ show score ++
    " }"