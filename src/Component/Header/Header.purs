module Component.Header
  ( header
  ) where

import Prelude

import Assets.Icons (iconCardano)
import Component.Header.Styles (styles)
import Data.Tuple (Tuple(..))
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP

header :: ∀ w i. HH.HTML w i
header = HH.header
  [ HP.classes [ styles.header ] ]
  [ logo
  , HH.nav
      [ HP.classes [ styles.nav ] ]
      (renderLink <$> links)
  ]

newtype URL = URL String

type Link = Tuple String URL

logo :: ∀ w i. HH.HTML w i
logo = HH.div
  [ HP.classes [ styles.logo ] ]
  [ iconCardano []
  , HH.text "Cardano devtools"
  ]

renderLink :: ∀ w i. Link -> HH.HTML w i
renderLink (Tuple label (URL url)) = HH.a
  [ HP.classes [ styles.link ]
  , HP.href url
  ]
  [ HH.text label ]

links :: Array Link
links =
  [ Tuple "Home" (URL "/")
  , Tuple "Wallet" (URL "/wallet")
  , Tuple "Contract" (URL "/contract")
  ]
