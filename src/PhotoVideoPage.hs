{-# LANGUAGE OverloadedStrings #-}

module PhotoVideoPage where

import Lucid
import Templates.Layout

-- Define our photo and video page.
photoVideoPage :: Html ()
photoVideoPage =
  baseTemplate $ do
    h1_ "Photo and Video Upload"
    p_ "Photo and video upload instructions here."