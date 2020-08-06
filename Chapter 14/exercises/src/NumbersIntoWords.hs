--from chapter 8

module NumbersIntoWords where

digitToWord :: Int -> String
digitToWord n = case n of
  0         -> "zero"
  1         -> "one"
  2         -> "two"
  3         -> "three"
  4         -> "four"
  5         -> "five"
  6         -> "six"
  7         -> "seven"
  8         -> "eight"
  9         -> "nine"
  otherwise -> error "not a digit"

digits :: Int -> [Int]
digits n
  | n == 0    = []
  | otherwise = (digits.dropLastDigit $ n) ++ [lastDigit n]
  where lastDigit     n = mod n 10
        dropLastDigit n = div n 10

wordNumber :: Int -> String
wordNumber n = wordListOfNumbers $ digits n
  where wordListOfNumbers [d] = digitToWord d
        wordListOfNumbers  ds = (digitToWord $ head ds)
                                ++ "-"
                                ++ wordListOfNumbers (tail ds)
