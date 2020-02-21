module TypeKnowDo where

--example
data Woot
data Blah

f :: Woot -> Blah
f = undefined

g :: (Blah, Woot) -> (Blah, Blah)
g (x, y) = (x, x)

--1
f1 :: Int -> String
f1 = undefined

g1 :: String -> Char
g1 = undefined

h1 :: Int -> Char
h1 x = g1 (f1 x)

--2
data A
data B
data C

q :: A -> B
q = undefined

w :: B -> C
w = undefined

e :: A -> C
e x = w (q x)

--3
data X
data Y
data Z

xz :: X -> Z
xz = undefined

yz :: Y -> Z
yz = undefined

xform :: (X, Y) -> (Z, Z)
xform (x, y) = (xz x, yz y)

--4
data W

munge :: (X -> Y)
      -> (Y -> (W, Z))
      -> X
      -> W

munge xtoy ytowz x = fst (ytowz (xtoy x))
