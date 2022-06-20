module Element.Header.Styles
  ( styles
  ) where

import Util as U

foreign import styles
  :: { header :: String
     , logo :: String
     , nav :: String
     , link :: String
     , "link--active" :: String
     }
