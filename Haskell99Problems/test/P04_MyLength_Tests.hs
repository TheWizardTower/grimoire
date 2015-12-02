module P04_MyLength_Tests (myLengthSuite) where

import           P04_MyLength
import           Test.Tasty            (TestTree, testGroup)
import           Test.Tasty.HUnit
import           Test.Tasty.QuickCheck

myLengthSuite :: TestTree
myLengthSuite = testGroup "MyLength"
  [ testProperty "myLength is equivalent to length." $
     forAll (listOf arbitrary) $ ((\s -> (myLength s) == (length s)) :: [Int] -> Bool)
  , testCase  "Length of [123, 456, 789] is 3." $
     (myLength [123,456,789]) @?= 3
  , testCase "Length of \"Hello, world!\" is 13." $
     (myLength "Hello, world!") @?= 13
  ]
