module P02_ButLast_Tests where

import           P02_ButLast
import           Test.Tasty            (TestTree, testGroup)
import           Test.Tasty.HUnit
import           Test.Tasty.QuickCheck
import           TestLib

butLastSuite :: TestTree
butLastSuite = testGroup "getButLast test suite."
  [ testProperty "butLast is equivalent to last . init." $
    forAll (listOf2 arbitrary) $ ((\s -> (getButLast s) == (last (init s))) :: [Int] -> Bool)
  , testCase "Second to last element in [1,2,3,4] is 3." $
    (getButLast [1,2,3,4]) @?= 3
  , testCase "Second to last letter in lowecase alphabet is 'y'." $
    (getButLast ['a'..'z']) @?= 'y'
  ]
