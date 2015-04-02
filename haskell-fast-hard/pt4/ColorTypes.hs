data Name = NameConstructor String
data Color = ColorConstructor String

showInfo :: Name -> Color -> String
showInfo (NameConstructor name) (ColorConstructor color) = "Name: " ++ name ++ ", Color: " ++ color

name = NameConstructor "Lukelicious"
color = ColorConstructor "Turquoise Blue"

main = putStrLn $ showInfo name color