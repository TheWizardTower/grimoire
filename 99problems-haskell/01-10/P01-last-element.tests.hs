-- import GetLast
import           Test.QuickCheck

prop_equivalent_to_last = forAll (listOf1 arbitrary) $ (\s -> (getLast s) == (last s))
