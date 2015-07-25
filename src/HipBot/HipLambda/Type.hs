{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TemplateHaskell #-}

module HipBot.HipLambda.Type where

import Control.Applicative
import Control.Lens
import Control.Monad.Catch
import Control.Monad.Reader
import qualified Data.ByteString.UTF8 as B
import qualified Hoogle
import Prelude

import HipBot

data Config = Config
  { _configBaseUri :: AbsoluteURI
  , _configPort :: Int
  , _configDb :: B.ByteString
  , _configHoogleDb :: Hoogle.Database
  } deriving (Show)

makeClassy ''Config

class HasHoogleDb a where
  hoogleDb :: Lens' a Hoogle.Database

instance HasHoogleDb Hoogle.Database where
  hoogleDb = id

instance HasHoogleDb Config where
  hoogleDb = configHoogleDb

newtype HipLambda a = HipLambda { unHipLambda :: ReaderT Config IO a }
  deriving
    ( Functor
    , Applicative
    , Monad
    , MonadCatch
    , MonadIO
    , MonadReader Config
    , MonadThrow
    )

runHipLambda :: HipLambda a -> Config -> IO a
runHipLambda = runReaderT . unHipLambda

