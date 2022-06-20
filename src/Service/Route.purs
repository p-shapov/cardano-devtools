module Service.Route where

import Data.Generic.Rep (class Generic)
import Data.Maybe (Maybe(..))
import Prelude (class Eq, class Ord, class Show, ($), (==))
import Routing.Duplex as RD
import Routing.Duplex.Generic as RG
import Routing.Duplex.Generic.Syntax ((/))

data Route
  = Home
  | Wallet
  | Contract (Maybe String)

instance eqRoute :: Eq Route where
  eq Home Home = true
  eq Wallet Wallet = true
  eq (Contract Nothing) (Contract _) = true
  eq (Contract (Just x)) (Contract (Just y)) = x == y
  eq _ _ = false

derive instance ordRoute :: Ord Route
derive instance genericRoute :: Generic Route _
instance showRoute :: Show Route where
  show Home = "Home"
  show Wallet = "Wallet"
  show (Contract Nothing) = "Contract"
  show (Contract (Just instanceId)) = instanceId

routeCodec :: RD.RouteDuplex' Route
routeCodec = RD.root $ RG.sum
  { "Home": RG.noArgs
  , "Wallet": "wallet" / RG.noArgs
  , "Contract": "contract" / RD.optional RD.segment
  }