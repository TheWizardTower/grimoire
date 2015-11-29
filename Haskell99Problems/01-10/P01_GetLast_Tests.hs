module P01_GetLast_Test where

import           P01_GetLast
import           Test.QuickCheck

prop_equivalent_to_last = forAll (listOf1 arbitrary) $ (\s -> (getLast s) == (last s))
