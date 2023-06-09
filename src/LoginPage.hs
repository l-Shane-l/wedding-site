{-# LANGUAGE OverloadedStrings #-}

module LoginPage (loginPage, failedLoginPage) where

import qualified Layout
import Lucid

-- | Render the login page.
loginPage :: Html ()
loginPage =
  Layout.layout $ do
    h1_ "Welcome to Our Wedding"
    p_ "Please enter your guest code to proceed:"
    form_ [method_ "post", action_ "/login", class_ "col s12"] $ do
      div_ [class_ "row"] $ do
        div_ [class_ "input-field col s12"] $ do
          input_ [type_ "password", name_ "password", id_ "password-input", class_ "validate"]
          label_ [for_ "password-input"] "Password"
      div_ [class_ "row"] $ do
        div_ [class_ "col s12"] $ do
          button_ [type_ "submit", class_ "purple waves-effect waves-light btn"] "Login"

-- | Render the failed login page.
failedLoginPage :: Html ()
failedLoginPage =
  Layout.layout $ do
    h1_ "Invalid Login"
    p_ "The login credentials you provided are incorrect. Please try again."
    a_ [href_ "/"] "Go back to login page."
