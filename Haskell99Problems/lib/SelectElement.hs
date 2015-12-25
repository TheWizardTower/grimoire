module SelectElement where

import System.Random

selectElement :: Int -> Int -> IO Int
selectElement start end = getStdRandom $ randomR (start, end)
