
fib 1 = 1
fib 2 = 1
fib x = fib(x-1) + fib(x-2)

hoge (n) | n < 10  = -100
         | n >= 10 = 100

hage []     = []
hage (x:xs) = hoge(x):hage(xs)

qsort []     = []
qsort (m:xs) = qsort low ++ [m] ++ qsort high
    where
      low  = [ x | x <- xs, x < m ]
      high = [ x | x <- xs, x > m ]

sortFile ""   = []
sortFile text = unlines $ map show $ qsort $ map (\x -> read x::Int) $ lines text

main = do
  text <- readFile "./q_1_1.data"
  writeFile "./q_1_1.out" $ sortFile text
