module AppM where

import Prelude
import Control.Monad.Error.Class (class MonadError, class MonadThrow)
import Control.Monad.Reader (ReaderT, runReaderT)
import Data.Newtype (class Newtype, unwrap)
import Effect.Aff (Aff, Error)
import Effect.Aff.Class (class MonadAff)
import Effect.Class (class MonadEffect)

newtype AppM a = AppM (ReaderT Env Aff a)

derive instance newtypeAppM :: Newtype (AppM a) _
derive instance functorAppM :: Functor AppM
derive newtype instance applyAppM :: Apply AppM
derive newtype instance applicativeAppM :: Applicative AppM
derive newtype instance bindAppM :: Bind AppM
derive newtype instance monadAppM :: Monad AppM
derive newtype instance monadEffectAppM :: MonadEffect AppM
derive newtype instance monadAffAppM :: MonadAff AppM
derive newtype instance monadThrowAppM :: MonadThrow Error AppM
derive newtype instance monadErrorAppM :: MonadError Error AppM

type Env = { someEnvProp :: String }

runAppM :: forall a. Env -> AppM a -> Aff a
runAppM env = flip runReaderT env <<< unwrap
