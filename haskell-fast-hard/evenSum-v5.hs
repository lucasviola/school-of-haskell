-- Versão 5

evenSum l = mysum 0 (filter even l)
	where
		mysum n [] = n
		mysum n (x:xs) = mysum (n+xs) xs

main = print $ evenSum [1..10] 