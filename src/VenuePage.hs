{-# LANGUAGE OverloadedStrings #-}

module VenuePage where

import Layout
import Lucid

venuePage :: Html ()
venuePage = baseTemplate $ do
  h1_ "Venue Information"
  div_ [class_ "row"] $ do
    div_ [class_ "col s12 m6"] $ do
      h2_ "Ceremony"
      p_ "The ceremony will be held at the Sacred Heart Church, which is located at:"
      ul_ $ do
        li_ "123 Main Street"
        li_ "Anytown, USA 12345"
      p_ "The ceremony will begin promptly at 2:00 PM, so please arrive at least 15 minutes early to ensure seating."
      img_ [src_ "/img/church.jpg", alt_ "Sacred Heart Church", class_ "responsive-img"]
    div_ [class_ "col s12 m6"] $ do
      h2_ "Reception"
      p_ "The reception will be held at the Sunset Banquet Hall, which is located at:"
      ul_ $ do
        li_ "456 Oak Street"
        li_ "Anytown, USA 12345"
      p_ "The reception will begin immediately after the ceremony and will end at 8:00 PM. Dinner will be served at 6:00 PM. We look forward to celebrating with you!"
      img_ [src_ "/img/banquet.jpg", alt_ "Sunset Banquet Hall", class_ "responsive-img"]