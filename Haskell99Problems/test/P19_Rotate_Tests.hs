{-# LANGUAGE ScopedTypeVariables #-}
module P19_Rotate_Tests (rotateSuite) where

import           P19_Rotate
import           Test.Tasty
import           Test.Tasty.HUnit
import           Test.Tasty.QuickCheck
import           TestLib

rotateSuite :: TestTree
rotateSuite = testGroup "P19_Rotate Tests"
  [ testProperty "rotate is equivalent to stockRotate" $
    forAll (listOf1 arbitrarySizedIntegral) $ \(xs :: [Int]) ->
    forAll (choose (0, length xs)) $ \i ->
    rotate xs i == stockRotate xs i
  , testCase "Rotate test case 1 from 99 problems spec" $
    rotate "abcdefgh" 3 @=? "defghabc"
  , testCase "Rotate test case 2 from 99 problems spec" $
   rotate "abcdefgh" (-2) @=? "ghabcdef"
  ]
