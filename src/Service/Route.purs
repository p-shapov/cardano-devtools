module Service.Route where

import Data.NonStrictEq (class NonStrictEq)
import Data.Generic.Rep (class Generic)
import Data.Maybe (Maybe(..))
import Prelude (class Eq, class Ord, class Show, ($))
import Routing.Duplex as RD
import Routing.Duplex.Generic as RG
import Routing.Duplex.Generic.Syntax ((/))

data Route
  = Home
  | Wallet
  | Contract (Maybe String)

derive instance eqRoute :: Eq Route
derive instance ordRoute :: Ord Route
derive instance genericRoute :: Generic Route _

instance nonStrictEqRoute :: NonStrictEq Route where
  nonStrictEq Home Home = true
  nonStrictEq Wallet Wallet = true
  nonStrictEq (Contract _) (Contract _) = true
  nonStrictEq _ _ = false

instance showRoute :: Show Route where
  show Home = "Home"
  show Wallet = "Wallet"
  show (Contract Nothing) = "Contract"
  show (Contract (Just sid)) = sid

routeCodec :: RD.RouteDuplex' Route
routeCodec = RD.root $ RG.sum
  { "Home": RG.noArgs
  , "Wallet": "wallet" / RG.noArgs
  , "Contract": "contract" / RD.optional RD.segment
  }