module Component.HTML.Header where

import Prelude

import Assets.Icons (iconCardano)
import Data.Maybe (Maybe(..))
import Component.HTML.Header.Styles (styles)
import Component.Utils as U
import Halogen.HTML as HH
import Service.Route (Route)
import Service.NonStrictEq ((~=))

type Input =
  { active :: Maybe Route
  , nav :: Array Route
  }

render :: ∀ w i. Input -> HH.HTML w i
render { active, nav } = HH.header
  [ U.composeCn [ U.CN styles.header ] ]
  [ renderLogo
  , HH.nav [ U.composeCn [ U.CN styles.nav ] ] (renderLink <$> nav)
  ]
  where

  renderLogo :: HH.HTML w i
  renderLogo = HH.div
    [ U.composeCn [ U.CN styles.logo ] ]
    [ iconCardano []
    , HH.text "Cardano devtools"
    ]

  renderLink :: Route -> HH.HTML w i
  renderLink route = HH.a
    [ U.composeCn
        [ U.CN styles.link
        , U.CondCN isActive styles."link--active"
        ]
    , U.safeHref route
    ]
    [ HH.text $ show route ]
    where
    isActive = Just route ~= active
