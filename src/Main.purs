module Main where

import Prelude

import AppM (runAppM)
import Effect (Effect)
import Halogen as H
import Halogen.Aff as HA
import Halogen.HTML as HH
import Halogen.HTML.CSS as HCSS
import Halogen.HTML.Properties as HP
import Halogen.VDom.Driver (runUI)
import Main.CSS as Styles

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

      [ HCSS.stylesheet Styles.main
      , HH.span_ [ HH.text "asd" ]
      ]
