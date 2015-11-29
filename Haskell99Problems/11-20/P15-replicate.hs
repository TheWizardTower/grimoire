module Repli where

repli :: [a] -> Int -> [a]
repli [] _      = []
repli [x] count = myRepeat x count
repli (x:xs) count = myRepeat x count ++ repli xs count

myRepeat :: a -> Int -> [a]
myRepeat a count | count == 0 = []
                 | count == 1 = [a]
                 | count >  1 = a : myRepeat a (count - 1)
