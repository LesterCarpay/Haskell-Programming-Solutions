module Exercises where

import Data.Char

--Data.Char
--2
upperFilter :: String -> String
upperFilter = filter isUpper

--3
capitaliseFirst :: String -> String
capitaliseFirst (x:xs) = toUpper x : xs

--4
capitalise :: String -> String
capitalise []     = []
capitalise (x:xs) = toUpper x : capitalise xs

--5
capitalisedHead :: String -> Char
capitalisedHead = toUpper.head

--standard functions
--1
myOr :: [Bool] -> Bool
myOr []         = False
myOr (False:xs) = myOr xs
myOr (True :xs) = True

--2
myAny :: (a -> Bool) -> [a] -> Bool
myAny _ []      = False
myAny f (x:xs)
  | f x == True = True
  | otherwise   = myAny f xs

--3a
myElem :: Eq a => a -> [a] -> Bool
myElem _ []   = False
myElem a (x:xs)
  | a == x    = True
  | otherwise = myElem a xs

--3b
myElem' :: Eq a => a -> [a] -> Bool
myElem' a = any (\x -> x == a)

--4
myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]

--5
squish :: [[a]] -> [a]
squish [] = []
squish (x:xs) = x ++ squish xs

--6
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ []     = []
squishMap f (x:xs) = f x ++ squishMap f xs

--7
squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

--8
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ [x]                = x
myMaximumBy f (x:xs)
  | f x restMax == GT = x
  | otherwise                    = restMax
  where restMax = myMaximumBy f xs

--9
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy _ [x]                = x
myMinimumBy f (x:xs)
  | f x restMin == LT = x
  | otherwise                    = restMin
  where restMin = myMinimumBy f xs

--10a
myMaximum :: (Ord a) => [a] -> a
myMaximum = myMaximumBy compare

--10b
myMinimum :: (Ord a) => [a] -> a
myMinimum = myMinimumBy compare
