module Page.UiKit where

import Prelude

import Component.HTML.Button as Button
import Component.UiKit.Styles (styles)
import Component.Utils as U
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Type.Proxy (Proxy(..))

type Slot p = ∀ q. H.Slot q Void p

_uiKit = Proxy :: Proxy "uiKit"

component :: ∀ q i o m. H.Component q i o m
component =
  H.mkComponent
    { initialState: identity
    , render
    , eval: H.mkEval H.defaultEval
    }

render :: ∀ st a sl m. st -> H.ComponentHTML a sl m
render _ = HH.div
  [ U.composeCn [ U.CN styles."ui-kit" ] ]
  [ HH.span [ U.composeCn [ U.CN styles."title" ] ] [ HH.text "Buttons" ]
  , HH.div [ U.composeCn [ U.CN styles."plate" ] ]
      [ Button.renderPrimary [ HP.type_ HP.ButtonButton ] [ HH.text "Primary" ]
      , Button.renderSecondary [ HP.type_ HP.ButtonButton ] [ HH.text "Secondary" ]
      ]
  ]