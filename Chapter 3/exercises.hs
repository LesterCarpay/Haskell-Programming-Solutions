--3
thirdLetter :: String -> Char
thirdLetter string = string !! 2

--4
getCurryLetter :: Int -> Char
getCurryLetter n = "Curry is awesome" !! n

--5
rvrs :: String -> String
rvrs string = drop 9 string ++ " " ++ drop 6 (take 8 string) ++ " " ++ take 5 string
