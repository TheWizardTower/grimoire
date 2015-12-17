module P12_Decode_Tests (decodeSuite) where

import           Data.List
import           ListItem
import           P11_EncodeModified
import           P12_Decode
import           Test.Tasty
import           Test.Tasty.HUnit
import           Test.Tasty.QuickCheck
import           TestLib

decodeSuite :: TestTree
decodeSuite = testGroup "Decode"
  [ testProperty "decodeModified equivalent to stock answer" $
    forAll (listOf1 arbitrarySizedIntegral) $ ((\s -> (decodeModified (stockEncodeModified s)) == (stockDecodeModified (stockEncodeModified s))) :: [Int] -> Bool)
  , testProperty "decodeModified . stockEncodeModified s == s" $
    forAll (listOf1 arbitrarySizedIntegral) $ ((\s -> (decodeModified (stockEncodeModified s) == s)) :: [Int] -> Bool)
  , testProperty "decodeModified . encodeModified s == s" $
    forAll (listOf1 arbitrarySizedIntegral) $ ((\s -> (decodeModified (encodeModified s) == s)) :: [Int] -> Bool)
  , testCase "Decode Test" $
    (decodeModified [Multiple 4 'a',Single 'b',Multiple 2 'c', Multiple 2 'a',Single 'd',Multiple 4 'e']) @=? "aaaabccaadeeee"
  ]
