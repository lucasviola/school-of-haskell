import Data.Char

toInts :: String -> [Int]
toInts [] = []
toInts (x:xs) = digitToInt x : toInts xs


main = print $ toInts "2013"