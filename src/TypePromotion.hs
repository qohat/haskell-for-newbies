{-# LANGUAGE GADTs, DataKinds, PolyKinds #-}

module TypePromotion where 

{-Can I promote a Type to a Kind? 
Types in the GADT List, would always be Empty and NonEmpty?
Can't the emptynees be a Kind?
Can't we create a Kind? No, we can't
-}

data Emptyness = Empty | NonEmpty

data List emptiness a where
    Nil :: List 'Empty a {-Adding the quote mean the promoted version of the Empty type -}
    (:::) :: a -> List e a -> List 'NonEmpty a {-Adding the quote mean the promoted version of the NonEmpty type -}


{-:t List :: Type ->  Type -> Type to List :: Emptiness -> Type -> Type -}
{-
    'Empty :: Emptiness
    'NonEmpty :: Emptiness
-}

{-
    The compiler interprets the TypePromotion in a safety way 
-}