module Palindrome where

firstCharacter string = head string
lastCharacter string = string !! (length string - 1)

innerCharacters string = tail (take (length string - 1) string)

oneCharacterOrLess string = if length string < 2 then True else False

isPalindrome string = if oneCharacterOrLess string then True else
  (firstCharacter string == lastCharacter string
  && isPalindrome (innerCharacters string))
