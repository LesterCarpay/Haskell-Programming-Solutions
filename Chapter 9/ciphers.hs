module Cipher where

import Data.Char

shiftRight :: Integer -> Char -> Char
shiftRight 0  c  = c
shiftRight n 'z' = shiftRight (n - 1) ('a')
shiftRight n 'Z' = shiftRight (n - 1) ('A')
shiftRight n  c  = shiftRight (n - 1) (succ c)

cipher :: Integer -> String -> String
cipher n = map (shiftRight n)

shiftLeft :: Integer -> Char -> Char
shiftLeft 0  c  = c
shiftLeft n 'a' = shiftLeft (n - 1) ('z')
shiftLeft n 'A' = shiftLeft (n - 1) ('Z')
shiftLeft n  c  = shiftLeft (n - 1) (pred c)

decipher :: Integer -> String -> String
decipher n = map (shiftLeft n)
