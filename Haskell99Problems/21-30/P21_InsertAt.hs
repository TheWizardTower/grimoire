module P21_InsertAt where

insertAt ::  a -> [a] -> Int -> [a]
insertAt _ [] _            = error "Cannot insert element into empty list."
insertAt elem  (x:xs) 0    = (elem:x:xs
insertAt elem (x:xs) index = p1 ++ [elem] ++ p2
              where
                p1 = take (index - 1) (x:xs)
                p2 = drop (index - 1) (x:xs)
