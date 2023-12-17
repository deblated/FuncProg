module Models.StatisticsModel where

import Database.SQLite.Simple.ToRow
import Database.SQLite.Simple.FromRow
import Data.Text(Text)
import Data.Int(Int64)

data StatisticsData = StatisticsData Int64 Int64

instance FromRow StatisticsData where
  fromRow = StatisticsData <$> field <*> field

instance ToRow StatisticsData where
  toRow (StatisticsData software_id downloadings) = toRow (software_id, downloadings)

instance Show StatisticsData where
  show (StatisticsData software_id downloadings) =
    "StatisticsData { software_id = " ++ show software_id ++
    ", downloadings = " ++ show downloadings ++
    " }"