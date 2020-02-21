module Exercises where

--1
separateAtSpaces :: String -> [String]
separateAtSpaces "" = []
separateAtSpaces xs = [takeWhile (/= ' ') xs]
                       ++ separateAtSpaces (removeLeadingSpaces (dropWhile (/= ' ') xs))
                      where removeLeadingSpaces (' ':xs) = removeLeadingSpaces xs
                            removeLeadingSpaces      xs  = xs

--3
separateAtChar :: Char -> String -> [String]
separateAtChar _ "" = []
separateAtChar c xs = [takeWhile (/= c) xs]
                       ++ separateAtChar c (removeLeadingChars c (dropWhile (/= c) xs))
                      where removeLeadingChars _ [] = []
                            removeLeadingChars c xs
                              | head xs == c = removeLeadingChars c (tail xs)
                              | otherwise    = xs
