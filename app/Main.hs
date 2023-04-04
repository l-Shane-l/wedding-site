{-# LANGUAGE OverloadedStrings #-}

module Main where

import qualified Lucid as L
import Network.HTTP.Types.Status (unauthorized401)
import qualified Templates.AccommodationPage as AccommodationPage
import qualified Templates.GiftsPage as GiftsPage
import qualified Templates.GuestBookPage as GuestBookPage
import qualified Templates.Layout as Layout
import qualified Templates.LoginPage as LoginPage
import qualified Templates.MainPage as MainPage
import qualified Templates.PhotosVideoPage as PhotosVideoPage
import qualified Templates.TransportationPage as TransportationPage
import qualified Templates.VenuePage as VenuePage
import Web.Scotty

main :: IO ()
main = scotty 3000 $ do
  get "/" $ html $ L.renderText $ Layout.baseTemplate "Our Wedding" LoginPage.loginPage

  post "/login" $ do
    password <- param "password" :: ActionM L.Text
    if password == "guest123"
      then do
        setHeader "Set-Cookie" "password=guest123; Path=/; HttpOnly"
        redirect "/main"
      else redirect "/failed-login"

  get "/failed-login" $ html $ L.renderText $ Layout.baseTemplate "Login Failed" LoginPage.failedLoginPage

  get "/main" $ checkAuth $ html $ L.renderText $ Layout.baseTemplate "Wedding Information" MainPage.mainPage
  get "/programme" $ checkAuth $ html $ L.renderText $ Layout.baseTemplate "Programme" MainPage.mainPage
  get "/venue" $ checkAuth $ html $ L.renderText $ Layout.baseTemplate "Venue Information" VenuePage.venuePage
  get "/accommodation" $ checkAuth $ html $ L.renderText $ Layout.baseTemplate "Accommodation Information" AccommodationPage.accommodationPage
  get "/gifts" $ checkAuth $ html $ L.renderText $ Layout.baseTemplate "Gifts" GiftsPage.giftsPage
  get "/photos" $ checkAuth $ html $ L.renderText $ Layout.baseTemplate "Photo and Video Upload" PhotosVideoPage.photosVideoPage
  get "/guestbook" $ checkAuth $ html $ L.renderText $ Layout.baseTemplate "Guest Book" GuestBookPage.guestBookPage
  get "/transportation" $ checkAuth $ html $ L.renderText $ Layout.baseTemplate "Transportation" TransportationPage.transportationPage

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
