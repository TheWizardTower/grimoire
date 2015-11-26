module ButLast where

getButLast :: [a] -> a
getButLast []       = error "Cannot call getButLast on empty array."
getButLast [x]      = error "Cannot call getButLast on array with one element."
getButLast [x,y]    = x
getButLast (x:y:xs) = getButLast (y:xs)
