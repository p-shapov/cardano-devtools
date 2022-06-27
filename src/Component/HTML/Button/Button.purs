module Component.HTML.Button where

import Prelude

import Component.HTML.Button.Styles (styles)
import Component.Utils as U
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Web.UIEvent.MouseEvent as ME

data Appearance = Primary | Secondary

derive instance eqAppearance :: Eq Appearance

type Props =
  ∀ r i
  . Array
      ( HP.IProp
          ( type :: HP.ButtonType
          , onClick :: ME.MouseEvent
          | r
          )
          i
      )

render :: ∀ w i. Appearance -> Props -> Array (HH.HTML w i) -> HH.HTML w i
render appearance props html =
  HH.button
    ( props <>
        [ U.composeCn
            [ U.CN styles.button
            , U.CondElseCN
                (appearance == Primary)
                styles."button--appearance_primary"
                styles."button--appearance_secondary"
            ]
        ]
    )
    html

renderPrimary :: ∀ i w. Props -> Array (HH.HTML w i) -> HH.HTML w i
renderPrimary = render Primary

renderSecondary :: ∀ i w. Props -> Array (HH.HTML w i) -> HH.HTML w i
renderSecondary = render Secondary
