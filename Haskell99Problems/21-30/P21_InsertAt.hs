module P21_InsertAt where

insertAt ::  a -> [a] -> Int -> [a]
insertAt _ [] _      = error "Cannot remove element from empty list."
insertAt a  (x:xs) 0 = (a:x:xs)
insertAt elem (x:xs) index = p1 ++ [elem] ++ p2
              where
                p1 = take (index - 1) (x:xs)
                p2 = drop (index - 1) (x:xs)
