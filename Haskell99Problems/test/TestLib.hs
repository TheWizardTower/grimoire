module TestLib where

import           Data.List
import           ListItem
import           NestedList
import           Test.Tasty.QuickCheck


listOf2 :: Gen a -> Gen [a]
listOf2 gen = sized $ \n ->
  do k <- choose (2,2 `max` n)
     vectorOf k gen

-- Use to write a property for flatten.
flattenStock :: NestedList a -> [a]
flattenStock (Elem x) = [x]
flattenStock (List x) = concatMap flattenStock x

stockCompress :: Eq a => [a] -> [a]
stockCompress = map head . group

stockEncode :: Eq a => [a] -> [(Int, a)]
stockEncode xs = map (\x -> (length x, head x)) (group xs)

stockEncodeModified :: Eq a => [a] -> [ListItem a]
stockEncodeModified = map encodeHelper . stockEncode
    where
      encodeHelper (1,x) = Single x
      encodeHelper (n,x) = Multiple n x


stockDecodeModified :: [ListItem a] -> [a]
stockDecodeModified = concatMap decodeHelper
    where
      decodeHelper (Single x)     = [x]
      decodeHelper (Multiple n x) = replicate n x

stockEncodeDirect :: (Eq a) => [a] -> [ListItem a]
stockEncodeDirect [] = []
stockEncodeDirect (x:xs) = stockEncodeDirect' 1 x xs
stockEncodeDirect' n y [] = [stockEncodeElement n y]
stockEncodeDirect' n y (x:xs) | y == x    = stockEncodeDirect' (n+1) y xs
                        | otherwise = stockEncodeElement n y : (stockEncodeDirect' 1 x xs)
stockEncodeElement 1 y = Single y
stockEncodeElement n y = Multiple n y

stockDupli :: [a] -> [a]
stockDupli = concatMap (replicate 2)

stockRepli :: [a] -> Int -> [a]
stockRepli xs n = concatMap (replicate n) xs

stockDropEvery :: [a] -> Int -> [a]
stockDropEvery [] _ = []
stockDropEvery (x:xs) n = stockDropEvery' (x:xs) n 1 where
    stockDropEvery' (x:xs) n i = (if (n `divides` i) then
        [] else
        [x])
        ++ (stockDropEvery' xs n (i+1))
    stockDropEvery' [] _ _ = []
    divides x y = y `mod` x == 0

stockSplit :: [a] -> Int -> ([a], [a])
stockSplit = flip splitAt

stockSlice :: [a] -> Int -> Int -> [a]
stockSlice xs i k | i>0 = take (k-i+1) $ drop (i-1) xs

stockRotate :: [a] -> Int -> [a]
stockRotate [] _ = []
stockRotate l 0 = l
stockRotate (x:xs) n = stockRotate (xs ++ [x]) (n-1)
-- stockRotate l n = stockRotate l (length l + n)
-- The above line actually causes an infinite loop. report.

stockRemoveAt :: Int -> [a] -> (a, [a])
stockRemoveAt k xs = case back of
        [] -> error "stockRemoveAt: index too large"
        x:rest -> (x, front ++ rest)
  where (front, back) = splitAt (k - 1) xs
