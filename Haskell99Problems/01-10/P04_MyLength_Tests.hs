{-# LANGUAGE TemplateHaskell #-}
module P04_MyLength_Tests where

import           P04_MyLength
import           Test.HUnit
import           Test.QuickCheck

prop_equivalent_to_length = forAll (listOf arbitrary) $ ((\s -> (myLength s) == (length s)) :: [Int] -> Bool)

test_listOfInt = TestCase $ assertEqual "Length of [123, 456, 789] is 3." 3 (myLength [123,456,789])
test_string = TestCase $ assertEqual "Length of \"Hello, world!\" is 13." 13 (myLength "Hello, world!")

tests = TestList [TestLabel "myLength [123,456,789] == 3" test_listOfInt, TestLabel "myLength \"Hello, world!\" == 13" test_string]

return []
runTests = do
  $quickCheckAll
  runTestTT tests
