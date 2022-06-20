module Component.Utils where

import Prelude

import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Routing.Duplex as RD
import Service.Route (Route, routeCodec)

safeHref :: ∀ r i. Route -> HH.IProp (href :: String | r) i
safeHref = HP.href <<< append "#" <<< RD.print routeCodec

data ClassName = CN String | CondCN Boolean String | CondElseCN Boolean String String

composeCn :: ∀ r i. Array ClassName -> HP.IProp (class :: String | r) i
composeCn = HP.classes <<< map
  ( \cn -> case cn of
      CondCN cond x -> HH.ClassName if cond then x else ""
      CondElseCN cond x y -> HH.ClassName if cond then x else y
      CN x -> HH.ClassName x
  )