{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell     #-}

-- import Haskell99Problems
import           P01_GetLast_Tests
import           P02_ButLast_Tests
import           P03_KthElement_Tests
import           P04_MyLength_Tests
import           P05_MyReverse_Tests

return []
main = do
  P01_GetLast_Tests.runTests
  P02_ButLast_Tests.runTests
  P03_KthElement_Tests.runTests
  P04_MyLength_Tests.runTests
  P05_MyReverse_Tests.runTests
