--1

notThe :: String -> Maybe String
notThe word
  | word == "the" = Nothing
  | word == "The" = Nothing
  | otherwise     = Just word

replaceThe :: String -> String
replaceThe = unwords.(map (replaceNothingWithA.notThe)).words
  where
    replaceNothingWithA  Nothing   = "a"
    replaceNothingWithA (Just word) = word

--2
countTheBeforeVowel :: String -> Integer
countTheBeforeVowel string = counterHelper (words string)

counterHelper ws
  | length ws < 2               = 0
  | notThe w1 /= Nothing = 0 + counterHelper rest
  | isVowel (head w2)    = 1 + counterHelper rest
  | otherwise            = 0 + counterHelper rest
  where
    w1 = (head ws)
    w2 = ws!!1
    rest      = tail ws

--3
isVowel c = elem c "aeiou"
countVowels :: String -> Integer
countVowels = toInteger.length.(filter isVowel)
