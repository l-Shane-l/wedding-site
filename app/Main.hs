{-# LANGUAGE OverloadedStrings #-}

import Data.Text.Lazy (Text, unpack)
import Network.HTTP.Types.Status (unauthorized401)
import Web.Scotty

main :: IO ()
main = scotty 3000 $ do
  get "/" $ do
    html "<h1>Welcome to Our Wedding</h1><p>Please enter your guest code to proceed:</p><form method='post' action='/login'><input type='password' name='password'><input type='submit' value='Login'></form>"

  post "/login" $ do
    password <- param "password" :: ActionM Text
    if password == "guest123" -- replace with actual password list or check
      then do
        setHeader "Set-Cookie" "password=guest123; Path=/; HttpOnly"
        redirect "/main"
      else text "Incorrect password."

  get "/main" $ do
    maybeCookie <- header "Cookie"
    case maybeCookie of
      Just cookie ->
        if "password=guest123" `elem` words (unpack cookie) -- replace with actual password list or check
          then html "<h1>Wedding Information</h1><p>Welcome to our wedding! Here's all the information you need.</p>"
          else status unauthorized401 >> text "Unauthorized access."
      Nothing ->
        status unauthorized401 >> text "Unauthorized access."
