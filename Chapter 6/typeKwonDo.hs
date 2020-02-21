--1
chk :: Eq b => (a -> b) -> a -> b -> Bool
chk atob a b = (atob a) == b

--2
arith :: Num b
      => (a -> b)
      -> Integer
      -> a
      -> b
arith atob int a = (atob a) + fromInteger int
