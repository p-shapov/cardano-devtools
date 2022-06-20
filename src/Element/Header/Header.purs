module Element.Header where

import Prelude

import Assets.Icons (iconCardano)
import Data.Maybe (Maybe(..))
import Element.Header.Styles (styles)
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP
import Web.UIEvent.MouseEvent (MouseEvent)

type Link t = Eq t => { label :: String, route :: t }

type Props t =
  Eq t
  => { active :: Maybe t
     , pages :: Array (Link t)
     }

render :: ∀ w i t. Eq t => Props t -> (t -> MouseEvent -> i) -> HH.HTML w i
render { active, pages } goto = HH.header
  [ HP.classes [ styles.header ] ]
  [ renderLogo
  , HH.nav
      [ HP.classes [ styles.nav ] ]
      (renderLink active goto <$> pages)
  ]

renderLogo :: ∀ w i. HH.HTML w i
renderLogo = HH.div
  [ HP.classes [ styles.logo ] ]
  [ iconCardano []
  , HH.text "Cardano devtools"
  ]

renderLink :: ∀ w i t. Eq t => Maybe t -> (t -> MouseEvent -> i) -> Link t -> HH.HTML w i
renderLink active goto { label, route } = HH.a
  [ HP.classes [ styles.link, if Just route == active then styles."link--active" else HH.ClassName "" ]
  , HP.href "#"
  , HE.onClick $ goto route
  ]
  [ HH.text $ label ]
