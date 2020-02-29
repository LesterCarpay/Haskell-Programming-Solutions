lefts' :: [Either a b] -> [a]
lefts' = foldr f []
  where
    f (Left x) y = x:y
    f _        y =   y

rights' :: [Either a b] -> [b]
rights' = foldr f []
  where
    f (Right x) y = x:y
    f _         y =   y

partitionEithers' :: [Either a b] -> ([a], [b])
partitionEithers' xs = (lefts' xs, rights' xs)

eitherMaybe' :: (b -> c)
             -> Either a b
             -> Maybe c

eitherMaybe' f (Right x) = Just (f x)
eitherMaybe' _ (Left  _) = Nothing

either' :: (a -> c)
        -> (b -> c)
        -> Either a b
        -> c

either' fl _ (Left  x) = fl x
either' _ fr (Right x) = fr x

eitherMaybe'' :: (b -> c)
              -> Either a b
              -> Maybe c

eitherMaybe'' f = either' leftToNothing (Just . f)
  where
    leftToNothing _ = Nothing
