module P15_Replicate_Tests (replicateSuite) where

import           P15_Replicate
import           Test.Tasty
import           Test.Tasty.HUnit
import           Test.Tasty.QuickCheck
import           TestLib

replicateSuite :: TestTree
replicateSuite  = testGroup "P15_Replicate Tests"
  [ testProperty "replicate is equivalent to stockReplicate" $
    forAll (listOf arbitrarySizedIntegral) $ \xs ->
    forAll (choose (0,10)) $ \i ->
    ((repli xs i) == (stockRepli xs i))
  , testProperty "length (repli xs i) == (length xs) * i" $
    forAll (listOf arbitrarySizedIntegral) $ \xs ->
    forAll (choose (0,10)) $ \i ->
    ((length (repli xs i)) == ((length xs) * i))
  , testCase "repli \"abc\" 3 == \"aaabbbccc\"" $
    (repli "abc" 3) @=? "aaabbbccc"
  ]
