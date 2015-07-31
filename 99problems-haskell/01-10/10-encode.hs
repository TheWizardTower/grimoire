module Encode where

encode :: (Num a, Eq b) => [b] -> [(a, b)]
-- encode [] = [(0, ?)]
encode [] = error "Cannot encode an empty list."
encode [x] = [(1, x)]
encode (x:xs) = encodeGo xs [(1, x)]
         
           
encodeGo :: (Num a, Eq b) => [b] -> [(a, b)] -> [(a, b)]
encodeGo [] acc                             = acc
encodeGo (x:xs) []                          = encodeGo xs [(1, x)]
encodeGo (x:xs) acc | x == snd ( last acc)  = encodeGo xs (init acc ++ [((fst (last acc) +1) , snd (last acc))])
                    | x /= snd ( last acc)  = encodeGo xs (acc ++ [(1, x)])

