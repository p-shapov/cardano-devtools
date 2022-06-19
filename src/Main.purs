module Main where

import Prelude

import AppM (runAppM)
import Component.Header (header)
import Effect (Effect)
import Halogen as H
import Halogen.Aff as HA
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Halogen.VDom.Driver (runUI)

main :: Effect Unit
main = HA.runHalogenAff do
  body <- HA.awaitBody
  _ <- runUI (H.hoist (runAppM { someEnvProp: "Some env" }) mainComponent) unit body
  pure unit

data Action = Increment | Decrement

mainComponent :: ∀ query input output m. H.Component (HH.HTML query) input output m
mainComponent =
  H.mkComponent
    { initialState
    , render
    , eval: H.mkEval $ H.defaultEval
    }
  where
  initialState _ = 0

  render _ =
    HH.div
      [ HP.classes [ HH.ClassName "main" ]
      ]

      [ header
      ]
