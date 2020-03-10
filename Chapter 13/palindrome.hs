module Palindrome where

import Control.Monad
import System.Exit (exitSuccess)
import Data.Char

palindrome :: IO ()
palindrome = forever $ do
  line1 <- getLine
  let normalisedLine = normalise line1
  case (normalisedLine == reverse normalisedLine) of
    True -> putStrLn "It's a palindrome!"
    False -> do
      putStrLn "Nope!"
      exitSuccess
  where
    normalise = (filter isAlpha).(map toLower)
