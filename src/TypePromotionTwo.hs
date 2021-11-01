{-# LANGUAGE GADTs, DataKinds, PolyKinds #-}
{-# LANGUAGE TypeOperators #-}

module TypePromotionTwo where

import GHC.TypeLits
{-
    Term-Level => [String]
    Type-level => Symbol E.g. '["firstName", "lastName"]
-}    

{-Just for Symbols-}
{--data Dict1 (key :: [Symbol]) a where
    Empty :: Dict1 '[] a
    (:&:) :: a -> Dict1 ks a -> Dict1 (key ': ks) a--}


{-Any kind k - Kind Polymorphic   -}
{--data Dict2 (key :: [k]) a where
    Empty :: Dict2 '[] a
    (:&:) :: a -> Dict2 ks a -> Dict2 (key ': ks) a--}


{-With this we can have a list of keys and types of key
We can refine this "Qohat" :&: "5" :&: Empty :: Dict '["firstName", "age"] String 
to "Qohat" :&: "5" :&: Empty :: Dict '[ '("firstName", String), '("age", Int)] (Symbol, Type) 
-}
{--data Dict (keys :: [(k, Type)]) a where
    Empty :: Dict '[]
    (:&:) :: t -> Dict ks -> Dict ('(key, t) ': ks)--}

{- We can create schemas as promoted types -}

data SType = SString | SInt | SBool | SList SType | SDict [(Symbol, SType)]

type AuthorSchema = 'SDict '[ '("name", SString), '("books", SList SString) ]

data Value (sch :: SType) where
    VString :: String       -> Value 'SString
    VInt    :: Int          -> Value 'SInt
    VBool   :: Bool         -> Value 'SBool
    VList   :: [Value s]    -> Value ('SList s)
    VDict   :: DictValue d  -> Value ('SDict d)

infixr 5 :&:
data DictValue d where
    Empty :: DictValue '[]
    (:&:) :: Value s -> DictValue ds
          -> DictValue ('(k, s) ': ds)