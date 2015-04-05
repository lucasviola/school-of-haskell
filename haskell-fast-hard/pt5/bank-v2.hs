-- Better. Using Maybe Monad

deposit :: (Num a) => a -> a -> Maybe a
deposit value account = Just (account + value)

withdraw :: (Num a, Ord a) => a -> a -> Maybe a
withdraw value account = if (account < value)
						 then Nothing
						 else Just (account - value)

isEligible :: (Num a, Ord a) => a -> Maybe Bool
isEligible account = do
	account1 <- deposit 100 account
	account2 <- withdraw 200 account1
	account3 <- deposit 100 account2
	account4 <- withdraw 300 account3
	account5 <- deposit 1000 account4
	Just True

main = do
	print $ isEligible 300 -- Just True
	print $ isEligible 299 -- Nothing