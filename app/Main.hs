module Main where
import Sorted
import Named
import Data.Coerce (coerce)
import The
import Data.Ord

main :: IO ()
main = print $ show sortAndMerge

list1 :: [Integer]
list1 = [1, 3, 5]

list2 :: [Integer]
list2 = [0, 2, 4]

sortAndMerge :: [Integer]
sortAndMerge = merged
  where merged = name (comparing Down) $ \comp ->
          let list1' = sortBy comp list1
              list2' = sortBy comp list2
          in  the (mergeBy comp list1' list2')
