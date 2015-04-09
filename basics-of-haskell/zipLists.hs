zipList :: ([a], [b]) -> [(a, b)]
zipList ([], []) = []
zipList ((x:xs), (y:ys)) = (x,y) : zipList (xs,ys)

main = print $ zipList ([1,2,3,4], "Hello")