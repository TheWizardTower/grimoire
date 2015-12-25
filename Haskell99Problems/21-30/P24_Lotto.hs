module P24_Lotto where

import SelectElement

lotto :: Int -> Int -> IO [Int]
lotto 0 _ = return []
lotto toTake rndMax = do
  number <- selectElement 1 rndMax
  rest <- lotto (toTake - 1) rndMax
  return $ number : rest
