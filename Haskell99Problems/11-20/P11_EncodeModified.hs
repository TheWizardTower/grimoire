module P11_EncodeModified where

import           ListItem

encodeModified :: Eq a => [a] -> [ListItem a]
encodeModified [] = error "Cannot call encodeModified on an empty list."
encodeModified [x] = [Single x]
encodeModified (x:xs) = encodeLetter xs 1 x


encodeLetter :: Eq a => [a] -> Int -> a -> [ListItem a]
encodeLetter [] count a                = [makeListItem count a]
encodeLetter [x] count a    | a == x   = encodeLetter [] (count + 1) a
                            | a /= x   = makeListItem count a : encodeLetter [] 1 x
encodeLetter (x:xs) count a | a == x   = encodeLetter xs (count + 1) a
                            | a /= x   = makeListItem count a : encodeLetter xs 1 x

makeListItem :: Eq a =>  Int -> a -> ListItem a
makeListItem count a | count == 1 = Single a
                     | count >  1 = Multiple count a
