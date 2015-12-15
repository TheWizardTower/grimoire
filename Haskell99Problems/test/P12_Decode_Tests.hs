module P12_Decode_Tests (decodeSuite) where

import           Data.List
import           ListItem
import           P12_Decode
import           Test.Tasty
import           Test.Tasty.HUnit
import           Test.Tasty.QuickCheck
import           TestLib

decodeSuite :: TestTree
decodeSuite = testGroup "Decode"
  [ testCase "Decode Test" $
    (decodeModified [Multiple 4 'a',Single 'b',Multiple 2 'c', Multiple 2 'a',Single 'd',Multiple 4 'e']) @=? "aaaabccaadeeee"
  ]
