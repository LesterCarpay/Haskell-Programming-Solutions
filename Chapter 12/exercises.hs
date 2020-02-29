--Determine the kinds
--1 *
--2 a: *, f: * -> *

-- validate the word
newtype Word' =
  Word' String
  deriving (Eq, Show)

isVowel c = elem c "aeiou"
countVowels :: String -> Integer
countVowels = toInteger.length.(filter isVowel)

mkWord :: String -> Maybe Word'
mkWord str
  | 2*(countVowels str) > ((toInteger.length) str) = Nothing
  | otherwise                          = Just (Word' str)

--it's only natural
data Nat =
    Zero
  | Succ Nat
  deriving (Eq, Show)

natToInteger :: Nat -> Integer
natToInteger Zero       = 0
natToInteger (Succ nat) = 1 + (natToInteger nat)

integerToNat :: Integer -> Maybe Nat
integerToNat n
  | n <  0    = Nothing
  | otherwise = Just (posIntegerToNat n)
  where
    posIntegerToNat 0 = Zero
    posIntegerToNat m = Succ (posIntegerToNat (m - 1))

--write your own iterate and unfoldr
myIterate :: (a -> a) -> a -> [a]
myIterate f start = start : (myIterate f (f start))

myUnfoldr :: (b -> Maybe (a, b))
          ->  b
          -> [a]

myUnfoldr f start = helper (f start)
  where
    helper Nothing      = []
    helper (Just (a,b)) = a:(myUnfoldr f b)

betterIterate :: (a -> a) -> a -> [a]
betterIterate f x = myUnfoldr (\x -> Just (x, f x)) x
