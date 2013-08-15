module Main where
import System

main = do av <- getArgs
       putStrLn $ quickSort [1,7,4,3,2,5,6]

quickSort (x:xs) = left : right
            left = xs filter (_ < x)