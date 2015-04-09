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

showContent :: Token -> String
showContent (TokenOperator operator) = operatorToString operator
showContent (TokenIdentifier str) = str
showContent (TokenNumber number) = show number

tokenize :: String -> [Token]
tokenize = undefined

parse :: [Token] -> Expression
parse = undefined

evaluate :: Expression -> Double
evaluate = undefined

token :: Token
token = TokenIdentifier "x"

main :: IO ()
main = do
	putStrLn $ showContent token
	print token
--	line <- getLine
--	putStrLn line
--	main