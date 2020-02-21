module Whereclauses where

fun1 = x*3 + y
  where x = 3
        y = 1000

fun2 = x*5
  where y = 10
        x = 10*5 + y

fun3 = z/x + y where
  x = 7
  y = negate x
  z = y*10
  
