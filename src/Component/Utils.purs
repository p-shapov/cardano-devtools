module Component.Utils where

import Prelude

import Data.Maybe (Maybe(..))
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Routing.Duplex as RD
import Service.Route (Route, routeCodec)

safeHref :: ∀ r i. Route -> HH.IProp (href :: String | r) i
safeHref = HP.href <<< append "#" <<< RD.print routeCodec

data ClassName = CN String | CondCN Boolean String | CondElseCN Boolean String String

composeCn :: ∀ r i. Array ClassName -> HP.IProp (class :: String | r) i
composeCn = HP.classes <<< map
  \cn -> case cn of
    CondCN cond x -> HH.ClassName if cond then x else ""
    CondElseCN cond x y -> HH.ClassName if cond then x else y
    CN x -> HH.ClassName x

maybeEl :: ∀ w i a. Maybe a -> (a -> HH.HTML w i) -> HH.HTML w i
maybeEl (Just x) f = f x
maybeEl Nothing _ = HH.text ""

condEl :: ∀ w i. Boolean -> HH.HTML w i -> HH.HTML w i
condEl cond x = if cond then x else HH.text ""
