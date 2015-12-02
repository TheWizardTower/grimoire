{-# LANGUAGE TemplateHaskell #-}
module P05_MyReverse_Tests where

import           P05_MyReverse
import           Test.HUnit
import           Test.QuickCheck

test_nonEmpty = TestCase $ assertEqual "Reverse of one-element list. is the identity function." [1] (myReverse [1])
test_threeElem = TestCase $ assertEqual "Reverse of [1,2,3] is [3,2,1]." [3,2,1] (myReverse [1,2,3])

test_empty = TestCase $ assertEqual "Reverse of empty list is the empty list." ([] :: [Int]) (myReverse [])

tests = TestList [TestLabel "" test_nonEmpty, TestLabel "" test_threeElem, TestLabel "" test_empty]

prop_reverse :: [Int] -> Bool
prop_reverse xs = xs == (myReverse (myReverse xs))

return []
runTests = do
  $quickCheckAll
  runTestTT tests
