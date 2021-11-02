{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE StandaloneKindSignatures #-}
module TypeFamily where

import TypePromotion

{- We can have e1 or e2 in the result, so we need to explain the compiler which tag should use, then we use type families -}
{- append :: List e1 a -> List e2 a -> List ?? a -}
type AppendTag :: Emptyness -> Emptyness -> Emptyness
type family AppendTag e1 e2 where
    AppendTag 'Empty e2 = e2
    AppendTag 'NonEmpty e2 = 'NonEmpty

append :: List e1 a -> List e2 a -> List (AppendTag e1 e2) a 
append Nil ys = ys
append (x ::: xs) ys = x ::: append xs ys 


{- Currently we can create a function with that pattern match instead of the type family 
but the function is not gonna be promoted to the type level at least we create a different syntax
for instance: -}

{-appendTag Empty e2 = e2
appendTag NonEmpty _ = NonEmpty-}

{-$(promote [d|
    appendTag Empty e2 = e2
    appendTag NonEmpty _ = NonEmpty
|])-}