module Main where

import Prelude

import AppM (runAppM)
import Component.Router as Router
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Aff (Aff, apathize, launchAff_)
import Effect.Console (log)
import Halogen (liftEffect)
import Halogen as H
import Halogen.Aff as HA
import Halogen.VDom.Driver (runUI)
import Routing.Duplex (parse)
import Routing.Hash (matchesWith)
import Service.Route (routeCodec)

main :: Effect Unit
main = HA.runHalogenAff do
  body <- HA.awaitBody
  let env = { someEnvProp: "Some env" }
  let
    rootComponent :: ∀ i. H.Component Router.Query i Void Aff
    rootComponent = H.hoist (runAppM env) Router.component

  halogenIO <- runUI rootComponent unit body

  void $ liftEffect $ matchesWith (parse routeCodec) \old new ->
    when (old /= Just new) $ launchAff_ do
      _response <- halogenIO.query $ H.mkTell $ Router.Navigate new
      pure unit
