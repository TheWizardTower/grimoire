module P04_MyLength where

import           Data.List

myLength :: [a] -> Int
myLength xs = myLengthAcc xs 0

myLengthAcc :: [a] -> Int -> Int
myLengthAcc [] acc     = acc
myLengthAcc (x:xs) acc = myLengthAcc xs (acc + 1)


-- This fails with a type exception. Either fix or remove.
myAltLength :: (Num b, Foldable t) => t a -> b
myAltLength = foldl' (\acc x -> acc + 1) 0
