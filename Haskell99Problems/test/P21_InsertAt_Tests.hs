{-# LANGUAGE ScopedTypeVariables #-}
module P21_InsertAt_Tests (insertAtSuite) where

import           P21_InsertAt
import           Test.Tasty
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck
import TestLib

insertAtSuite :: TestTree
insertAtSuite = testGroup "P21_InsertAt Tests"
  [ testProperty "insertAt is equivalent to stockInsertAt" $
    forAll (choose (1, 100)) $ \elem ->
    forAll (listOf1 arbitrarySizedIntegral) $ \(xs :: [Int]) ->
    forAll (choose (1, length xs)) $ \index ->
    insertAt elem xs index == stockInsertAt elem xs index
  , testCase "Test Case from Haskell 99 Site" $
     insertAt 'X' "abcd" 2 @=? "aXbcd"
  ]
