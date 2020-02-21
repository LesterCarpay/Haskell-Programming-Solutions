module IntDiv where

intDiv :: Integral a => a -> a -> a
intDiv numerator denominator
  | (numerator < 0 || denominator < 0) && not (numerator < 0 && denominator < 0)
              = negate result
  | otherwise =        result
  where
    result = go numerator denominator 0
         go numerator denominator quotient
         | denominator == 0 = error "divide by zero"
         | denominator > numerator = quotient
         | otherwise = go (numerator - denominator) denominator (quotient + 1)
