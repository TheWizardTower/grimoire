module P09_Pack_Tests (packSuite) where

import           P09_Pack
-- import           Data.List
import           Test.Tasty            (TestTree, testGroup)
import           Test.Tasty.HUnit


packSuite :: TestTree
packSuite = testGroup "Pack"
  [ testCase "Array test" $
     (pack ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a',  'a', 'd', 'e', 'e', 'e', 'e']) @?= ["aaaa","b","cc","aa","d","eeee"]
  , testCase "Null test" $
    (pack []) @?= ([[]] :: [[Int]])
  ]
