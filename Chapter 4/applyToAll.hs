module ApplyToAll where

applyToAll function listOfArguments = if length listOfArguments == 0
                                      then []
                                      else [function (head listOfArguments)]
                                           ++ applyToAll function (tail listOfArguments)
