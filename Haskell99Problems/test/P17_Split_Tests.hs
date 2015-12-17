module P17_Split_Tests (splitSuite) where

import           P17_Split
import           Test.Tasty
import           Test.Tasty.HUnit
import           Test.Tasty.QuickCheck
import           TestLib

splitSuite :: TestTree
splitSuite = testGroup "P17_Split Tests"
  [ testProperty "split is equivalent to stockSplit" $
    forAll (listOf1 arbitrarySizedIntegral) $ \xs ->
    forAll (choose (1,(length xs))) $ \i ->
    ((split xs i) == (stockSplit xs i))
  , testProperty "re-assembling the split lists results in the original list" $
    forAll (listOf1 arbitrarySizedIntegral) $ \xs ->
    forAll (choose (1,(length xs))) $ \i ->
    (((fst (split xs i)) ++ (snd (split xs i))) == xs)
  , testCase "split \"abcdefghik\" 3 == (\"abc\", \"defghik\")" $
    (split "abcdefghik" 3) @=? ("abc", "defghik")
  ]
