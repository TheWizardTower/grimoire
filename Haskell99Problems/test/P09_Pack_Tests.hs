module P09_Pack_Tests (packSuite) where

import           Data.List
import           P09_Pack
import           Test.Tasty            (TestTree, testGroup)
import           Test.Tasty.HUnit
import           Test.Tasty.QuickCheck


packSuite :: TestTree
packSuite = testGroup "Pack"
  [ testProperty "Pack is equivalent to group" $
    forAll (listOf1 arbitrarySizedIntegral) $ (\s -> (pack s) == (group s))
  , testCase "Array test" $
     (pack ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a',  'a', 'd', 'e', 'e', 'e', 'e']) @?= ["aaaa","b","cc","aa","d","eeee"]
  , testCase "Null test" $
    (pack []) @?= ([[]] :: [[Int]])
  ]
