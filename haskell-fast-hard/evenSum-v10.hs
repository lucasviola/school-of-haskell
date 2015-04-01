import Data.List (foldl')

sum' :: (Num a) => [a] -> a
sum' = foldl' (+) 0

filterEven :: Integral a => [a] -> [a]
filterEven (x:xs) = filter even (x:xs)

evenSum :: Integral a => [a] -> a
evenSum = sum' . filterEven

main = print $ evenSum [1..10]

-- Criando funções separadas para cada ação