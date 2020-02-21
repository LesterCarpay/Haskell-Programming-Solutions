module Exercises where

--Let's write code
--1 b
tensDigit :: Integral a => a -> a
tensDigit x = d
  where xLast = fst (x `divMod` 10)
        d     = snd (xLast `divMod` 10)

--1 c
hunsDigit :: Integral a => a -> a
hunsDigit x = d
  where withoutLastTwoDigits = div x 100
        d                    = mod withoutLastTwoDigits 10

--2
foldBoolCase :: a -> a -> Bool -> a
foldBoolCase first second condition =
  case condition of
    True  -> second
    False -> first

foldBoolGuard :: a -> a -> Bool -> a
foldBoolGuard first second condition
  | condition = second
  | otherwise = first

--3
g :: (a -> b) -> (a, c) -> (b, c)
g atob (a, c) = (atob a, c)

--5
roundTrip :: (Show a, Read b, Num b) => a -> b
roundTrip = read.show

main = do
  print (roundTrip 4)
  print (id 4)
