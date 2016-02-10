-- Find a place for this and use it.

-- | Test with QuickCheck and SmallCheck
tp name prop = testGroup name
    [ QC.testProperty "QC" prop
    , SC.testProperty "SC" prop
    ]
