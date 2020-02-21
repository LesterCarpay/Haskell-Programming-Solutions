import Data.Char

type Key   = Char
type Times = Int
data DaPhone = NoCaps Key Times | Caps Key Times

instance Show DaPhone where
  show (Caps   key times) = ['*'] ++ show (NoCaps key times)
  show (NoCaps key 1)     = [key]
  show (NoCaps key times) = [key] ++ (show (NoCaps key (times - 1)))

toKey :: Char -> DaPhone
toKey char
  | isUpper char =   Caps key (times char')
  | otherwise    = NoCaps key (times char')
  where
    char' = toLower (char)
    key
      | char' == '.' || char' == ',' = '#'
      | char' == ' '  = '0'
      | isDigit char' = char'
      | char' <  'd'  = '2'
      | char' <  'g'  = '3'
      | char' <  'j'  = '4'
      | char' <  'm'  = '5'
      | char' <  'p'  = '6'
      | char' <  't'  = '7'
      | char' <  'w'  = '8'
      | char' <= 'z'  = '9'
    times char''
      | char'' == '.'          = 1
      | char'' == ','          = 2
      | char'' == ' '          = 1
      | isDigit char'' && (char'' == '7' || char'' == '9') = 5
      | isDigit char'' && (char'' == '0') = 2
      | isDigit char''         = 4
      | elem char'' "adgjmptw" = 1
      | otherwise              = 1 + (times (pred char''))

fromKey :: DaPhone -> Char
fromKey (Caps   key times) = toUpper (fromKey (NoCaps key times))
fromKey (NoCaps key times)
  | key == '0' = " 0"    !! i
  | key == '2' = "abc2"  !! i
  | key == '3' = "def3"  !! i
  | key == '4' = "ghi4"  !! i
  | key == '5' = "jkl5"  !! i
  | key == '6' = "mno6"  !! i
  | key == '7' = "pqrs7" !! i
  | key == '8' = "tuv8"  !! i
  | key == '9' = "wxyz9" !! i
  | key == '#' = ".,"   !! i
  where
    nCharsOnKey
      | elem key " 0" = 2
      | elem key "79" = 5
      | otherwise     = 4
    i = mod (times - 1) nCharsOnKey


convo :: [String]
convo =
  ["Wanna play 20 questions",
   "Ya",
   "U 1st haha",
   "Lol ok. Have u ever tasted alcohol",
   "Lol ya",
   "Wow ur cool haha. Ur turn",
   "Ok. Do u think I am pretty Lol",
   "Lol ya",
   "Just making sure rofl ur turn"]

translate :: String -> [DaPhone]
translate string = map toKey string

fingerTaps :: [DaPhone] -> Int
fingerTaps = length.(foldr (++) []).(map show)

--very slow but purely recursive method for finding most common element:
nTimesIn :: Eq a => a -> [a] -> Int
nTimesIn el [] = 0
nTimesIn el (x:xs)
  | el == x   = 1 + nTimesIn el xs
  | otherwise = nTimesIn el xs

mostCommonElement :: Eq a => [a] -> a
mostCommonElement [x] = x
mostCommonElement (x:xs)
  | (nTimesIn x xs) + 1 >= (nTimesIn (mostCommonElement xs) xs) = x
  | otherwise                                                   = mostCommonElement xs
