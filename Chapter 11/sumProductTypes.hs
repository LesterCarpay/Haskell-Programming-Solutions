--how does your garden grow:
type Gardener = String

data Garden =
      Gardenia Gardener
    | Daisy Gardener
    | Rose Gardener
    | Lilac Gardener
  deriving Show

--programmer
data OperatingSystem =
       GnuPlusLinux
     | OpenBSDPlusNevermindJustBSDStill | Mac
     | Windows
    deriving (Eq, Show, Enum, Bounded)

data ProgLang =
       Haskell
     | Agda
     | Idris
     | PureScript
    deriving (Eq, Show, Enum, Bounded)

data Programmer =
       Programmer { os :: OperatingSystem
                  , lang :: ProgLang }
      deriving (Eq, Show)

allProgrammers :: [Programmer]
allProgrammers = go minOs minLang
  where go :: OperatingSystem -> ProgLang -> [Programmer]
        go os lang
          | os == maxOs && lang == maxLang =
            [Programmer os lang]
          |                lang == maxLang =
            [Programmer os lang] ++ (go (succ os) minLang)
          | otherwise =
            [Programmer os lang]    ++ (go os (succ lang))
        minOs   = minBound :: OperatingSystem
        maxOs   = maxBound :: OperatingSystem
        minLang = minBound :: ProgLang
        maxLang = maxBound :: ProgLang
