module Models.DistributionModel where

import Database.SQLite.Simple.ToRow
import Database.SQLite.Simple.FromRow
import Data.Text(Text)
import Data.Int(Int64)

data DistributionData = DistributionData Int64 Text

instance FromRow DistributionData where
  fromRow = DistributionData <$> field <*> field

instance ToRow DistributionData where
  toRow (DistributionData software_id distribution_place) = toRow (software_id, distribution_place)

instance Show DistributionData where
  show (DistributionData software_id distribution_place) =
    "DistributionData { software_id = " ++ show software_id ++
    ", distribution_place = " ++ show distribution_place ++
    " }"