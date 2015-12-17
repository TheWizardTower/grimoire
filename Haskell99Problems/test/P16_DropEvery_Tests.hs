module P16_DropEvery_Tests (dropEverySuite) where

import           P16_DropEvery
import           Test.Tasty
import           Test.Tasty.HUnit
import           Test.Tasty.QuickCheck
import           TestLib

dropEverySuite :: TestTree
dropEverySuite  = testGroup "P16_DropEvery Tests"
  [ testProperty "dropEvery equivalent to stockDropEvery" $
    forAll (listOf1 arbitrarySizedIntegral) $ \xs ->
    forAll (choose (1, ((length xs)))) $ \i ->
    ((dropEvery xs i) == (stockDropEvery xs i))
  , testCase "dropEvery \"abcdefghik\" 3 == \"abdeghk\"" $
    (dropEvery "abcdefghik" 3) @=? "abdeghk"
  ]
