{-# LANGUAGE OverloadedStrings #-}

import Lucid
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
  get "/" $ lucid Index.indexPage

  post "/login" $ do
    password <- param "password" :: ActionM Text
    if password == "guest123" -- replace with actual password list or check
      then do
        setHeader "Set-Cookie" "password=guest123; Path=/; HttpOnly"
        redirect "/main"
      else redirect "/failed-login"

  get "/failed-login" $ lucid Index.failedLoginPage

  get "/main" $ checkAuth $ lucid Main.mainPage
  get "/programme" $ checkAuth $ lucid Programme.programmePage
  get "/venue" $ checkAuth $ lucid Venue.venuePage
  get "/accommodation" $ checkAuth $ lucid Accommodation.accommodationPage
  get "/gifts" $ checkAuth $ lucid Gifts.giftsPage
  get "/photos" $ checkAuth $ lucid PhotoVideo.photoVideoPage
  get "/guestbook" $ checkAuth $ lucid GuestBook.guestBookPage
  get "/transportation" $ checkAuth $ lucid Transportation.transportationPage

checkAuth :: ActionM () -> ActionM ()
checkAuth action = do
  maybeCookie <- header "Cookie"
  case maybeCookie of
    Just cookie ->
      if "password=guest123" `elem` words (unpack cookie) -- replace with actual password list or check
        then action
        else status unauthorized401 >> lucid Index.unauthorizedPage
    Nothing ->
      status unauthorized401 >> lucid Index.unauthorizedPage
