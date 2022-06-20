module Element.Header.Styles
  ( styles
  ) where

import Halogen.HTML as HH

foreign import styles
  :: { header :: HH.ClassName
     , logo :: HH.ClassName
     , nav :: HH.ClassName
     , link :: HH.ClassName
     , "link--active" :: HH.ClassName
     }
