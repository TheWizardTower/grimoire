{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell     #-}
module Main where

-- import Haskell99Problems
import           P01_GetLast_Tests
import           P05_MyReverse_Tests
import           Test.QuickCheck
import           Test.QuickCheck.All

return []
main = do
  P01_GetLast_Tests.runTests
  P05_MyReverse_Tests.runTests
