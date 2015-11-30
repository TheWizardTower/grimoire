{-# LANGUAGE TemplateHaskell #-}
module P02_ButLast_Tests where

import           P02_ButLast
import           Test.HUnit
import           Test.QuickCheck

listOf2 :: Gen a -> Gen [a]
listOf2 gen = sized $ \n ->
  do k <- choose (2,2 `max` n)
     vectorOf k gen

prop_equivalent_to_last_init = forAll (listOf2 arbitrary) $ ((\s -> (getButLast s) == (last (init s))) :: [Int] -> Bool)

test_listOfInt = TestCase $ assertEqual "Second to last element in [1,2,3,4] is 3." 3 (getButLast [1,2,3,4])
test_alphabet = TestCase $ assertEqual "Second to last letter is 'y'." 'y' (getButLast ['a'..'z'])

tests = TestList [TestLabel "getButLast [1..4] == 3" test_listOfInt, TestLabel "getButLast ['a'..'z'] == 'y'" test_alphabet]

return []
runTests = do
  $quickCheckAll
  runTestTT tests
