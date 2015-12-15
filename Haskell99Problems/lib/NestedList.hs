module NestedList where

data NestedList a = Elem a | List [NestedList a]
