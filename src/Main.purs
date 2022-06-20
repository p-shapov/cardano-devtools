module Main where

import Prelude

import AppM (runAppM)
import Component.Router as Router
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Aff (launchAff_)
import Halogen (liftEffect)
import Halogen as H
import Halogen.Aff as HA
import Halogen.VDom.Driver (runUI)
import Routing.Duplex (parse)
import Routing.Hash (matchesWith)
import Service.Route (routeCodec)

main :: Effect Unit
main = HA.runHalogenAff do
  let env = { someEnvProp: "Some env" }
  let rootComponent = H.hoist (runAppM env) Router.component

  body <- HA.awaitBody
  halogenIO <- runUI rootComponent unit body

  void $ liftEffect $ matchesWith (parse routeCodec) \old new ->
    when (old /= Just new) $ launchAff_ do
      _response <- halogenIO.query $ H.mkTell $ Router.Navigate new
      pure unit
