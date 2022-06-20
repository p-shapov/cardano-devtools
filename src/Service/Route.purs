module Service.Route where

import Data.Generic.Rep (class Generic)
import Data.Maybe (Maybe)
import Prelude (class Eq, class Ord, ($))
import Routing.Duplex as RD
import Routing.Duplex.Generic as RG
import Routing.Duplex.Generic.Syntax ((/))

data Route
  = Home
  | Wallet
  | Contract (Maybe String)

derive instance genericRoute :: Generic Route _
derive instance eqRoute :: Eq Route
derive instance ordRoute :: Ord Route

routeCodec :: RD.RouteDuplex' Route
routeCodec = RD.root $ RG.sum
  { "Home": RG.noArgs
  , "Wallet": "wallet" / RG.noArgs
  , "Contract": "contract" / RD.optional RD.segment
  }