module Component.Router
  ( Action(..)
  , Query(..)
  , component
  ) where

import Prelude

import Data.Either (hush)
import Data.Generic.Rep (class Generic)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Show.Generic (genericShow)
import Effect.Class (class MonadEffect, liftEffect)
import Effect.Console (log)
import Element.Header as Header
import Halogen as H
import Halogen.HTML as HH
import Page.Home as Home
import Page.Wallet as Wallet
import Routing.Duplex as RD
import Routing.Hash as RH
import Service.Navigate (class Navigate, navigate)
import Service.Route (Route(..), routeCodec)
import Web.Event.Event (preventDefault)
import Web.UIEvent.MouseEvent (MouseEvent, toEvent)

type State =
  { route :: Maybe Route
  }

data Query a = Navigate Route a

derive instance genericQuery :: Generic (Query a) _
instance showQuery :: Show a => Show (Query a) where
  show = genericShow

data Action = Initialize | GoTo Route MouseEvent

type ChildSlots =
  ( home :: Home.Slot Unit
  , wallet :: Wallet.Slot Unit
  )

component :: ∀ i o m. MonadEffect m => Navigate m => H.Component Query i o m
component = H.mkComponent
  { initialState: const { route: Nothing }
  , render
  , eval: H.mkEval $ H.defaultEval
      { handleAction = handleAction
      , handleQuery = handleQuery
      , initialize = Just Initialize
      }
  }
  where

  render :: ∀ m. State -> H.ComponentHTML Action ChildSlots m
  render st = HH.div_
    [ Header.render
        { active: st.route
        , pages:
            [ { label: "Home", route: Home }
            , { label: "Wallet", route: Wallet }
            ]
        }
        \route -> GoTo route
    , case st.route of
        Nothing -> HH.h1_ [ HH.text "That page wasn't found" ]
        Just route -> case route of
          Home -> HH.slot_ Home._home unit Home.component unit
          Wallet -> HH.slot_ Wallet._wallet unit Wallet.component unit
          Contract a -> HH.h1_ [ HH.text $ show a ]
    ]

  handleAction :: ∀ o m. MonadEffect m => Navigate m => Action -> H.HalogenM State Action ChildSlots o m Unit
  handleAction = case _ of
    -- Handles initialization of the route
    Initialize -> do
      initialRoute <- hush <<< (RD.parse routeCodec) <$> H.liftEffect RH.getHash
      navigate $ fromMaybe Home initialRoute
    --  Handles the consecutive route changes.
    GoTo route e -> do
      liftEffect $ preventDefault (toEvent e)
      mRoute <- H.gets _.route
      when (mRoute /= Just route) $ navigate route

  handleQuery :: ∀ a o m. Query a -> H.HalogenM State Action ChildSlots o m (Maybe a)
  handleQuery = case _ of
    -- This is the case that runs every time the brower's hash route changes.
    Navigate route a -> do
      mRoute <- H.gets _.route
      when (mRoute /= Just route) $
        H.modify_ _ { route = Just route }
      pure (Just a)