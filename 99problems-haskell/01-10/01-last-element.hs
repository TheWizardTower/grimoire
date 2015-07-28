module GetLast where
getLast :: [a] -> a
getLast []     = error "Cannot get last element of empty list."
getLast [x]    = x
getLast (x:xs) = getLast xs
