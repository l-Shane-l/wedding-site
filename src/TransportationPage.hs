{-# LANGUAGE OverloadedStrings #-}

module Templates.TransportationPage where

import Layout
import Lucid

transportationPage :: Html ()
transportationPage = baseTemplate $ do
  h1_ "Transportation"
  p_ $ do
    "Transportation information here."
    br_ []
    "Shuttle bus schedules, car rental information, parking, etc."