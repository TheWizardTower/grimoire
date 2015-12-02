module P03_KthElement where

elementAt :: (Num b, Ord b) => [a] -> b -> a
elementAt _ x      | x <  0  = error "Cannot specify a negative index."
elementAt _ x      | x == 0  = error "Cannot specify zero-index, this function is one-indexed."

elementAt [] x     | x >= 1  = error "Specified index longer than list."
elementAt [y]    x | x >  1  = error "Specified index longer than list."
elementAt [y]    x | x == 1  = y
elementAt (y:ys) x | x == 1  = y
elementAt (y:ys) x | x >  1  = elementAt ys (x-1)
