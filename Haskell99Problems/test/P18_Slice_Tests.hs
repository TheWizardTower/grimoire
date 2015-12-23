{-# LANGUAGE ScopedTypeVariables #-}
module P18_Slice_Tests (sliceSuite) where

import           P18_Slice
import           Test.Tasty
import           Test.Tasty.HUnit
import           Test.Tasty.QuickCheck
import           TestLib


sliceSuite :: TestTree
sliceSuite = testGroup "P18_Slice Tests"
  [ testProperty "Slice is equivalent to stockSlice" $
    forAll (listOf2 arbitrarySizedIntegral) $ \(xs :: [Int]) ->
    forAll (choose (1, length xs - 1)) $ \i ->
    forAll (choose (i + 1, length xs)) $ \j ->
    slice xs (min i j) (max i j) == stockSlice xs (min i j) (max i j)
  , testCase "slice passes Haskell 99 test case" $
    slice "abcdefghijk" 3 7 @=? "cdefg"
  ]
