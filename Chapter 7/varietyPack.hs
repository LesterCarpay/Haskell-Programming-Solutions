--1

k (x, y) = x
--k :: (a, b) -> a
k1 = k ((4-1), 10)
--k1 :: Integer
--k1 = 3
k2 = k ("three", (1 + 2))
--k2 :: [Char]
k3 = k (3, True)
--k3 :: Integer
--k3 = 3

--2
f :: (a, b, c)
  -> (d, e, f)
  -> ((a, d), (c, f))
f (a, _, c) (d, _, f) = ((a, d), (c,f))
