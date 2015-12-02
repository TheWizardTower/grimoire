module P03_KthElement_Tests where

import           P03_KthElement
import           Test.Tasty            (TestTree, testGroup)
import           Test.Tasty.HUnit
import           Test.Tasty.QuickCheck

kthElementSuite :: TestTree
kthElementSuite = testGroup "Kth Element"
  [ testProperty "elementAt xs s is equivalent to xs !! (s - 1)." $
    forAll (listOf1 arbitrarySizedIntegral) $ \xs ->
    forAll (choose (1,length xs)) $ \s ->
    ((elementAt xs s) == (xs !! (s - 1)))
  , testCase "The fifth letter of 'haskell' is 'e'." $
    (elementAt "haskell" 5) @?= 'e'
  , testCase  "The second element of [1,2,3] is 2." $
     (elementAt [1,2,3] 2) @?= 2
  ]
