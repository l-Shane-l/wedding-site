{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import AccomodationPage (accomodationPage)
import qualified Data.Text.Lazy as L
import GiftsPage (giftsPage)
import GuestBookPage (guestBookPage)
import Layout (layout)
import LoginPage (failedLoginPage, loginPage)
import qualified Lucid as L
import MainPage (mainPage)
import Network.HTTP.Types.Status (unauthorized401)
import PhotoVideoPage (photoVideoPage)
import TransportationPage (transportationPage)
import VenuePage (venuePage)
import Web.Scotty

main :: IO ()
main = scotty 3000 $ do
  get "/" $ html $ L.renderText $ Layout.layout loginPage

  post "/login" $ do
    password <- param "password" :: ActionM L.Text
    if password == "guest123"
      then do
        setHeader "Set-Cookie" "password=guest123; Path=/; HttpOnly"
        redirect "/main"
      else redirect "/failed-login"

  get "/failed-login" $ html $ L.renderText $ Layout.layout failedLoginPage
  get "/main" $ checkAuth $ html $ L.renderText $ Layout.layout mainPage
  get "/programme" $ checkAuth $ html $ L.renderText $ Layout.layout mainPage
  get "/venue" $ checkAuth $ html $ L.renderText $ Layout.layout venuePage
  get "/accommodation" $ checkAuth $ html $ L.renderText $ Layout.layout accomodationPage
  get "/gifts" $ checkAuth $ html $ L.renderText $ Layout.layout giftsPage
  get "/photos" $ checkAuth $ html $ L.renderText $ Layout.layout photoVideoPage
  get "/guestbook" $ checkAuth $ html $ L.renderText $ Layout.layout guestBookPage
  get "/transportation" $ checkAuth $ html $ L.renderText $ Layout.layout transportationPage

checkAuth :: ActionM () -> ActionM ()
checkAuth action = do
  maybeCookie <- header "Cookie"
  case maybeCookie of
    Just cookie ->
      if "password=guest123" `elem` words (L.unpack cookie)
        then action
        else status unauthorized401 >> text "Unauthorized access."
    Nothing ->
      status unauthorized401 >> text "Unauthorized access."
