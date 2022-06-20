module Component.HTML.Header where

import Prelude

import Assets.Icons (iconCardano)
import Data.Maybe (Maybe(..))
import Component.HTML.Header.Styles (styles)
import Component.Utils as U
import Halogen.HTML as HH
import Service.Route (Route)

type Link = { label :: String, route :: Route }

type Props =
  { active :: Maybe Route
  , links :: Array Link
  }

render :: ∀ w i. Props -> HH.HTML w i
render { active, links } = HH.header
  [ U.composeCn [ U.CN styles.header ] ]
  [ renderLogo
  , HH.nav [ U.composeCn [ U.CN styles.nav ] ] (renderLink active <$> links)
  ]

renderLogo :: ∀ w i. HH.HTML w i
renderLogo = HH.div
  [ U.composeCn [ U.CN styles.logo ] ]
  [ iconCardano []
  , HH.text "Cardano devtools"
  ]

renderLink :: ∀ w i. Maybe Route -> Link -> HH.HTML w i
renderLink active { label, route } = HH.a
  [ U.composeCn
      [ U.CN styles.link
      , U.CondCN isActive styles."link--active"
      ]
  , U.safeHref route
  ]
  [ HH.text $ label ]
  where
  isActive = Just route == active
