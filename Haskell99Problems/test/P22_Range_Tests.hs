module P22_Range_Tests (rangeSuite) where

import           P22_Range
import           Test.Tasty
import           Test.Tasty.HUnit
import           Test.Tasty.QuickCheck
import           TestLib

rangeSuite :: TestTree
rangeSuite = testGroup "P22_Range Tests"
  [ testProperty "range is equivalent to stockRange" $
    forAll (choose (1, 100)) $ \x ->
    forAll (choose (1, 100)) $ \y ->
    range x y == stockRange x y
  , testCase "Test Case from Haskell 99 Website" $
    range 4 9 @=? [4,5,6,7,8,9]
  ]
