module MinFree where
import Data.Array
import Data.Array.ST
import Data.List

minfree :: [Int] -> Int
minfree xs = head ([0..] \\ xs)

notElem' :: Eq a => [a] -> a -> Bool
notElem' a n = n `notElem` a

search :: Array Integer Bool -> Int
search = length . takeWhile id . elems

checklist xs = accumArray (||) False (0, n) (zip (filter (<= n) xs) (repeat True))
                 where n = length xs

countlist :: [Int] -> Array Int Int
countlist xs = accumArray (+) 0 (0, n) (zip xs (repeat 1))
                 where n = length xs

bucketsort :: [Int] -> [Int]
bucketsort xs = concat [replicate k x | (x, k) <- assocs (countlist xs)]

checklist' xs = runSTArray (do
                 {a <- newArray (0, n) False;
                  sequence_ [writeArray a x True | x <- xs, x <= n];
                  return a})
               where n = length xs

minfree' :: [Int] -> Int
minfree' xs = minfrom 0 (length xs, xs)
minfrom a (n, xs) | n == 0             = a
                  | m == b - a         = minfrom b (n - m, vs)
                  | otherwise          = minfrom a (m, us)
                   where (us, vs)      = partition (< b) xs
                         b             = a + 1 + n `div` 2
                         m             = length us
