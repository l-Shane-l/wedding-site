{-# LANGUAGE OverloadedStrings #-}

module LoginPage where

import Lucid
import qualified Templates.Layout as Layout

-- | Render the login page.
loginPage :: Html ()
loginPage =
  Layout.baseTemplate $ do
    h1_ "Welcome to Our Wedding"
    p_ "Please enter your guest code to proceed:"
    form_ [method_ "post", action_ "/login", class_ "col s12"] $ do
      div_ [class_ "row"] $ do
        div_ [class_ "input-field col s12"] $ do
          input_ [type_ "password", name_ "password", class_ "validate"]
          label_ "Password"
      div_ [class_ "row"] $ do
        div_ [class_ "col s12"] $ do
          button_ [type_ "submit", class_ "waves-effect waves-light btn"] "Login"
