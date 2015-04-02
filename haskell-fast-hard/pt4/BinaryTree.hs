import Data.List

data BinTree a = Empty | Node a (BinTree a) (BinTree a) deriving (Show)

--function which turns a list into an ordered bin tree

treeFromList :: (Ord a) => [a] -> BinTree a
treeFromList [] = Empty
treeFromList (x:xs) = Node x (treeFromList (filter (<x) xs)) (treeFromList (filter (>x) xs))

main = print $ treeFromList [1,100,200,3,45,32,65,12]

-- The root is x
-- THe left node is created from members of the list's tail which are inferior to x
-- And the right node from members which are superior to x