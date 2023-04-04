{-# LANGUAGE OverloadedStrings #-}

module PhotoVideoPage where

import Layout
import Lucid

-- Define our photo and video page.
photoVideoPage :: Html ()
photoVideoPage =
  Layout.layout $ do
    h1_ "Photo and Video Upload"
    p_ "Photo and video upload instructions here."