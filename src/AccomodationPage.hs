{-# LANGUAGE OverloadedStrings #-}

module AccomodationPage where

import qualified Layout
import Lucid

-- Define our accommodation page.
accommodationPage :: Html ()
accommodationPage =
  Layout.baseTemplate $ do
    h1_ "Accommodation Information"
    p_ "Accommodation details here."