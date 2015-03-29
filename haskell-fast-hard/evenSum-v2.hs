-- Generalizando o tipo
evenSum :: Integral a => [a] -> a

-- Usando where e let in bindings pra não poluir o escopo global
evenSum l = accumSum 0 l
     where  accumSum n l =
            if l == []
                then n
                else let x = head l
                         xs = tail l
                     in if even x
                            then accumSum (n+x) xs
                            else accumSum n xs