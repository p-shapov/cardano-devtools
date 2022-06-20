module Page.Home where

import Prelude

import Halogen as H
import Halogen.HTML as HH
import Type.Proxy (Proxy(..))

type Slot p = ∀ q. H.Slot q Void p

_home = Proxy :: Proxy "home"

component :: ∀ q i o m. H.Component q i o m
component =
  H.mkComponent
    { initialState: identity
    , render
    , eval: H.mkEval H.defaultEval
    }

render :: ∀ st a sl m. st -> H.ComponentHTML a sl m
render _ = HH.h1_ [ HH.text "Home Page" ]