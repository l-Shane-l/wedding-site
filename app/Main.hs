{-# LANGUAGE OverloadedStrings #-}

module Main where

import AccomodationPage (accomodationPage)
import qualified Data.Text.Lazy as L
import GiftsPage (giftsPage)
import GuestBookPage (guestBookPage)
import Layout (layout)
import LoginPage (failedLoginPage, loginPage)
import Lucid
import qualified Lucid as L
import MainPage (mainPage)
import Network.HTTP.Types.Status (unauthorized401)
import PhotoVideoPage (photoVideoPage)
import TransportationPage (transportationPage)
import VenuePage (venuePage)
import Web.Scotty

main :: IO ()
main = scotty 3000 $ do
  get "/" $ html $ L.renderText $ Layout.layout "Our Wedding" loginPage

  post "/login" $ do
    password <- param "password" :: ActionM L.Text
    if password == "guest123"
      then do
        setHeader "Set-Cookie" "password=guest123; Path=/; HttpOnly"
        redirect "/main"
      else redirect "/failed-login"

  get "/failed-login" $ html $ L.renderText $ Layout.layout "Login Failed" failedLoginPage

  get "/main" $ checkAuth $ html $ L.renderText $ Layout.layout "Wedding Information" mainPage
  get "/programme" $ checkAuth $ html $ L.renderText $ Layout.layout "Programme" mainPage
  get "/venue" $ checkAuth $ html $ L.renderText $ Layout.layout "Venue Information" venuePage
  get "/accommodation" $ checkAuth $ html $ L.renderText $ Layout.layout "Accommodation Information" accomodationPage
  get "/gifts" $ checkAuth $ html $ L.renderText $ Layout.layout "Gifts" giftsPage
  get "/photos" $ checkAuth $ html $ L.renderText $ Layout.layout "Photo and Video Upload" photoVideoPage
  get "/guestbook" $ checkAuth $ html $ L.renderText $ Layout.layout "Guest Book" guestBookPage
  get "/transportation" $ checkAuth $ html $ L.renderText $ Layout.layout "Transportation" transportationPage

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
