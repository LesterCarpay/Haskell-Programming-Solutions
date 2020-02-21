module EqInstances where

--1
data TisAnInteger =
  Tisan Integer

instance Eq TisAnInteger where

  (==) (Tisan integer1) (Tisan integer2) = integer1 == integer2

--2
data TwoIntegers =
  Two Integer Integer

instance Eq TwoIntegers where

  (==) (Two firstInteger1 secondInteger1) (Two firstInteger2 secondInteger2) =
    firstInteger1 == firstInteger2 &&
    secondInteger1 == secondInteger2

--3
data StringOrInt =
   TisAnInt Int
 | TisAString String

instance Eq StringOrInt where

  (==) (TisAnInt int1) (TisAnInt int2)           = int1 == int2
  (==) (TisAString string1) (TisAString string2) = string1 == string2
  (==) _ _                                       = False

--4
data Pair a =
  Pair a a

instance Eq a => Eq (Pair a) where

  (==) (Pair first1 second1) (Pair first2 second2) =
         first1 == first2
         && second1 == second2

--5
data Tuple a b =
  Tuple a b

instance (Eq a, Eq b) => Eq (Tuple a b) where
  (==) (Tuple first1 second1) (Tuple first2 second2) =
    first1 == first2
    && second1 == second2

--6
data Which a =
    ThisOne a
  | ThatOne a

instance Eq a => Eq (Which a) where
  (==) (ThisOne a1) (ThisOne a2) = a1 == a2
  (==) (ThatOne a1) (ThatOne a2) = a1 == a2
  (==) _ _                       = False

--7
data EitherOr a b =
    Hello a
  | Goodbye b

instance (Eq a, Eq b) => Eq (EitherOr a b) where
  (==) (Hello a1) (Hello a2)     = a1 == a2
  (==) (Goodbye a1) (Goodbye a2) = a1 == a2
  (==) _ _                       = False
