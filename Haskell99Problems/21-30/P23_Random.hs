module P23_Random where

import System.Random
import P20_RemoveAt

selectElement :: Int -> Int -> IO Int
selectElement start end = getStdRandom $ randomR (start, end)

rnd_select :: [a] -> Int -> IO [a]
rnd_select list count = do
  randomIndex <- selectElement 0 $ length list
  let (elem, remainder) = removeAt randomIndex list
  rest <- rnd_select remainder $ count - 1
  return $ elem : rest
