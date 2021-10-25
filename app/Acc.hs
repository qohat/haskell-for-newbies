{-# LANGUAGE GADTs #-}

module Acc where

data NonEmpty
data Empty    

data List emptiness a where
    Nil :: List Empty a
    (:::) :: a -> List e a -> List NonEmpty a

{-reverseAccEW :: List e a -> List e a
reverseAccEW xs = go xs Nil where
    go Nil acc = acc
    go (x ::: xs) acc = go xs (x ::: acc)-}



reverseAccE :: List e a -> List e a
reverseAccE Nil = Nil
reverseAccE (x ::: xs) = go xs (x ::: Nil) where
    go :: List e a -> List NonEmpty a -> List NonEmpty a
    go Nil acc = acc
    go (x ::: xs) acc = go xs (x ::: acc) 
