{-# LANGUAGE ScopedTypeVariables #-}
module P20_RemoveAt_Tests (removeAtSuite) where

import           P20_RemoveAt
import           Test.Tasty
import           Test.Tasty.QuickCheck
import           TestLib

removeAtSuite :: TestTree
removeAtSuite = testGroup "P20_RemoveAt Tests"
  [ testProperty "removeAt is equivalent to stockRemoveAt" $
    forAll (listOf1 arbitrarySizedIntegral) $ \(xs :: [Int]) ->
    forAll (choose (1, length xs - 1)) $ \i ->
    (removeAt i xs) == (stockRemoveAt i xs)
  ]
