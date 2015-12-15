module P01_GetLast_Tests (getLastSuite) where

import           P01_GetLast
import           Test.Tasty            (TestTree, testGroup)
import           Test.Tasty.HUnit
import           Test.Tasty.QuickCheck (arbitrary, forAll, listOf1)
import qualified Test.Tasty.QuickCheck as QC

getLastSuite :: TestTree
getLastSuite = testGroup "Tests" [properties, unitTests]

properties :: TestTree
properties = testGroup "Tests" [qcProps]

-- scProps = testGroup "(checked by SmallCheck)"
--   [ SC.testProperty "myLast equals Last" $
--       forAll (listOf1 arbitrary) $ ( (\s -> (getLast s) == (last s)) :: [Int] -> Bool)
--   ]

qcProps = testGroup "(checked by QuickCheck)"
  [ QC.testProperty "myLast equals Last" $
      forAll (listOf1 arbitrary) $ ( (\s -> (getLast s) == (last s)) :: [Int] -> Bool)
  ]


unitTests = testGroup "Unit tests"
  [ testCase "Last element in List of Int" $
    (getLast [1,2,3,4]) @?= 4
  , testCase "Last element in List of Char" $
    (getLast ['x','y','z']) @?= 'z'
  ]
