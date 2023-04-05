{-# LANGUAGE OverloadedStrings #-}

module Layout (layout) where

import Control.Monad.Identity (Identity)
import Lucid

menuItems :: Monad m => HtmlT m ()
menuItems = do
  li_ $ a_ [href_ "/main"] "Wedding Information"
  li_ $ a_ [href_ "/program"] "View Programme"
  li_ $ a_ [href_ "/venue"] "Venue Information"
  li_ $ a_ [href_ "/accommodation"] "Accommodation Information"
  li_ $ a_ [href_ "/gifts"] "Gifts"
  li_ $ a_ [href_ "/photos"] "Photo and Video Upload"
  li_ $ a_ [href_ "/guestbook"] "Guest Book"
  li_ $ a_ [href_ "/transportation"] "Transportation"

layout :: Monad m => HtmlT m () -> HtmlT m ()
layout page = doctypehtml_ $ do
  head_ $ do
    meta_ [charset_ "UTF-8"]
    meta_ [name_ "viewport", content_ "width=device-width, initial-scale=1.0"]
    title_ "Our Wedding"
    link_ [rel_ "stylesheet", type_ "text/css", href_ "/css/materialize.min.css"]
    link_ [rel_ "stylesheet", type_ "text/css", href_ "https://fonts.googleapis.com/icon?family=Material+Icons"]
    link_ [rel_ "stylesheet", type_ "text/css", href_ "https://fonts.googleapis.com/css?family=Great+Vibes&display=swap"]
    style_ $ do
      "body { font-family: 'Great Vibes', cursive; font-size: 16px; }"

  body_ [onload_ "initSidenav();"] $ do
    nav_ [class_ "purple"] $ do
      div_ [class_ "nav-wrapper container"] $ do
        a_ [href_ "/", class_ "brand-logo"] "Sandra & Shane's Wedding"
        a_ [href_ "#mobile-nav", class_ "sidenav-trigger", data_ "target" "mobile-nav"] $
          i_ [class_ "material-icons"] "menu"
        ul_ [class_ "right hide-on-med-and-down"] menuItems
    ul_ [id_ "mobile-nav", class_ "sidenav"] menuItems
    div_ [class_ "container"] page
    script_ [src_ "/js/materialize.min.js"] ("" :: String)
    script_ "function initSidenav() { var elems = document.querySelectorAll('.sidenav'); var instances = M.Sidenav.init(elems); }"
