module P08_Compress_Tests (compressSuite) where

import           P08_Compress
import           Data.List
import           Test.Tasty            (TestTree, testGroup)
import           Test.Tasty.HUnit
import           Test.Tasty.QuickCheck


myCompress :: Eq a => [a] -> [a]
myCompress = map head . group

compressSuite :: TestTree
compressSuite = testGroup "Compress"
  [ testProperty "compress xs is equivalent to map head . group xs" $
    forAll (listOf1 arbitrarySizedIntegral) $ ((\s -> (compress s) == (myCompress  s)) :: [Int] -> Bool)
  , testCase "compress \"aaaabccaadeeee\" == \"abcade\"" $
    (compress "aaaabccaadeeee") @?= "abcade"
  , testCase "compress [] == []." $
    (compress [] :: [Int]) @?= []
  ]
