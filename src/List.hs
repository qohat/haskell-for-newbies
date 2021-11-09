module List where
import GHC.Base (Ord)

f :: Ord a => [a] -> [a]
f [] = []
f (x:xs) = f ys ++ [x] ++ f zs
            where
                ys = [a | a <- xs, a <= x]
                zs = [b | b <- xs, b > x]

firstItem :: Ord a => [a] -> a
firstItem = head

lastItem :: Ord a => [a] -> a
lastItem = last

nth :: Ord a => [a] -> a
nth xs = xs !! 3

lastItems :: Ord a => [a] -> [a]
lastItems = tail

factorial :: (Num a, Enum a) => a -> a
factorial n = product [1..n]

average :: Foldable t => t Int -> Int
average ns = sum ns `div` length ns
{- average ns = div (sum ns) (length ns) -}
{- x `f` y is synctatic sugar of f x y-}


{- Find the syntax error
N = a 'div' length xs
    where 
        a = 10
        xs = [1, 2, 3, 4, 5, 6] -}

n :: Int
n = a `div` length xs
    where 
        a = 1
        xs = [1, 2, 3, 4, 5, 6]

last1 :: Ord a => [a] -> a
last1 ls = ls !! (length ls - 1)

last2 :: [a] -> a
last2 ls = head (reverse ls)

init1 :: [a] -> [a]
init1 ls = reverse (tail (reverse ls))

init2 :: [a] -> [a]
init2 ls = take (length ls - 1) ls

head1 :: [a] -> a
head1 (x:_) = x

tail1 :: [a] -> [a]
tail1 [] = []
tail1 (_:xs) = xs
