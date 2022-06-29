module Component.Router where

import Prelude

import Component.HTML.Header as Header
import Data.Either (hush)
import Data.Maybe (Maybe(..), fromMaybe)
import Effect.Class (class MonadEffect)
import Halogen as H
import Halogen.HTML as HH
import Page.Contract as Contract
import Page.Home as Home
import Page.UiKit as UiKit
import Page.Wallet as Wallet
import Routing.Duplex as RD
import Routing.Hash as RH
import Service.Navigate (class Navigate, navigate)
import Service.Route (Route(..), routeCodec)

type State =
  { route :: Maybe Route
  }

data Query a = Navigate Route a

data Action = Initialize

type ChildSlots =
  ( home :: Home.Slot Unit
  , wallet :: Wallet.Slot Unit
  , uiKit :: UiKit.Slot Unit
  , contract :: Contract.Slot Unit
  )

headerNav :: Array Route
headerNav =
  [ Home
  , Wallet
  , Contract Nothing
  , UiKit
  ]

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

  render :: State -> H.ComponentHTML Action ChildSlots m
  render st = HH.div_
    [ Header.render { active: st.route, nav: headerNav }
    , case st.route of
        Nothing -> HH.h1_ [ HH.text "404" ]
        Just route -> case route of
          Home -> HH.slot_ Home._home unit Home.component unit
          Wallet -> HH.slot_ Wallet._wallet unit Wallet.component unit
          UiKit -> HH.slot_ UiKit._uiKit unit UiKit.component unit
          Contract msid -> case msid of
            Nothing -> HH.slot_ Contract._contract unit Contract.component unit
            Just sid -> HH.h1_ [ HH.text sid ]
    ]

  handleAction :: Action -> H.HalogenM State Action ChildSlots o m Unit
  handleAction = case _ of
    -- Handles initialization of the route
    Initialize -> do
      initialRoute <- hush <<< (RD.parse routeCodec) <$> H.liftEffect RH.getHash
      navigate $ fromMaybe Home initialRoute

  handleQuery :: ∀ a. Query a -> H.HalogenM State Action ChildSlots o m (Maybe a)
  handleQuery = case _ of
    -- This is the case that runs every time the brower's hash route changes.
    Navigate route a -> do
      mRoute <- H.gets _.route
      when (mRoute /= Just route) $
        H.modify_ _ { route = Just route }
      pure (Just a)
