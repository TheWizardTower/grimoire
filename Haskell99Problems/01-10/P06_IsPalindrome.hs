module P06_IsPalindrome where

isPalindrome :: Eq a => [a] -> Bool
isPalindrome []       = True
isPalindrome (x:[])   = True
isPalindrome (xs)     = (head xs) == (last xs) && (isPalindrome $ init $ tail xs)
