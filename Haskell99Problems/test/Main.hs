{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell     #-}

import           P01_GetLast_Tests
import           P02_ButLast_Tests
import           P03_KthElement_Tests
import           P04_MyLength_Tests
-- import           P05_MyReverse_Tests
import           Test.Tasty
import           Test.Tasty.HUnit
import           Test.Tasty.QuickCheck as QC
import           Test.Tasty.SmallCheck as SC



return []
main = defaultMain tests


tests :: TestTree
tests = testGroup "All Tests"
            [ getLastSuite
            , butLastSuite
            , kthElementSuite
            , myLengthSuite
            ]
