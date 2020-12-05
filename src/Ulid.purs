module Ulid
  ( Ulid
  , ulid
  , seededUlid
  , parseUlid
  , toString
  , monotonicFactory
  ) where

import Prelude
import Data.Function.Uncurried (Fn1, runFn1)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)

-- | A Universally Unique Lexicographically Sortable Identifier (ULID).
newtype Ulid
  = Ulid String

derive instance eqUlid :: Eq Ulid

derive instance ordUlid :: Ord Ulid

instance showUlid :: Show Ulid where
  show (Ulid value) = "(ULID " <> value <> ")"

type Timestamp
  = Number

foreign import ulidImpl :: Effect String

-- | Generates a ULID.
ulid :: Effect Ulid
ulid = map Ulid ulidImpl

foreign import seededUlidImpl :: EffectFn1 Timestamp String

-- | Generates a ULID using the provided timestamp as the seed.
seededUlid :: Timestamp -> Effect Ulid
seededUlid seedTime = map Ulid <<< runEffectFn1 seededUlidImpl $ seedTime

foreign import parseUlidImpl :: Fn1 String (Nullable String)

-- | Parses the given string as a ULID.
-- | Returns `Just` if the input is a valid ULID and `Nothing` otherwise.
parseUlid :: String -> Maybe Ulid
parseUlid input =
  map Ulid
    <<< toMaybe
    <<< runFn1 parseUlidImpl
    $ input

-- | Returns the string representation of the ULID.
toString :: Ulid -> String
toString (Ulid value) = value

foreign import monotonicFactoryImpl :: Effect (Timestamp -> Effect String)

-- | Returns a factory for generating monotonically-increasing ULIDs.
monotonicFactory :: Effect (Timestamp -> Effect Ulid)
monotonicFactory = do
  factory <- monotonicFactoryImpl
  pure $ map Ulid <<< factory
