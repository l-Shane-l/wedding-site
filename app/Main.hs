{-# LANGUAGE OverloadedStrings #-}

import Lucid
import Network.HTTP.Types.Status (unauthorized401)
import qualified Templates.Accommodation as Accommodation
import qualified Templates.Footer as Footer
import qualified Templates.Gifts as Gifts
import qualified Templates.GuestBook as GuestBook
import qualified Templates.Header as Header
import qualified Templates.Index as Index
import qualified Templates.Main as Main
import qualified Templates.PhotoVideo as PhotoVideo
import qualified Templates.Programme as Programme
import qualified Templates.Transportation as Transportation
import qualified Templates.Venue as Venue
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
