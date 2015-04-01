-- Boa prática: Importar só o que vai usar
import Data.List (foldl') 

-- Usando lambda notation
evenSum l = foldl' (\x y -> x+y) 0 (filter even l)

main = print $ evenSum [1..50]

