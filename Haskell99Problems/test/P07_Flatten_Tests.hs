module P07_Flatten_Tests (flattenSuite) where

import           NestedList
import           P07_Flatten
import           Test.Tasty       (TestTree, testGroup)
import           Test.Tasty.HUnit

flattenSuite :: TestTree
flattenSuite = testGroup "Flatten"
  [ testCase "Flatten of (a (b (c d) e)) is (a b c d e)" $
    (flatten (List [Elem 1, List [Elem 2, List [Elem 3, Elem 4], Elem 5]])) @?= [1, 2, 3, 4, 5]
  , testCase "Flatten of [] == []" $
    (flatten (List [] :: NestedList Int)) @?= []
  ]
