{-# LANGUAGE OverloadedStrings #-}

module Templates.MainPage
  ( mainPage,
  )
where

import Lucid
import Templates.Layout

mainPage :: Html ()
mainPage = baseTemplate $ do
  h1_ "Wedding Information"
  p_ "Welcome to our wedding! Here's all the information you need."