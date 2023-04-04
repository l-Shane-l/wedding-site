{-# LANGUAGE OverloadedStrings #-}

module TransportationPage where

import Layout
import Lucid

transportationPage :: Html ()
transportationPage = Layout.layout $ do
  h1_ "Transportation"
  p_ $ do
    "Transportation information here."
    br_ []
    "Shuttle bus schedules, car rental information, parking, etc."