module TestLib where

import           Data.List
import           ListItem
import           NestedList
import           Test.Tasty            (TestTree, testGroup)
import           Test.Tasty.HUnit
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
