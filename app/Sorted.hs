module Sorted (Named, SortedBy, sortBy, mergeBy) where

import Data.Coerce
import qualified Data.List as L
import qualified Data.List.Utils as U -- from MissingH
import Named
import The

newtype SortedBy comparator a = SortedBy a
instance The (SortedBy comparator a) a

sortBy :: forall comparator a. Named comparator (a -> a -> Ordering) -> [a] -> SortedBy comparator [a]
sortBy comparator xs = coerce (L.sortBy (the comparator) xs)

mergeBy :: forall comparator a. Named comparator (a -> a -> Ordering) 
  -> SortedBy comparator [a]
  -> SortedBy comparator [a]
  -> SortedBy comparator [a]
mergeBy comparator xs ys = coerce (U.mergeBy (the comparator) (the xs) (the ys))
