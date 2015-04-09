-- Data List = [] : a | Empty 

norm :: [Double] -> Double
norm [] = 0.0
norm lst = sqrt $ sum $ [x * x | x <- lst]


main = print $ norm [1.1..100.0]

-- My first succesfull attempt at using comprehensions and
-- left associativity function application with lists
-- YAY ME!