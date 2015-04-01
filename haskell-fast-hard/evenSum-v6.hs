import Data.List

evenSum l = foldl' mysum 0 (filter even l)
	where mysum acc value = acc + value

main = print $ evenSum [1..10] 