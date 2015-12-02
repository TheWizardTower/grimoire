{-# LANGUAGE TemplateHaskell #-}
module P03_KthElement_Tests where

import           P03_KthElement
import           Test.HUnit
import           Test.QuickCheck

prop_equivalent_to_double_bang (NonEmpty xs) = forAll (choose (0, length xs -1)) $ (\s -> (elementAt xs s) == (xs !! (s - 1)))

test_listOfInt = TestCase $ assertEqual "The second element of [1,2,3] is 2." 2 (elementAt [1,2,3] 2)
test_string = TestCase $ assertEqual "The fifth letter of 'haskell' is 'e'." 'e' (elementAt "haskell" 5)

tests = TestList [TestLabel "elementAt [1,2,3] 2 == 2" test_listOfInt, TestLabel "elementAt \"haskell\" 5 == 'e'." test_string]

return []
runTests = do
  $quickCheckAll
  runTestTT tests
