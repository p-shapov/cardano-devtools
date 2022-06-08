module Component.Header where

import Prelude

import Halogen.HTML as HH

header :: forall a b. HH.HTML a b
header = HH.header
  [ css "header" ]
  []
