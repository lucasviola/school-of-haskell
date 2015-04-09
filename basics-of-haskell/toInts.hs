import Data.Char

toInts :: String -> [Int]
toInts [] = []
toInts (x:xs) = digitToInt x : toInts xs

sumList :: String -> Int
sumList = sum . toInts
-- sumList (x:xs) = toInts xs $ sumList x + sumList xs

main = print $ sumList "2013"