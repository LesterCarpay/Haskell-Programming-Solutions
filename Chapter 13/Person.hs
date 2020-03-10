import Data.Char (isDigit)
import System.Exit (exitFailure)

type Name = String
type Age = Integer

data Person = Person Name Age deriving Show

data PersonInvalid =
    NameEmpty
  | AgeTooLow
  | PersonInvalidUnknown String
  deriving (Eq, Show)

mkPerson :: Name
         -> Age
         -> Either PersonInvalid Person

mkPerson name age
  | name /= "" && age > 0 =
      Right $ Person name age
  | name == "" = Left NameEmpty
  | not (age > 0) = Left AgeTooLow
  | otherwise =
      Left $ PersonInvalidUnknown $
        "Name was: " ++ show name ++
        " Age was: " ++ show age

gimmePerson :: IO ()
gimmePerson = do
  putStrLn "Enter name: "
  name <- getLine
  putStrLn "Enter age: "
  age' <- getLine
  checkAge age'
  let age = read age' :: Integer
  let person = mkPerson name age
  printMessage person
  return ()

  where
    checkAge age = do
      let isValid = (all isDigit) age
      if (all isDigit age)
      then do
        return ()
      else
        exitFailure

    printMessage (Left _) =
      putStrLn "Failed to create a person"
    printMessage (Right (Person name age)) =
      putStrLn $ "Yay! Successfully created a person: " ++
                 name ++ " " ++ (show age)
