module ListItem where

import           Data.List

data ListItem a = Single a | Multiple Int a
  deriving (Show, Eq)
