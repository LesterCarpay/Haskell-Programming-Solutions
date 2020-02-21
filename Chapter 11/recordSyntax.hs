data Person =
  Person { name :: String,
           age  :: Int}
          deriving (Eq, Show)

lc = Person "Lester" 23
js = Person "James"  26
