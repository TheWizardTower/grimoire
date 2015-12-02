module P05_MyReverse_Tests where

import           P05_MyReverse
import           Test.Tasty            (TestTree, testGroup)
import           Test.Tasty.HUnit
import           Test.Tasty.QuickCheck

myReverseSuite :: TestTree
myReverseSuite = testGroup "myReverse"
  [ testProperty "myReverse is equivalent to reverse." $
    ((\xs -> (myReverse xs) == (reverse xs)) :: [Int] -> Bool)
  , testProperty "(myReverse . myReverse xs) == xs" $
    ((\xs -> (myReverse (myReverse xs)) == xs) :: [Int] -> Bool)
  , testCase "Reverse of one-element list is the identity function." $
    (myReverse [1]) @?= [1]
  , testCase "Reverse of [1,2,3] is [3,2,1]."$
    (myReverse [1,2,3]) @?= [3,2,1]
  ]
