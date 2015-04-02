-- Record Syntax

data People = People { ident :: Int, name :: String, rg :: String, email :: String }

lukita = People 1 "Lucas" "121212" "lukita@daGalera.me"
mel = People 2 "Melanie" "222222" "mel@anie.ch"

main = do
	putStrLn $ "Name: " ++ name lukita ++ " E-mail: " ++ email lukita
	putStrLn $ "Name: " ++ name mel ++ " E-mail: " ++ email mel