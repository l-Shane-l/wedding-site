{-# LANGUAGE OverloadedStrings #-}

module AccomodationPage where

import qualified Layout
import Lucid

-- Define our accommodation page.
accomodationPage :: Html ()
accomodationPage =
  Layout.layout $ do
    h1_ "Accomodation Information"
    p_ "Accomodation details here."