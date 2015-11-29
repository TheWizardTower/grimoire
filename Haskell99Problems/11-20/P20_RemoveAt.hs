module P20_RemoveAt where

removeAt :: Int -> [a] -> (a, [a])
removeAt _      [] = error "Cannot remove element from empty list."
removeAt 0     (x:xs) = (x, xs)
removeAt index (x:xs) = (element, array)
               where
                 element = head (drop (index - 1) (x:xs))
                 array = take (index - 1) (x:xs) ++ drop index (x:xs)
