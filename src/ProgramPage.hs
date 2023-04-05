{-# LANGUAGE OverloadedStrings #-}

module ProgramPage where

import Layout
import Lucid

programPage :: Html ()
programPage = Layout.layout $ do
  h1_ "Program Information"
  p_ "Welcome to our wedding! Here's all the information you need."