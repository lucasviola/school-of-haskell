import Data.Char
import Data.Maybe

data Token = TokenOperator Operator 
			 |  TokenIdentifier String 
			 | TokenNumber Int
			 | TokenSpace
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
tokenize = map tokenizeChar

tokenizeChar :: Char -> Token
tokenizeChar c
	| elem c "+-*/" = TokenOperator (charToOperator c)
	| isDigit c = TokenNumber (digitToInt c)
	| isAlpha c = TokenIdentifier [c]
	| isSpace c = TokenSpace
	| otherwise = error $ "Cannot tokenize: " ++ [c]

removeSpaces :: [Token] -> [Token]
removeSpaces str = filter (\t -> t /= TokenSpace) str

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