-- Just for the sake of demonstrating how non-strict evaluation works

numbers :: [Integer]
numbers = 0:map (1+) numbers -- infinite list ftw

take' ::  Int -> [a] -> [a]
take' n [] = []
take' 0 l = []
take' n (x:xs) = x:take' (n-1) xs

main = print $ take' 10 numbers

