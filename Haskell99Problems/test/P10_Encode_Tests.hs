module P10_Encode_Tests (encodeSuite) where

import P10_Encode
import Data.List
import Test.Tasty
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck

stockEncode xs = map (\x -> (length x, head x)) (group xs)

encodeSuite :: TestTree
encodeSuite = testGroup "Encode"
  [ testProperty "Encode is equivalent to stock answer." $
    forAll (listOf1 arbitrarySizedIntegral) $ (\s -> (encode s) == (stockEncode s))
  , testCase "Encode test." $
    (encode "aaaabccaadeeee") @=? [(4,'a'),(1,'b'),(2,'c'),(2,'a'),(1,'d'),(4,'e')]
  ]
