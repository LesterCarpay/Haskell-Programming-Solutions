module IOCiphers (cipher) where

cipher' :: String -> String -> String
cipher' message key
  |      message == []  = []
  | head message == ' ' = " " ++ cipher' (tail message) infiniteKey
  | otherwise           = [shift (head message) (head infiniteKey)]
                           ++ cipher' (tail message) (tail infiniteKey)
   where
    infiniteKey = key ++ infiniteKey
    shift c byC
      | byC == 'A' = c
      |   c == 'Z' = shift 'A' (pred byC)
      | otherwise  = shift (succ c) (pred byC)

cipher :: IO ()
cipher = do
  putStrLn "Enter your message: "
  message <- getLine
  putStrLn "Enter a keyword: "
  keyword <- getLine
  let result = cipher' message keyword
  putStr $ "Your translated message is: " ++ result ++ "\n"
