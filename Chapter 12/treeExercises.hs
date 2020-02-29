data BinaryTree a =
    Leaf
  | Node (BinaryTree a) a (BinaryTree a)
  deriving (Eq, Ord, Show)

unfold :: (a -> Maybe (a,b,a))
       -> a
       -> BinaryTree b

unfold f x = helper (f x)
  where
    helper Nothing = Leaf
    helper (Just (s1, v, s2)) = Node (unfold f s1) v (unfold f s2)

treeBuild :: Integer -> BinaryTree Integer
treeBuild n = unfold f 0
  where
    f x
      | x == n    = Nothing
      | otherwise = Just (x + 1, x, x + 1)
