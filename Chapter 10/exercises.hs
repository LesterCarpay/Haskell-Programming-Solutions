module Exercises where

--scans exercise 3
factorials = 1 : scanl (*) 2 [3..]

--warmup and review
vowels = "aeiou"
stops  = "pbtdkg"

threeLetterWords :: [Char] -> [Char] -> [(Char, Char, Char)]
threeLetterWords vs cs = go cs vs cs
  where go [c1]    [v]   [c2]     = [(c1,v,c2)]
        go [c1]    [v]   (c2:c2s) = (c1, v, c2) : go [c1] [v] c2s
        go [c1]    (v:vs) c2s     = go [c1] [v] c2s ++ go [c1] vs c2s
        go (c1:c1s) vs    c2s     = go [c1] vs c2s ++ go c1s vs c2s

seekritFunc x = div (sum (map length (words x))) (length (words x))

seekritFunc' x = fromIntegral((sum (map length (words x))))/fromIntegral(length(words x))

--rewriting functions using folds
myOr :: [Bool] -> Bool
myOr = foldr (||) False

myAny :: (a -> Bool) -> [a] -> Bool
myAny f = foldr ((||).f) False

myElem :: Eq a => a -> [a] -> Bool
myElem e = foldr ((||).(==e)) False

myReverse :: [a] -> [a]
myReverse = foldr ((flip (++)).(:[])) []

myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr ((++).(:[]).f) []

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f = foldr (\x -> \ys -> if (f x) then x : ys else ys) []


squish :: [[a]] -> [a]
squish = foldr (++) []

squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f = foldr ((++).f) []

squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ [x]     = x
myMaximumBy f (x:xs)  = foldr (\a -> \b -> if (f a b == GT) then a else b) x xs
