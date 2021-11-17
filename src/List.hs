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

--List comperhensions 

-- We can represent a math set {x2 | x E {1..5}}
squares1to5 :: [Integer]
squares1to5 = [x^2 | x <- [1..5]]

concat1 :: [[a]] -> [a]
concat1 xss = [x | xs <- xss, x <- xs]

myList :: [Integer]
myList = [x | x <- [1..10], even x]

factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

prime :: Int -> Bool 
prime n = factors n == [1,n]

primes :: Int -> [Int]
primes n = [x | x <- [2..n], prime x]

--pyths :: Int -> [(Int, Int, Int)]

perfect :: Int -> Bool 
perfect n = sum (init (factors n)) == n

perfects :: Int -> [Int]
perfects n = [x | x <- [1..n], perfect x]
