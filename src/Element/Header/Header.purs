module Element.Header where

import Prelude

import Assets.Icons (iconCardano)
import Data.Maybe (Maybe(..))
import Element.Header.Styles (styles)
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP
import Util as U
import Web.UIEvent.MouseEvent (MouseEvent)

type Link t = Eq t => { label :: String, route :: t }

type Props t i =
  Eq t
  => { active :: Maybe t
     , links :: Array (Link t)
     , goto :: t -> MouseEvent -> i
     }

render :: ∀ w i t. Eq t => Props t i -> HH.HTML w i
render { active, links, goto } = HH.header
  [ U.composeCn [ U.CN styles.header ] ]
  [ renderLogo
  , HH.nav [ U.composeCn [ U.CN styles.nav ] ] (renderLink active goto <$> links)
  ]

renderLogo :: ∀ w i. HH.HTML w i
renderLogo = HH.div
  [ U.composeCn [ U.CN styles.logo ] ]
  [ iconCardano []
  , HH.text "Cardano devtools"
  ]

renderLink :: ∀ w i t. Eq t => Maybe t -> (t -> MouseEvent -> i) -> Link t -> HH.HTML w i
renderLink active goto { label, route } = HH.a
  [ U.composeCn
      [ U.CN styles.link
      , U.CondCN isActive styles."link--active"
      ]
  , HP.href "#"
  , HE.onClick $ goto route
  ]
  [ HH.text $ label ]
  where
  isActive = Just route == active
