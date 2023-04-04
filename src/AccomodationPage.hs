{-# LANGUAGE OverloadedStrings #-}

module Templates.AccommodationPage where

import Lucid
import qualified Templates.Layout as Layout

-- Define our accommodation page.
accommodationPage :: Html ()
accommodationPage =
  Layout.baseTemplate $ do
    h1_ "Accommodation Information"
    p_ "Accommodation details here."