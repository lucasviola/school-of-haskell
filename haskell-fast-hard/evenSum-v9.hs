import Data.List (foldl')

-- Usando Composição de Tipos

evenSum :: Integral a => [a] -> a
evenSum = (foldl' (+) 0) . (filter even)

main = print $ evenSum [1..2]