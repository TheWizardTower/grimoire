module P11_EncodeModified_Tests (encodeModifiedSuite) where

import           Data.List
import           ListItem
import           NestedList
import           P11_EncodeModified
import           Test.Tasty
import           Test.Tasty.HUnit
import           Test.Tasty.QuickCheck
import           TestLib

encodeModifiedSuite :: TestTree
encodeModifiedSuite = testGroup "Encode Modified"
  [ testProperty "Encode Modified Equivalent to given answer." $
    forAll (listOf1 arbitrarySizedIntegral) $ (\s -> (encodeModified s) == (stockEncodeModified s))
  , testCase "Encode Modified Test Case" $
    (encodeModified "aaaabccaadeeee") @=? [Multiple 4 'a',Single 'b',Multiple 2 'c', Multiple 2 'a',Single 'd',Multiple 4 'e']
  ]
