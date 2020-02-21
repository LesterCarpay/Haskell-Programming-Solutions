data Expr
  = Lit Integer
  | Add Expr Expr

eval :: Expr -> Integer
eval (Lit n        ) = n
eval (Add exp1 exp2) = (eval exp1) + (eval exp2)

instance Show Expr where
  show (Lit n)         = show n
  show (Add exp1 exp2) = (show exp1) ++ " + " ++ (show exp2)
