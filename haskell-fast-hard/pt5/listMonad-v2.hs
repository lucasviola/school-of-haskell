import Control.Monad (guard)

allCases = [1..10]
-- Using comprehensions (syntactic sugar for the List Monad)
main = do
	print $ [ (x,y,z) | x <- allCases, y <- allCases, z <- allCases, 4*x + 2*y < z]
