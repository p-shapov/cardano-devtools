module Component.Header.HTML where

import Component.Header.Styles (styles)
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP

header :: forall a b. HH.HTML a b
header = HH.header
  [ HP.classes [ styles.header ] ]
  []
