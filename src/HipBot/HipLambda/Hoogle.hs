{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module HipBot.HipLambda.Hoogle where

import Control.Lens
import Control.Monad.Reader
import Data.Maybe
import Data.Text (Text)
import qualified Data.Text as T
import Hoogle
import Prelude hiding (foldl1)
import Webcrank.Wai

import HipBot
import HipBot.Webhooks

import HipBot.HipLambda.Type

hoogleResource :: (MonadIO m, MonadReader r m, HasHoogleDb r) => WaiResource m
hoogleResource = roomMessageWebhookResource "hoogle" $ \_ ->
  lift . lift . views message (fmap Just . hoogle . T.strip . T.drop 7)

hoogle :: (MonadReader r m, HasHoogleDb r) => Text -> m Notification
hoogle e = view hoogleDb <&> \db ->
  let
    q = Hoogle.parseQuery Haskell . T.unpack $ e
    search' = toNotification . fmap snd . Hoogle.search db
  in
    either errorNotification search' q

toNotification :: [Result] -> Notification
toNotification =
  let
    linkModule rurl (murl, m) =
      let url' = if murl == takeWhile (/= '#') rurl then rurl else murl
      in mconcat
        [ "<a href=\""
        , T.pack url'
        , "\">"
        , T.pack m
        , "</a>"
        ]
    modules (rurl, ms) = T.unwords . fmap (linkModule rurl) $ ms
    format r = mconcat
      [ "<p>"
      , "<a href=\""
      , T.pack . fst . head . Hoogle.locations $ r
      , "\">"
      , T.pack . showTagHTML . Hoogle.self $ r
      , "</a> in "
      , T.intercalate ", " . fmap modules . Hoogle.locations $ r
      , "</p>"
      ]
    msg = mconcat . take 3 . fmap format
  in
    htmlNotification . msg

hackage :: Text -> Text
hackage = undefined

errorNotification :: ParseError -> Notification
errorNotification e = textNotification (T.pack . show $ e) & color ?~ Red

