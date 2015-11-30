{-# LANGUAGE TemplateHaskell #-}
module P01_GetLast_Tests where

import           P01_GetLast
import           Test.HUnit
import           Test.QuickCheck

test_nonEmptyIntList = TestCase $ assertEqual "Last element in [1,2,3,4] is 4." 4 (getLast [1,2,3,4])
test_nonEmptyCharList = TestCase $ assertEqual "Last element in ['x','y','z'] is 'z'." 'z' (getLast ['x','y','z'])


tests = TestList [TestLabel "Non Empty Int List" test_nonEmptyIntList, TestLabel "Non Empty Char List" test_nonEmptyCharList]

prop_equivalent_to_last = forAll (listOf1 arbitrary) $ ( (\s -> (getLast s) == (last s)) :: [Int] -> Bool)


return []
runTests = do
  $quickCheckAll
  runTestTT tests
