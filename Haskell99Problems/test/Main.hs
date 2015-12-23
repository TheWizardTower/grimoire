import           P01_GetLast_Tests
import           P02_ButLast_Tests
import           P03_KthElement_Tests
import           P04_MyLength_Tests
import           P05_MyReverse_Tests
import           P06_IsPalindrome_Tests
import           P07_Flatten_Tests
import           P08_Compress_Tests
import           P09_Pack_Tests
import           P10_Encode_Tests
import           P11_EncodeModified_Tests
import           P12_Decode_Tests
import           P13_EncodeDirect_Tests
import           P14_Dupli_Tests
import           P15_Replicate_Tests
import           P16_DropEvery_Tests
import           P17_Split_Tests
import P18_Slice_Tests
import           Test.Tasty


main :: IO ()
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
            , encodeSuite
            , encodeModifiedSuite
            , decodeSuite
            , encodeDirectSuite
            , dupliSuite
            , replicateSuite
            , dropEverySuite
            , splitSuite
            , sliceSuite
            ]
