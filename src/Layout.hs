{-# LANGUAGE OverloadedStrings #-}

module Layout (layout) where

import Control.Monad.Identity (Identity)
import Lucid

-- Define the layout of the HTML.
layout :: Monad m => HtmlT m () -> HtmlT m ()
layout page = doctypehtml_ $ do
  head_ $ do
    meta_ [charset_ "UTF-8"]
    meta_ [name_ "viewport", content_ "width=device-width, initial-scale=1.0"]
    title_ "Our Wedding"
    link_ [rel_ "stylesheet", type_ "text/css", href_ "/css/materialize.min.css"]
  body_ $ do
    nav_ [class_ "teal"] $ do
      div_ [class_ "nav-wrapper container"] $ do
        -- a_ [href_ "/", class_ "brand-logo"] "Our Wedding"
        ul_ [class_ "right"] $ do
          li_ $ a_ [href_ "/main"] "Wedding Information"
          li_ $ a_ [href_ "/programme"] "View Programme"
          li_ $ a_ [href_ "/venue"] "Venue Information"
          li_ $ a_ [href_ "/accommodation"] "Accommodation Information"
          li_ $ a_ [href_ "/gifts"] "Gifts"
          li_ $ a_ [href_ "/photos"] "Photo and Video Upload"
          li_ $ a_ [href_ "/guestbook"] "Guest Book"
          li_ $ a_ [href_ "/transportation"] "Transportation"
    div_ [class_ "container"] page
    script_ [src_ "/js/materialize.min.js"] ("" :: String)
