import           P01_GetLast_Tests
import           P02_ButLast_Tests
import           P03_KthElement_Tests
import           P04_MyLength_Tests
import           P05_MyReverse_Tests
import           P06_IsPalindrome_Tests
import           P07_Flatten_Tests
import           P08_Compress_Tests
import           P09_Pack_Tests
import           Test.Tasty
import           Test.Tasty.HUnit
import           Test.Tasty.QuickCheck as QC
import           Test.Tasty.SmallCheck as SC


main = defaultMain tests


tests :: TestTree
tests = testGroup "All Tests"
            [ getLastSuite
            , butLastSuite
            , kthElementSuite
            , myLengthSuite
            , myReverseSuite
            , isPalindromeSuite
            , flattenSuite
            , compressSuite
            , packSuite
            ]
