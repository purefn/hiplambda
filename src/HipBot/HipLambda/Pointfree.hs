{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module HipBot.HipLambda.Pointfree
  ( pointfreeResource
  , pointfulResource
  ) where

import Control.Monad.Reader
import Data.Foldable
import Data.List (isPrefixOf, isSuffixOf)
import Data.Monoid
import Data.Text (Text)
import qualified Data.Text as T
import Lambdabot.Pointful (pointful)
import Pointfree (pointfree')
import Prelude hiding (any)
import Webcrank.Wai

import HipBot.Webhooks

pointfreeResource :: MonadIO m => WaiResource m
pointfreeResource =
  simpleWebhookResource "pointfree" ["/pf", "/pointfree"] (massage pointfree')

pointfulResource :: MonadIO m => WaiResource m
pointfulResource =
  simpleWebhookResource "pointful" ["/unpf", "/pointful"] (massage unpf)

unpf :: String -> Maybe String
unpf input =
  let output = pointful input
  in if any (`isPrefixOf` output) ["Error:", "<unknown>.hs:"]
    then Nothing
    else if ";" `isSuffixOf` output && not (";" `isSuffixOf` input)
      then Just (init output)
      else Just output

massage :: (String -> Maybe String) -> Text -> Maybe Text
massage f = fmap (T.pack . mappend "/code "). f . T.unpack

