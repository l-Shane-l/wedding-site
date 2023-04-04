{-# LANGUAGE OverloadedStrings #-}

module Templates.GiftsPage where

import Layout
import Lucid

giftsPage :: Html ()
giftsPage = layout "Gifts" $ do
  h1_ "Gifts"
  p_ "Gift registry details here."