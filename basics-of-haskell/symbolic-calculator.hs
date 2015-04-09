import Data.Char
import Data.Maybe

data Token = TokenOperator Operator 
			 |  TokenIdentifier String 
			 | TokenNumber Int
	deriving (Show, Eq)

data Operator = Plus | Minus | Times | Div deriving (Show, Eq)

data Expression

operatorToString :: Operator -> String
operatorToString Plus = "+"
operatorToString Minus = "-"
operatorToString Times = "*"
operatorToString Div = "/"

charToOperator :: Char -> Maybe Operator
charToOperator c | c == '+' = Just Plus
           		 | c == '-' = Just Minus
           		 | c == '*' = Just Times
           		 | c == '/' = Just Div
           		 | otherwise = Nothing

showContent :: Token -> String
showContent (TokenOperator operator) = operatorToString operator
showContent (TokenIdentifier str) = str
showContent (TokenNumber number) = show number

parse :: [Token] -> Expression
parse = undefined

evaluate :: Expression -> Double
evaluate = undefined

token :: Token
token = TokenIdentifier "x"

main :: IO ()
main = do print $ charToOperator '1'
	
--	line <- getLine
--	putStrLn line
--	main