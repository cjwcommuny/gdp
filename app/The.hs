module The where
import Data.Coerce (coerce, Coercible)

class The d a | d -> a where
    the :: d -> a
    default the :: Coercible d a => d -> a
    the = coerce
