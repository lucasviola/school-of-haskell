import Data.List

-- TYPE CONSTRUCTOR
data BinTree a = Empty | Node a (BinTree a) (BinTree a) deriving (Ord, Eq)

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
 	  -- Both left and right children non empty
 	  treeshow pref (Node x left right) = (pshow pref x) ++ "\n" ++ (showSon pref "|--" "|   " left) ++ "\n" ++ (showSon pref "`--" "    " right)

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

-- FUNCTIONS

-- Turns a list into an ordered bin tree
treeFromList :: (Ord a) => [a] -> BinTree a
treeFromList [] = Empty
treeFromList (x:xs) = Node x (treeFromList (filter (<x) xs)) (treeFromList (filter (>x) xs))

-- Takes all elements up to some depth
treeTakeDepth _ Empty = Empty
treeTakeDepth 0 _	  = Empty
treeTakeDepth n (Node x left right) =
	let
		nl = treeTakeDepth (n-1) left
		nr = treeTakeDepth (n-1) right
	in
		Node x nl nr

-- Now let us create some weird trees

-- Infinitely recursive null tree:
nullTree = Node 0 nullTree nullTree
weirdTree = Node 0 (dec weirdTree) (inc weirdTree)
	where
		dec (Node x l r) = Node (x-1) (dec l) (dec r)
		inc (Node x l r) = Node (x+1) (inc l) (inc r)

main = do
	putStrLn "Binary 'prettified' Integer Tree:"
	print $ treeFromList [7,2,4,8,1,3,6,21,12,23]

	putStrLn "Binary 'prettified' [Char] Tree"
	print $ treeFromList ["foo", "bar", "baz"]

	--Tree of Trees
	print (treeFromList (map treeFromList ["lucas", "melanie", "tatiany", "luisa"]))

	-- Null Tree
	print $ treeTakeDepth 3 nullTree