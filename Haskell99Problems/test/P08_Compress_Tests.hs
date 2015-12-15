module P08_Compress_Tests (compressSuite) where

import           Data.List
import           P08_Compress
import           Test.Tasty            (TestTree, testGroup)
import           Test.Tasty.HUnit
import           Test.Tasty.QuickCheck
import           TestLib


compressSuite :: TestTree
compressSuite = testGroup "Compress"
  [ testProperty "compress xs is equivalent to map head . group xs" $
    forAll (listOf1 arbitrarySizedIntegral) $ ((\s -> (compress s) == (stockCompress  s)) :: [Int] -> Bool)
  , testCase "compress \"aaaabccaadeeee\" == \"abcade\"" $
    (compress "aaaabccaadeeee") @?= "abcade"
  , testCase "compress [] == []." $
    (compress [] :: [Int]) @?= []
  ]
