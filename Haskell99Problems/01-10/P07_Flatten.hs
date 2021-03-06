module P07_Flatten where

import           NestedList
-- For the record, I had to look at the answer for this one.
-- I was nearly there. I just couldn't get (x:xs) to work in the (List ) call.
-- For some reason, the type signatures never worked.

flatten :: NestedList a -> [a]
flatten (Elem a   )   = [a]
flatten (List (x:xs)) = flatten x ++ flatten (List xs)
flatten (List [])     = []
