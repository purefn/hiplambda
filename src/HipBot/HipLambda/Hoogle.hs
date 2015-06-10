{-# LANGUAGE OverloadedStrings #-}

module HipBot.HipLambda.Hoogle where

import Control.Lens
import Control.Monad.IO.Class
import Control.Monad.Reader
import Data.Maybe
import Data.Monoid
import Data.Text (Text)
import qualified Data.Text as T
import Prelude hiding (foldl1)
import System.Process.Text
import Webcrank.Wai

import HipBot
import HipBot.Webhooks

hoogleResource :: WaiResource IO
hoogleResource = roomMessageWebhookResource "hoogle" $ \_ ->
  views message (liftIO . traverse (fmap textNotification) . Just . hoogle . T.strip . T.drop 7)

hoogle :: Text -> IO Text
hoogle e = do
  (status, out, err) <- readProcessWithExitCode "hoogle" [T.unpack e] ""
  return . mconcat $ [ T.pack . show $ status, "\n", out, "\n", err ]

