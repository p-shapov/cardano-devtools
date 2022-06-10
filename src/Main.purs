module Main where

import Prelude

import AppM (runAppM)
import Assets.Images (logo)
import Component.Header.HTML (header)
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

mainComponent :: forall a b c d. H.Component (HH.HTML a) b c d
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
      , HH.img [ HP.src logo ]
      ]
