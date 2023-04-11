{-# LANGUAGE OverloadedStrings #-}

module PhotoVideoPage where

import Layout
import Lucid

-- Define our photo and video page.
photoVideoPage :: Html ()
photoVideoPage =
  Layout.layout $ do
    div_ [class_ "container"] $ do
      h1_ [class_ "center-align"] "Wedding Photos and Videos Upload"
      p_ [class_ "flow-text"] "Please follow the instructions below to upload your photos and videos from the wedding."
      ol_ [class_ "flow-text"] $ do
        li_ "Click on the 'Upload Photos and Videos' button below."
        li_ "Sign in with your Google account if prompted."
        li_ "Complete the form by selecting your photos and/or videos and providing any additional details as requested."
        li_ "Click on the 'Submit' button at the bottom of the form to finish uploading your files."
      div_ [class_ "row center-align"] $ do
        form_ [method_ "get", action_ "https://forms.gle/1qy8mkLNgwmKAmMFA"] $ do
          button_ [class_ "btn-large purple waves-effect waves-light", type_ "submit"] "Upload Photos and Videos"
