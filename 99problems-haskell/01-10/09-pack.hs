module Pack where

pack :: Eq a => [a] -> [[a]]
pack [] = [[]]
pack [x] = [[x]]
pack (x:xs) = packGo (x:xs) [[]]
         
           
packGo :: Eq a => [a] -> [[a]] -> [[a]]
packGo [] acc                              = acc
packGo (x:xs) [[]]                         = packGo xs [[x]]
packGo (x:xs) acc | x == head ( last acc)  = packGo xs (init acc ++ [last acc ++ [x]])
                  | x /= head ( last acc)  = packGo xs (acc ++ [[x]])

