forLoop :: Int -> IO ()

forLoop n = do
	if n < 5
	then do
		putStrLn (show n)
		forLoop (n + 1)
	else
		return ()

main :: IO ()
main = forLoop 0