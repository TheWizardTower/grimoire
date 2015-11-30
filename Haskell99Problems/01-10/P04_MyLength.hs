{-# LANGUAGE BangPatterns #-}
module P04_MyLength where

import           Data.List

myLength :: [a] -> Int
myLength xs = myLengthAcc xs 0

myLengthAcc :: [a] -> Int -> Int
myLengthAcc [] acc     = acc
myLengthAcc (x:xs) acc = myLengthAcc xs (acc + 1)

myAcc :: (Num acc) => acc -> a -> acc
myAcc !acc _ = acc + 1

myAltLength :: (Num b, Foldable t) => t a -> b
myAltLength = foldl' myAcc 0
