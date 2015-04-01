import Data.List (foldl')

evenSum :: Integral a => [a] -> a
evenSum l = foldl' (+) 0 (filter even l)

-- One Line reduction!

main = print $ evenSum [1..250]