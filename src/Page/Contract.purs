module Page.Contract where

import Prelude

import Halogen.HTML as HH

component :: ∀ a b. String -> HH.HTML a b
component id = HH.div
  []
  [ HH.text $ "Wallet: " <> id ]
