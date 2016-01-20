module P26_Combinations where


combinatorial :: Int -> [a] -> [[a]]
combinatorial _ []     = [[]]
combinatorial 0  _     = [[]]
combinatorial k  x     | k > length x = error "Cannot choose more elements than in the list."
combinatorial _ [x]    = [[x]]
combinatorial k (x:xs) | k <  length (x:xs)  = map (x:) (combinatorial (k - 1) xs) ++ combinatorial k xs
                       | k == length (x:xs)  = [x:xs]
                       | k >  length (x:xs)  = error "Cannot choose more elements than in the list."
