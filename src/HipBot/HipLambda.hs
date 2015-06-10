{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Control.Applicative
import Control.Monad.Reader
import qualified Data.ByteString.UTF8 as B
import Data.Maybe
import Data.Monoid
import Data.Pool
import Database.PostgreSQL.Simple as PSQL
import qualified Network.Wai.Handler.Warp as Warp
import Network.Wai.Middleware.RequestLogger
import Prelude
import Safe
import System.Environment (lookupEnv)
import Webcrank.Wai

import HipBot
import HipBot.API as HipBot

import HipBot.HipLambda.Descriptor
import HipBot.HipLambda.Eval
import HipBot.HipLambda.Hoogle
import HipBot.HipLambda.Pointfree

main :: IO ()
main = do
  (baseUri, port, db) <- config
  pool <- createPool (connectPostgreSQL db) PSQL.close 1 10 10
  bot <- newHipBot' (HipBot.pgAPI pool) (descriptor baseUri)
  putStrLn $ "Starting on port " <> show port <> " with base URI " <> show baseUri
  run baseUri port $ mconcat
    [ hipBotResources bot
    -- , "check" ==> checkResource
    -- , "djinn" ==> djinnResource
    , "eval" ==> evalResource
    , "hoogle" ==> hoogleResource
    , "pointfree" ==> pointfreeResource
    , "pointful" ==> pointfulResource
    -- , "haddock" ==> haddockResource
    ]

config :: IO (AbsoluteURI, Int, B.ByteString)
config = (,,) <$> baseUri <*> port <*> db where
  baseUri = fromMaybe "http://localhost:8080" . (>>= parseAbsoluteURI) <$> lookupEnv "BASE_URI"
  port = fromMaybe 8080 . (>>= readMay) <$> lookupEnv "PORT"
  db = maybe (error "DATABASE_URL environment variable required") B.fromString
    <$> lookupEnv "DATABASE_URL"

run :: AbsoluteURI -> Int -> Dispatcher (WaiResource IO) -> IO ()
run baseUri port = Warp.run port . logStdout . disp where
  disp = dispatch id baseUriBS
  baseUriBS = B.fromString . show $ baseUri

