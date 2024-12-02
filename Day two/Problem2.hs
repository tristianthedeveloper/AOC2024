import Control.Monad
import Data.List

monotone :: (Ord a) => [a] -> Bool
monotone = liftA2 (||) (orderedBy (>)) (orderedBy (<))

orderedBy :: (a -> a -> Bool) -> [a] -> Bool
orderedBy (<) (x : y : xs) = x < y && orderedBy (<) (y : xs)
orderedBy _ _ = True

adjacencyCheck :: (Ord a, Num a) => [a] -> Bool
adjacencyCheck (x : y : xs) = (abs (x - y) <= 3) && adjacencyCheck (y : xs)
adjacencyCheck _ = True

isSafe :: (Ord a, Num a) => [a] -> Bool
isSafe = liftA2 (&&) adjacencyCheck monotone

-- part one
countSafe :: FilePath -> IO Int
countSafe path = do
  length . filter isSafe <$> (map (map read . words) . lines <$> readFile path)

isSafe' :: (Ord a, Num a) => [a] -> Bool
isSafe' xs = isSafe xs || any isSafe (filter (\s -> length s == length xs - 1) $ subsequences xs)

countSafe' :: FilePath -> IO Int
countSafe' path = do
  length . filter isSafe' <$> (map (map read . words) . lines <$> readFile path)