{-# LANGUAGE OverloadedStrings #-}

module Templates.GuestBookPage where

import Lucid
import Templates.Layout

-- Define our guest book page.
guestBookPage :: Html ()
guestBookPage =
  baseTemplate $ do
    h1_ "Guest Book"
    p_ "Guest book details here."