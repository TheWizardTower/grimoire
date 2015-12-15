module P11_EncodeModified_Tests (encodeModifiedSuite) where

import P11_EncodeModified
import Data.List
import Test.Tasty
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck

stockEncode xs = map (\x -> (length x, head x)) (group xs)

stockEncodeModified :: Eq a => [a] -> [ListItem a]
stockEncodeModified = map encodeHelper . stockEncode
    where
      encodeHelper (1,x) = Single x
      encodeHelper (n,x) = Multiple n x

encodeModifiedSuite :: TestTree
encodeModifiedSuite = testGroup "Encode Modified"
  [ testProperty "Encode Modified Equivalent to given answer." $
    forAll (listOf1 arbitrarySizedIntegral) $ (\s -> (encodeModified s) == (stockEncodeModified s))
  , testCase "Encode Modified Test Case" $
    (encodeModified "aaaabccaadeeee") @=? [Multiple 4 'a',Single 'b',Multiple 2 'c', Multiple 2 'a',Single 'd',Multiple 4 'e']
  ]
