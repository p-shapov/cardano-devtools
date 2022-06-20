module Service.Route where

import Prelude

import Data.Generic.Rep (class Generic)
import Data.Show.Generic (genericShow)
import Routing.Duplex as RD
import Routing.Duplex.Generic (noArgs, sum)
import Routing.Duplex.Generic.Syntax ((/))

data Route
  = Home
  | Wallet
  | Contract String

derive instance genericRoute :: Generic Route _
derive instance eqRoute :: Eq Route
derive instance ordRoute :: Ord Route

instance showRoute :: Show Route where
  show = genericShow

routeCodec :: RD.RouteDuplex' Route
routeCodec = RD.root $ sum
  { "Home": noArgs
  , "Wallet": "wallet" / noArgs
  , "Contract": "contract" / RD.string RD.segment
  }