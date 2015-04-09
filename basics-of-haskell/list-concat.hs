concatenateLists :: [a] -> [a] -> [a]
concatenateLists xs [] = xs
concatenateLists [] ys = ys
concatenateLists (x:xs) ys = x : concatenateLists xs ys


prependPig :: String -> String
prependPig xs = "pig" ++ xs 

prependConcat xs = prependPig . concatenateLists xs

main = putStrLn $ prependConcat "Hello " "World"