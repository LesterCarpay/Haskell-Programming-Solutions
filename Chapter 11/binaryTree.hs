data BinaryTree a =
    Leaf
  | Node (BinaryTree a) a (BinaryTree a)
  deriving (Eq, Ord, Show)

insert' :: Ord a => a
  -> BinaryTree a
  -> BinaryTree a
insert' b Leaf = Node Leaf b Leaf
insert' b (Node left a right)
  | b == a = Node left a right
  | b <  a = Node (insert' b left) a right
  | b >  a = Node left a (insert' b right)

treeMap :: (a -> b) -> BinaryTree a -> BinaryTree b
treeMap f  Leaf = Leaf
treeMap f (Node leftTree value rightTree) =
  Node (treeMap f leftTree) (f value) (treeMap f rightTree)

preorder :: BinaryTree a -> [a]
preorder Leaf = []
preorder (Node leftTree value rightTree) =
  [value] ++ (preorder leftTree) ++ (preorder rightTree)

inorder :: BinaryTree a -> [a]
inorder Leaf = []
inorder (Node leftTree value rightTree) =
  (inorder leftTree) ++ [value] ++ (inorder rightTree)

postorder :: BinaryTree a -> [a]
postorder Leaf = []
postorder (Node leftTree value rightTree) =
  (postorder leftTree) ++ (postorder rightTree) ++ [value]

testTree :: BinaryTree Integer
testTree =
  Node (Node Leaf 1 Leaf)
  2
  (Node Leaf 3 Leaf)

foldTree :: (a -> b -> b)
            -> b
            -> BinaryTree a
            -> b

--foldTree f base tree = foldr f base (inorder tree)

foldTree _ base Leaf = base
foldTree f base (Node leftTree value rightTree) =
  foldTree f (foldTree f (f value base) leftTree) rightTree
