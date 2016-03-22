{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Control.Applicative
import Control.Lens
import Control.Monad.Reader
import qualified Data.ByteString.UTF8 as B
import Data.Maybe
import Data.Monoid
import Data.Pool
import Database.PostgreSQL.Simple as PSQL
import qualified Hoogle
import qualified Network.Wai.Handler.Warp as Warp
import Network.Wai.Middleware.RequestLogger
import Prelude
import Safe
import System.Environment (lookupEnv)
import System.IO
import Webcrank.Wai

import HipBot
import HipBot.API as HipBot

import HipBot.HipLambda.Descriptor
import HipBot.HipLambda.Eval
import HipBot.HipLambda.Hoogle
import HipBot.HipLambda.Pointfree
import HipBot.HipLambda.Type
import HipBot.HipLambda.Healthcheck

type HipLambdaCrank = WaiCrankT HipLambda

type HipLambdaResource = WaiResource HipLambda

main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  hSetBuffering stderr NoBuffering
  c <- lookupConfig
  let
    baseUri = view configBaseUri c
    port = view configPort c
  pool <- createPool (connectPostgreSQL . view configDb $ c) PSQL.close 1 10 10
  bot <- newHipBot' (HipBot.pgAPI pool) (descriptor baseUri)
  putStrLn . mconcat $
    [ "Starting on port ", show port, " with base URI ", show baseUri ]
  run c $ mconcat
    [ hipBotResources bot
    -- , "check" ==> checkResource
    -- , "djinn" ==> djinnResource
    , "eval" ==> evalResource
    , "hoogle" ==> hoogleResource
    , "pointfree" ==> pointfreeResource
    , "pointful" ==> pointfulResource
    , "heartbeat" ==> heartbeatResource
    , "version.json" ==> versionJson
    -- , "haddock" ==> haddockResource
    ]

lookupConfig :: IO Config
lookupConfig = Config
  <$> lookupBaseUri
  <*> lookupPort
  <*> lookupDb
  <*> lookupHoogle

lookupBaseUri :: IO AbsoluteURI
lookupBaseUri = lookupEnv "BASE_URI"
  <&> fromMaybe "http://localhost:8080" . (>>= parseAbsoluteURI)

lookupPort :: IO Int
lookupPort = lookupEnv "PORT"
  <&> fromMaybe 8080 . (>>= readMay)

lookupDb :: IO B.ByteString
lookupDb = lookupEnv "PG_DB_URL"
  <&> maybe (error "PG_DB_URL environment variable required") B.fromString

lookupHoogle :: IO Hoogle.Database
lookupHoogle = do
  db <- lookupEnv "HOOGLE_DB"
    <&> fromMaybe (error "HOOGLE_DB environment variable required")
  Hoogle.loadDatabase db

run :: Config -> Dispatcher (WaiResource HipLambda) -> IO ()
run c = Warp.run (view configPort c) . logStdout . disp where
  disp = dispatch (`runHipLambda` c) baseUriBS
  baseUriBS = B.fromString . show . view configBaseUri $ c

