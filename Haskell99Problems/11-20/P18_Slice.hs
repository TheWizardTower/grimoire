module P18_Slice where

slice :: [a] -> Int -> Int -> [a]
slice [] _ _ = error "Cannot slice an empty list."
slice _ start end | end <= start = error "Slice end index less than or equal to start index."
slice xs start end = sliceGo xs start end


sliceGo :: [a] -> Int -> Int -> [a]
sliceGo [] _ end | end == 1 = []
                 | end >  1 = error "Slice end index past end of array."
sliceGo (x:xs) start end | start > 1 && end > start = sliceGo xs (start - 1) (end - 1)
                         | start == 1 && end > 1 = take end (x:xs)
