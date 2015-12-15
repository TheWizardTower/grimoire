module P12_Decode where

import           ListItem

decodeModified :: [ListItem a] -> [a]
decodeModified [] = error "Cannot decode empty list"
decodeModified [x] = buildList x
decodeModified (x:xs) = buildList x ++ decodeModified xs

buildList :: ListItem a -> [a]
buildList (Single a)     = [a]
buildList (Multiple n a) = replicate n  a
