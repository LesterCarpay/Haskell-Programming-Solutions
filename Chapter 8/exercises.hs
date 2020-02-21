import Data.List (intersperse)

--reviewing currying
cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty :: String -> String
appedCatty = cattyConny "woops"

frappe :: String -> String
frappe = flippy "haha"

--recursion

--2
sumUpTo = go 0
  where go sumSoFar n
         | n == 0 = sumSoFar
         | otherwise = go (sumSoFar + n) (n - 1)

--3
mult :: (Integral a) => a -> a -> a
mult n1 n2
  | n2 == 0   = 0
  | otherwise = n1 + mult n1 (n2 - 1)

--McCarthy91
mc91 :: Integral a => a -> a
mc91 n
  | n > 100   = n - 10
  | otherwise = (mc91 . mc91) (n + 11)

--Numbers into words

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
