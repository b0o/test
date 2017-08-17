f :: Int -> Int -> [Int]
f n l = concat $ map (replicate l) [0..n]

main :: IO ()
main
  = do
    let x = f 10000 10000
    print $ length x
