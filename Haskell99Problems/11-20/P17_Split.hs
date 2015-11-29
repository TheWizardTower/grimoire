module P17_Split where

split :: [a] -> Int -> ([a], [a])
split [] _ = error "Cannot split an empty list."
split [x] count | count == 0 = ([], [x])
                | count == 1 = ([x], [])
                | count >  1 = error "Split index longer than list."

split (x:xs) index = splitGo []  (x:xs) index

splitGo :: [a] -> [a] -> Int -> ([a], [a])
splitGo ys [] index | index >  0 = error "Split index longer than array."
                    | index == 0 = (ys, [])
splitGo ys (x:xs) index | index == 0 = (ys, x:xs)
                        | index >  0 = splitGo (ys ++ [x]) xs (index - 1)

