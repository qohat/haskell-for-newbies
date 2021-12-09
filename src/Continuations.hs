{-# LANGUAGE RankNTypes #-}
module Continuations where

import Control.Monad.Cont

-- toCont   :: a -> (forall r. Cont r a)
-- fromCont :: (forall r. Cont r a) -> a



{--
We can represent a continuation in nodeJs
http.get("http://haskell.org", res => {
        const statusCode = res.statusCode;
    }
)
--}

{--
get "http://haskell.org" $ \res ->
    let statusCode = statusCode res
        in ...
--}

-- get :: String -> (a -> IO ()) -> IO ()
{-- 
get :: String -> Cont (IO ()) a
get "http://haskell.org" = do
    res1 <- action1
    res2 <- action2
    ...
--}

return :: a -> (a -> r) -> r
-- return x = \k -> k x
return x k = k x
-- return = flip ($)

-- >>= :: Cont r a -> (a -> Cont r b) -> Cont r b
-- (>>=) :: ((a -> r) -> r) -> (a -> (b -> r) -> r) -> (b -> r) -> r
-- x >>= f = \k -> ...
-- x :: Cont r a  --- f :: a -> Cont r b

-- x >>= f = \k -> x (\a -> f a k)
(>>=) :: ((a -> r) -> r) -> (a -> (b -> r) -> r) -> (b -> r) -> r
x >>= f = \k -> x (`f` k)