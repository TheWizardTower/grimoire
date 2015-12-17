module P13_EncodeDirect_Tests (encodeDirectSuite) where

import           ListItem
import           P12_Decode
import           P13_EncodeDirect
import           Test.Tasty
import           Test.Tasty.HUnit
import           Test.Tasty.QuickCheck
import           TestLib

encodeDirectSuite :: TestTree
encodeDirectSuite = testGroup "P13_EncodeDirect Tests"
  [ testProperty "encodeDirect equivalent to stock answer" $
    forAll (listOf1 arbitrarySizedIntegral) $ ((\s -> (encodeDirect s) == (stockEncodeDirect s)) :: [Int] -> Bool)
  , testProperty "decodeModified (stockEncodeDirect s) == s" $
    forAll (listOf1 arbitrarySizedIntegral) $ ((\s -> (decodeModified (stockEncodeDirect s)) == s) :: [Int] -> Bool)
  , testProperty "decodeModified (encodeDirect s) == s" $
    forAll (listOf1 arbitrarySizedIntegral) $ ((\s -> (decodeModified (encodeDirect s)) == s) :: [Int] -> Bool)
  , testCase "encodeDirect test case" $
    (encodeDirect "aaaabccaadeeee") @=? [Multiple 4 'a',Single 'b',Multiple 2 'c', Multiple 2 'a',Single 'd',Multiple 4 'e']

  ]
