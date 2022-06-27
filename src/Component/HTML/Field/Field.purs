module Component.HTML.Field where

import Prelude

import Component.HTML.Field.Styles (styles)
import Component.Utils as U
import Data.Maybe (Maybe(..))
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Web.Event.Event (Event)

type Props =
  ∀ i r
  . Array
      ( HP.IProp
          ( type :: HP.InputType
          , name :: String
          , value :: String
          , placeholder :: String
          , onChange :: Event
          | r
          )
          i
      )

type Input =
  { title :: Maybe String
  , error :: Maybe String
  }

render :: ∀ w i. Input -> Props -> HH.HTML w i
render { title, error } props = HH.label
  [ U.composeCn [ U.CN styles."field" ] ]
  [ U.maybeEl title \text -> HH.span
      [ U.composeCn [ U.CN styles."title" ] ]
      [ HH.text text ]
  , HH.input (props <> [ U.composeCn [ U.CN styles."input" ] ])
  , U.maybeEl error \text -> HH.span
      [ U.composeCn [ U.CN styles."error" ] ]
      [ HH.text text ]
  ]

renderWithTitle :: ∀ w i. String -> Props -> HH.HTML w i
renderWithTitle text = render { title: Just text, error: Nothing }

renderWithError :: ∀ w i. Maybe String -> Props -> HH.HTML w i
renderWithError error = render { title: Nothing, error }

renderOnlyInput :: ∀ w i. Props -> HH.HTML w i
renderOnlyInput = render { title: Nothing, error: Nothing }
