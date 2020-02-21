--1
mTha x y z = x * y * z
mThb x y = \z -> x * y * z
mThc x = \y -> \z -> x * y * z
mThd = \x -> \y -> \z -> x * y * z

--3
--a
addOneIfOdd n = case odd n of
  True -> f n
  False -> n
  where f n = n + 1

addOneIfOddAnon n = case odd n of
  True -> f n
  False -> n
  where f = \n -> n + 1

--b
addFive x y = (if x > y then y else x) + 5

addFiveAnon = \x -> \y -> (if x > y then y else x) + 5

--c
mflipAnon f = \x -> \y -> f y x

mflip f x y = f y x
