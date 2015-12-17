module P04_MyLength_Tests (myLengthSuite) where

import           P04_MyLength
import           Test.Tasty            (TestTree, testGroup)
import           Test.Tasty.HUnit
import           Test.Tasty.QuickCheck

myLengthSuite :: TestTree
myLengthSuite = testGroup "MyLength"
  [ testProperty "myLength is equivalent to length" $
     forAll (listOf arbitrary) $ ((\s -> (myLength s) == (length s)) :: [Int] -> Bool)
   , testProperty "myLength never gives a negative answer" $
     forAll (listOf arbitrary) $ ((\s -> (myLength s) >= 0) :: [Int] -> Bool)
  , testCase  "Length of [123, 456, 789] is 3" $
     (myLength [123,456,789]) @?= 3
  , testCase "myLength of \"Hello, world!\" is 13" $
     (myLength "Hello, world!") @?= 13
  ,  testProperty "myAltLength is equivalent to length" $
     forAll (listOf arbitrary) $ ((\s -> (myAltLength s) == (length s)) :: [Int] -> Bool)
   , testProperty "myAltLength never gives a negative answer" $
     forAll (listOf arbitrary) $ ((\s -> ((myAltLength s) >= 0)) :: [Int] -> Bool)
  , testCase  "myAltLength of [123, 456, 789] is 3" $
     (myAltLength [123,456,789]) @?= 3
  , testCase "Length of \"Hello, world!\" is 13" $
     (myAltLength "Hello, world!") @?= 13
  ]
