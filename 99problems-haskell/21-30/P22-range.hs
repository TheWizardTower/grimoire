module Range  where

range :: Int -> Int -> [Int]
range start end = take (end - start + 1) (drop (start - 1) [1..])
