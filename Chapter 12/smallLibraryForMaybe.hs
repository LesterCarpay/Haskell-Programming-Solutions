--1
isJust :: Maybe a -> Bool
isJust (Just _) = True
isJust       _  = False

isNothing Nothing = True
isNothing _       = False

--2
mayybee :: b -> (a -> b) -> Maybe a -> b
mayybee b fAToB (Just a) = fAToB a
mayybee b _      Nothing = b

--3
fromMaybe :: a -> Maybe a -> a
fromMaybe a = mayybee a id

--4
listToMaybe :: [a] -> Maybe a
listToMaybe []     = Nothing
listToMaybe (x:xs) = Just x

maybeToList :: Maybe a -> [a]
maybeToList Nothing  = []
maybeToList (Just a) = [a]

catMaybes :: [Maybe a] -> [a]
catMaybes [] = []
catMaybes ((Just a):xs) = a:(catMaybes xs)
catMaybes (Nothing :xs) =    catMaybes xs

flipMaybe :: Eq a => [Maybe a] -> Maybe [a]
flipMaybe maybes
  | elem Nothing maybes = Nothing
  | otherwise           = Just (unpackMaybes maybes)
  where
    unpackMaybes [] = []
    unpackMaybes ((Just n):ms) = n:(unpackMaybes ms)
