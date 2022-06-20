module Service.Route where

import Data.Generic.Rep (class Generic)
import Data.Maybe (Maybe)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord, class Show, ($))
import Routing.Duplex as RD
import Routing.Duplex.Generic (noArgs, sum)
import Routing.Duplex.Generic.Syntax ((/))

data Route
  = Home
  | Wallet
  | Contract (Maybe String)

derive instance genericRoute :: Generic Route _
derive instance eqRoute :: Eq Route
derive instance ordRoute :: Ord Route

instance showRoute :: Show Route where
  show = genericShow

routeCodec :: RD.RouteDuplex' Route
routeCodec = RD.root $ sum
  { "Home": noArgs
  , "Wallet": "wallet" / noArgs
  , "Contract": "contract" / RD.optional RD.segment
  }