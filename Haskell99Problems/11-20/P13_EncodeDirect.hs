module P13_EncodeDirect where

import           ListItem

encodeDirect :: Eq a => [a] -> [ListItem a]
encodeDirect [] = error "Cannot call encodeDirect on an empty list."
encodeDirect [x] = [Single x]
encodeDirect (x:xs) = encodeLetter xs 1 x


encodeLetter :: Eq a => [a] -> Int -> a -> [ListItem a]
encodeLetter [] count a                = [makeListItem count a]
encodeLetter [x] count a    | a == x   = encodeLetter [] (count + 1) a
                            | a /= x   = makeListItem count a : encodeLetter [] 1 x
encodeLetter (x:xs) count a | a == x   = encodeLetter xs (count + 1) a
                            | a /= x   = makeListItem count a : encodeLetter xs 1 x

makeListItem :: Eq a =>  Int -> a -> ListItem a
makeListItem count a | count == 1 = Single a
                     | count >  1 = Multiple count a
