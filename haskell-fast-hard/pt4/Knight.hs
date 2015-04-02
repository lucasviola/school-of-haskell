data Knight = Knight { name :: String, quest :: String, favoriteColor :: String }

galaad = Knight { name = "Galaad, the pure"
                , quest = "To seek the Holy Grail"
                , favoriteColor = "The blue... No the red! AAAAAAHHHHHHH!!!!" }

showCharacter :: Knight -> String
showCharacter knight = "What is your name?\n"
    ++ "My name is " ++ name knight
    ++ "\nWhat is your quest?\n"
    ++ quest knight
    ++ "\nWhat is your favorite color?\n"
    ++ favoriteColor knight

main = do
  putStrLn $ showCharacter galaad