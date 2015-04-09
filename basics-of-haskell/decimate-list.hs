skipper :: [a] -> [a]
skipper [] = []
skipper [a] = [a]
skipper (x:y:xs) = x : skipper xs 

-- should skip elements [1, 3, 5, 7, 9]
main = print $ skipper [1..10]