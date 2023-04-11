{-# LANGUAGE OverloadedStrings #-}

module AccomodationPage where

import qualified Layout
import Lucid

-- Define our accommodation page.
accomodationPage :: Html ()
accomodationPage =
  Layout.layout $ do
    h1_ "Accommodation Information"
    p_ "We are pleased to offer accommodation for our guests at the wedding venue."

    h2_ "Venue Details"
    p_ "The Wedding Venue" -- Replace with the actual venue name
    p_ "123 Wedding Street" -- Replace with the actual venue address
    p_ "City, State, ZIP" -- Replace with the actual venue city, state, and ZIP code
    p_ "Phone: (123) 456-7890" -- Replace with the actual venue phone number

    h2_ "Room Rates & Reservations"
    p_ "Special room rates are available for wedding guests. Please mention the wedding when making your reservation."
    p_ "Single Room: $100 per night"
    p_ "Double Room: $150 per night"
    p_ "Suite: $200 per night"

    h2_ "Check-in & Check-out"
    p_ "Check-in time is 3:00 PM, and check-out time is 12:00 PM."
    
    h2_ "Amenities"
    p_ "The venue offers a variety of amenities for guests to enjoy during their stay, including:"
    ul_ $ do
      li_ "Free Wi-Fi"
      li_ "Complimentary breakfast"
      li_ "On-site parking"
      li_ "Swimming pool"
      li_ "Fitness center"

    p_ "We hope you enjoy your stay!"
