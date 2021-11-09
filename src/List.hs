module List where

f :: Ord a => [a] -> [a]
f [] = []
f (x:xs) = f ys ++ [x] ++ f zs
            where
                ys = [a | a <- xs, a <= x]
                zs = [b | b <- xs, b > x]

firstItem :: Ord a => [a] -> a
firstItem = head

lastItem :: Ord a => [a] -> a
lastItem = tail