module Types where 

{- Curried function types -}
add :: Int -> (Int -> Int)
add x y = x + y

mult :: Int -> (Int -> (Int -> Int))
mult x y z = x * y * z

mult1 :: Int -> Int -> Int -> Int
mult1 x y z = (((mult x) y) z)


{-Lambdas-}

odds n = map f [1..n]
        where 
            f x = x*2 + 1

oddsSymplified n = map (\x -> x * 2 + 1) [1..n]


{- Type and classes -}
data Tree a = Leaf a | Node (Tree a) (Tree a)

