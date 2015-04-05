-- Better version, using bind operator and no temp variables
deposit :: (Num a) => a -> a -> Maybe a
deposit value account = Just (account + value)

withdraw :: (Num a, Ord a) => a -> a -> Maybe a
withdraw value account = if (account < value)
						 then Nothing
						 else Just (account - value)

isEligible :: (Num a, Ord a) => a -> Maybe Bool
isEligible account =
	deposit 100 account >>=
	withdraw 200 >>=
	deposit 100 >>=
	withdraw 300 >>=
	deposit 1000 >>
	return True

main = do
	print $ isEligible 300
	print $ isEligible 1000
	print $ isEligible 10
	print $ isEligible 5000