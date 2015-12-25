module P23_Random where

import SelectElement
import System.Random
import P20_RemoveAt

rnd_select :: [a] -> Int -> IO [a]
rnd_select _ 0 = return []
rnd_select list count = do
  randomIndex <- selectElement 0 $ length list
  let (elem, remainder) = removeAt randomIndex list
  if count == 0 then return $ elem : []
    else do
      rest <- rnd_select remainder $ count - 1
      return $ elem : rest
