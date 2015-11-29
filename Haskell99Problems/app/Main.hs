{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell     #-}
module Main where

-- import Haskell99Problems
import           Test.QuickCheck
import           Test.QuickCheck.All

return []

main = $(quickCheckAll)
