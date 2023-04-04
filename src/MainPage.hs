{-# LANGUAGE OverloadedStrings #-}

module MainPage
  ( mainPage,
  )
where

import Layout
import Lucid

mainPage :: Html ()
mainPage = Layout.layout $ do
  h1_ "Wedding Information"
  p_ "Welcome to our wedding! Here's all the information you need."