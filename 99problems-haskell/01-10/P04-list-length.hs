module MyLength where

import Data.List

myLength :: [a] -> Int
myLength xs = myLengthAcc xs 0

myLengthAcc :: [a] -> Int -> Int
myLengthAcc [] acc     = acc
myLengthAcc (x:xs) acc = myLengthAcc xs (acc + 1)

myAltLength = foldl' (\acc x -> acc + 1) 0
