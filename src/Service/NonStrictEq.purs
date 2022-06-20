module Service.NonStrictEq where

import Prelude

import Data.Either (Either(..))
import Data.Maybe (Maybe(..))

class Eq a <= NonStrictEq a where
  nonStrictEq :: a -> a -> Boolean

infix 4 nonStrictEq as ~=

instance nonStrictEqMaybe :: NonStrictEq a => NonStrictEq (Maybe a) where
  nonStrictEq (Just x) (Just y) = x ~= y
  nonStrictEq Nothing Nothing = true
  nonStrictEq _ _ = false

instance nonStrictEqEither :: (NonStrictEq a, NonStrictEq b) => NonStrictEq (Either a b) where
  nonStrictEq (Left x) (Left y) = x ~= y
  nonStrictEq (Right x) (Right y) = x ~= y
  nonStrictEq _ _ = false