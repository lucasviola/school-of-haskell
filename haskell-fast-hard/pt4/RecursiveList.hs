-- Recreating lists with better(ish) syntax

infixr 5 ::: -- the priority
data List a = Nil | a ::: (List a) deriving (Show, Read, Eq, Ord)

convertList [] = Nil
convertList (x:xs) = x ::: convertList xs 
-- The list will always get concatenated with Nil which is the same as a : []

main = do
	print (0 ::: 1 ::: Nil)
	print (convertList [0,1])
	print (convertList [1..5])