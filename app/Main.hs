{-# LANGUAGE OverloadedStrings #-}

import Data.Text.Lazy (Text, unpack)
import Network.HTTP.Types.Status (unauthorized401)
import Web.Scotty

main :: IO ()
main = scotty 3000 $ do
  get "/" $ file "static/index.html"

  post "/login" $ do
    password <- param "password" :: ActionM Text
    if password == "guest123" -- replace with actual password list or check
      then do
        setHeader "Set-Cookie" "password=guest123; Path=/; HttpOnly"
        redirect "/main"
      else redirect "/failed-login"

  get "/failed-login" $ file "static/failed-login.html"

  get "/main" $ checkAuth $ file "static/main.html"
  get "/programme" $ checkAuth $ file "static/programme.html"
  get "/venue" $ checkAuth $ file "static/venue.html"
  get "/accommodation" $ checkAuth $ file "static/accommodation.html"
  get "/gifts" $ checkAuth $ file "static/gifts.html"
  get "/photos" $ checkAuth $ file "static/photos.html"
  get "/guestbook" $ checkAuth $ file "static/guestbook.html"
  get "/transportation" $ checkAuth $ file "static/transportation.html"

checkAuth :: ActionM () -> ActionM ()
checkAuth action = do
  maybeCookie <- header "Cookie"
  case maybeCookie of
    Just cookie ->
      if "password=guest123" `elem` words (unpack cookie) -- replace with actual password list or check
        then action
        else status unauthorized401 >> text "Unauthorized access."
    Nothing ->
      status unauthorized401 >> text "Unauthorized access."
