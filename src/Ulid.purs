module Ulid
  ( Ulid
  , ulid
  , toString
  ) where

import Prelude
import Effect (Effect)

-- | A Universally Unique Lexicographically Sortable Identifier (ULID).
newtype Ulid
  = Ulid String

derive instance eqUlid :: Eq Ulid

derive instance ordUlid :: Ord Ulid

instance showUlid :: Show Ulid where
  show (Ulid value) = "(ULID " <> value <> ")"

foreign import ulidImpl :: Effect String

-- | Generates a ULID.
ulid :: Effect Ulid
ulid = map Ulid ulidImpl

-- | Returns the string representation of the ULID.
toString :: Ulid -> String
toString (Ulid value) = value
