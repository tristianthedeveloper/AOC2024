module Problem1 where
import Control.Monad
import Data.List
import Data.Bifunctor
import Control.Arrow


--- part one
dist :: Integer -> Integer -> Integer
dist = (abs .) . (-)
distances :: FilePath -> IO Integer
distances path = do
    lines <- map words . lines <$> readFile path
    let tuples = join bimap sort $ (map (read @Integer . head) &&& map (read @Integer . last)) lines
    pure $ sum $ uncurry (zipWith dist) tuples


-- part two
similarityScores :: FilePath -> IO Int
similarityScores path = do
    lines <- map words . lines <$> readFile path
    let (one, two) = (map (read @Int . head) &&& map (read @Int . last)) lines
    pure . sum $ map (\x -> x * length (filter (==x) two)) one
