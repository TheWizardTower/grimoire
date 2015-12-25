module P25_Permute where

import P20_RemoveAt
import SelectElement

permute :: [a] -> IO [a]
permute [] = return []
permute list = do
  randomIndex <- selectElement 0 $ length list
  let (elem, remainder) = removeAt randomIndex list
  rest <- permute remainder
  return $ elem : rest
