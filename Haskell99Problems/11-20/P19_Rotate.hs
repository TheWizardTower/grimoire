module P19_Rotate where

rotate :: [a] -> Int -> [a]
rotate [] _ = []
rotate (x:xs) 0 = (x:xs)
rotate (x:xs) pivot | pivot > 0 = p2 ++ p1
                    | pivot < 0 = n2 ++ n1
                      where
                        p1 = take pivot (x:xs)
                        p2 = drop pivot (x:xs)
                        n1 = take (pivot + (length (x:xs))) (x:xs)
                        n2 = drop (pivot + (length (x:xs))) (x:xs)
