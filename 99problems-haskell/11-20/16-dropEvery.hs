module DropEvery where

dropEvery :: [a] -> Int -> [a]
dropEvery xs 0 = xs
dropEvery xs count = dropEveryGo xs count 1 

dropEveryGo :: [a] -> Int -> Int -> [a]
dropEveryGo [x] skip acc    | skip == acc = []
                            | skip >= acc = [x]
dropEveryGo (x:xs) skip acc | skip == acc = dropEveryGo xs skip 1
                            | skip >= acc = x : dropEveryGo xs skip (acc + 1)
