import Data.List

data BinTree a = Empty | Node a (BinTree a) (BinTree a)

-- Making the Tree an instance of the Show class, so we can prettify its printing
instance (Show a) => Show (BinTree a) where
	show t = "< " ++ replace '\n' "\n: " (treeshow "" t)
 	  where
 	  -- Empty Tree 
 	  treeshow pref Empty = ""
 	  -- Leaf
 	  treeshow pref (Node x Empty Empty) = (pshow pref x)
 	  -- Empty Right Branch
 	  treeshow pref (Node x left Empty) = (pshow pref x) ++ "\n" ++ (showSon pref "`--" "    " left)
 	  -- Empty left branch
 	  treeshow pref (Node x Empty right) = (pshow pref x) ++ "\n" ++ (showSon pref "`--" "    " right)
 	  -- shows the pretty tree using prefixes
 	  showSon pref before next t = pref ++ before ++ treeshow (pref ++ next) t

 	  -- pshow: replaces "\n" by "\n"++pref
 	  pshow pref x = replace '\n' ("\n"++pref) (show x)

 	  -- replaces one char by another string
 	  replace c new string =
 	  	concatMap (change c new) string
 	  	where
 	  		change c new x
 	  			| x == c = new
 	  			| otherwise = x:[] -- "x"


--function which turns a list into an ordered bin tree
-- The root is x
-- THe left node is created from members of the list's tail which are inferior to x
-- And the right node from members which are superior to x
treeFromList :: (Ord a) => [a] -> BinTree a
treeFromList [] = Empty
treeFromList (x:xs) = Node x (treeFromList (filter (<x) xs)) (treeFromList (filter (>x) xs))

main = do
	putStrLn "Binary 'prettified' Integer Tree:"
	print $ treeFromList [1,10,2,3,4,6,7]

	putStrLn "Binary 'prettified' [Char] Tree"
	print $ treeFromList ["foo", "bar", "baz"]

