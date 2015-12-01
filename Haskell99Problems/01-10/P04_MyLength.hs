{-# LANGUAGE BangPatterns #-}
module P04_MyLength where

import           Data.List

myLength :: [a] -> Int
myLength xs = myLengthAcc xs 0

myLengthAcc :: [a] -> Int -> Int
myLengthAcc [] acc     = acc
myLengthAcc (x:xs) acc = myLengthAcc xs (acc + 1)

myAltLength :: [a] -> Int
myAltLength [] = 0
myAltLength (x:xs) = foldl' (\ !acc _ -> acc + 1) 0 (x:xs)
