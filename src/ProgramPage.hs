{-# LANGUAGE OverloadedStrings #-}

module ProgramPage where

import Layout
import Lucid

programPage :: Html ()
programPage = Layout.layout $ do
  h2_ "Wedding Schedule"
  div_ [class_ "container"] $ do
    div_ [class_ "row"] $ do
      div_ [class_ "col s12 m6 l4"] $ do
        div_ [class_ "card"] $ do
          div_ [class_ "card-content"] $ do
            span_ [class_ "card-title"] "Ceremony"
            p_ "1:00 PM - 2:00 PM"
            p_ "Wedding Venue"
      div_ [class_ "col s12 m6 l4"] $ do
        div_ [class_ "card"] $ do
          div_ [class_ "card-content"] $ do
            span_ [class_ "card-title"] "Cocktail Hour"
            p_ "2:30 PM - 3:30 PM"
            p_ "Reception Venue"
      div_ [class_ "col s12 m6 l4"] $ do
        div_ [class_ "card"] $ do
          div_ [class_ "card-content"] $ do
            span_ [class_ "card-title"] "Reception"
            p_ "4:00 PM - 9:00 PM"
            p_ "Reception Venue"
