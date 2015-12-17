module P06_IsPalindrome_Tests (isPalindromeSuite) where

import           P06_IsPalindrome
import           Test.Tasty            (TestTree, testGroup)
import           Test.Tasty.HUnit
import           Test.Tasty.QuickCheck

isPalindromeSuite :: TestTree
isPalindromeSuite = testGroup "IsPalindrome"
  [testProperty "isPalindrome is equivalent to (xs == (reverse xs))" $
   forAll (listOf arbitrarySizedIntegral) ((\xs -> (isPalindrome xs) == (xs == (reverse xs))) :: [Int] -> Bool)
 , testCase "racecar is a palindrome" $
   isPalindrome "racecar" @?= True
 , testCase "1,2,3 is not a palindrome" $
   (isPalindrome [1,2,3]) @?= False
 , testCase "madamimadam is a palindrome" $
   isPalindrome "madamimadam" @?= True
 , testCase "[1,2,4,8,16,8,4,2,1] is a palindrome" $
   (isPalindrome [1,2,4,8,16,8,4,2,1]) @?= True
 ]
