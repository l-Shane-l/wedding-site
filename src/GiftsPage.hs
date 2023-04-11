{-# LANGUAGE OverloadedStrings #-}

module GiftsPage where

import Layout
import Lucid

giftsPage :: Html ()
giftsPage = Layout.layout $ do
  div_ [class_ "container"] $ do
    h1_ [class_ "center-align"] "Gifts"
    p_ [class_ "flow-text"] "We kindly and humbly accept your thoughtful gifts to celebrate our special day. We truly appreciate your love and generosity."
    p_ [class_ "flow-text"] "You can send gifts using either PayPal or Revolut by selecting one of the options below:"
    div_ [class_ "row center-align"] $ do
      div_ [class_ "col s12 m6"] $ do
        h4_ "PayPal"
        p_ "To send a gift via PayPal, please use the following link:"
        button_ [class_ "btn-large purple waves-effect waves-light", href_ "https://www.paypal.com/paypalme/ShaabanHamilton"] "PayPal"
      div_ [class_ "col s12 m6"] $ do
        h4_ "Revolut"
        p_ "To send a gift via Revolut, please use the following link:"
        button_ [class_ "btn-large purple waves-effect waves-light", href_ "https://www.revolut.com/shane7kw"] "Revolut"
