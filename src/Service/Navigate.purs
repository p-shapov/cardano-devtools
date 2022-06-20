module Service.Navigate
  ( class Navigate
  , navigate
  ) where

import Prelude
import Halogen as H
import Service.Route (Route)

class Monad m <= Navigate m where
  navigate :: Route -> m Unit

instance navigateHalogenM :: Navigate m => Navigate (H.HalogenM st a sl msg m) where
  navigate = H.lift <<< navigate