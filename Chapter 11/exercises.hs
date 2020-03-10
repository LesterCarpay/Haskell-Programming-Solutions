import Data.Char

--Vigenere cipher
cipher :: String -> String -> String
cipher message key
  |      message == []  = []
  | head message == ' ' = " " ++ cipher (tail message) infiniteKey
  | otherwise           = [shift (head message) (head infiniteKey)]
                           ++ cipher (tail message) (tail infiniteKey)
   where
    infiniteKey = key ++ infiniteKey
    shift c byC
      | byC == 'A' = c
      |   c == 'Z' = shift 'A' (pred byC)
      | otherwise  = shift (succ c) (pred byC)

-- As-patterns
--1
isSubseqOf :: (Eq a) => [a] -> [a] -> Bool
isSubseqOf [] _ = True
isSubseqOf _ [] = False
isSubseqOf xs@(xf:xr) ys@(yf:yr) = (xf == yf || isSubseqOf xs yr)
          && isSubseqOf xr ys

--2

capitaliseFirstLetter :: String -> String
capitaliseFirstLetter (f:r) = (toUpper f) : r


capitalizeWords :: String -> [(String, String)]
capitalizeWords []  = []
capitalizeWords (' ':r) = capitalizeWords r
capitalizeWords sen = [(newWord, capitaliseFirstLetter newWord)] ++ (capitalizeWords restOfSentence)
  where cut = cutOfPoint sen
        newWord = take cut sen
        restOfSentence = drop cut sen

cutOfPoint :: String -> Int
cutOfPoint [] = 0
cutOfPoint (' ':_) = 0
cutOfPoint (_:r) = 1 + (cutOfPoint r)

capitaliseParagraph :: String -> String
capitaliseParagraph (c:par) = (toUpper c):(go par) where
  go []              = []
  go ('.':' ':c:par) = ". " ++ [toUpper c] ++ (go par)
  go (        c:par) =  c   :  (go par)
