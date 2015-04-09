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

charToOperator :: Char -> Operator
charToOperator c | c == '+' = Plus
           		 | c == '-' = Minus
           		 | c == '*' = Times
           		 | c == '/' = Div

tokenize :: String -> [Token]
tokenize [] = []
tokenize (c:cs)
	| elem c "+-*/" = TokenOperator (charToOperator c) : tokenize cs
	| isDigit c = TokenNumber (digitToInt c) : tokenize cs
	| isAlpha c = TokenIdentifier [c] 		 : tokenize cs
	| isSpace c = tokenize cs
	| otherwise = error $ "Cannot tokenize: " ++ [c]

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
main = do print $ tokenize "1 + 4 / x"
	
--	line <- getLine
--	putStrLn line
--	main