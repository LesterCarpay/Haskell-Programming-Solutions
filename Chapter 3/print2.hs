module Print2 where

main:: IO()
main = do
  putStrLn "Count to two for me:"
  putStr "one, two"
  putStr ", three, and"
  putStrLn " four!"
