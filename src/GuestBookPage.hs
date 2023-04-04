{-# LANGUAGE OverloadedStrings #-}

module GuestBookPage where

import Layout
import Lucid

-- Define our guest book page.
guestBookPage :: Html ()
guestBookPage =
  Layout.layout $ do
    h1_ "Guest Book"
    p_ "Guest book details here."