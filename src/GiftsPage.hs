{-# LANGUAGE OverloadedStrings #-}

module GiftsPage where

import Layout
import Lucid

giftsPage :: Html ()
giftsPage = Layout.layout $ do
  h1_ "Gifts"
  p_ "Gift registry details here."
