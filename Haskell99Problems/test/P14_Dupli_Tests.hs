module P14_Dupli_Tests (dupliSuite) where

import           P14_Dupli
import           Test.Tasty
import           Test.Tasty.HUnit
import           Test.Tasty.QuickCheck
import           TestLib

dupliSuite :: TestTree
dupliSuite  = testGroup "P14_Dupli Tests"
  [ testProperty "dupli is equivalent to stock answer" $
    forAll (listOf arbitrarySizedIntegral) $ ((\s -> (dupli s) == (stockDupli s)) :: [Int] -> Bool)
  , testCase "dupli test case" $
    (dupli [1,2,3]) @=? [1,1,2,2,3,3]
  ]
