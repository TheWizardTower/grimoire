module Compress where

compress :: Eq a => [a] -> [a]
compress [] = []
compress [x] = [x]
compress (x:xs) = compressGo (x:xs) []
         
           
compressGo :: Eq a => [a] -> [a] -> [a]
compressGo [] acc                      = acc
compressGo (x:xs) []                   = compressGo xs [x]
compressGo (x:xs) acc | x == last acc  = compressGo xs acc
                      | x /= last acc  = compressGo xs (acc ++ [x])

