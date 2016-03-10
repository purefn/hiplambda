{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module HipBot.HipLambda.Healthcheck
       ( heartbeatResource
       , versionJson
       ) where

import           Data.Aeson
import qualified Data.Text                          as T
import qualified Development.GitRev                 as GR
import           Distribution.PackageDescription.TH
import           GHC.Generics
import           HipBot.HipLambda.Type
import           Network.HTTP.Types                 as H
import           Network.Wai
import           Webcrank.Wai

data GitStuff = GitStuff
               { gitCommitHash :: T.Text
               , gitBranch     :: T.Text
               } deriving (Show, Eq, Generic)

data VersionJsonWrapping = VersionJsonWrapping
                           { gitStuff    :: GitStuff
                           , packageName :: T.Text
                           , version     :: T.Text
                           } deriving (Show, Eq, Generic)

data HealthStatus = HealthStatus
                    { healthy       :: Bool
                    , failureReason :: [T.Text]
                    } deriving (Show, Eq, Generic)
data Heartbeat = Heartbeat
                 { healthStatus :: HealthStatus
                 } deriving (Show, Eq, Generic)

instance ToJSON HealthStatus
instance ToJSON GitStuff
instance ToJSON VersionJsonWrapping
instance ToJSON Heartbeat

heartbeatResource :: WaiResource HipLambda
heartbeatResource =
  resourceWithBody ("application" // "json") $ return $ encode heartbeat
  where
    heartbeat = Heartbeat { healthStatus = HealthStatus { healthy = True, failureReason = [] } }

versionJson :: WaiResource HipLambda
versionJson =
  resourceWithBody ("application" // "json") $ return $ encode wrapped
  where
    wrapped = VersionJsonWrapping
      { gitStuff = GitStuff { gitCommitHash = $(GR.gitHash)
                            , gitBranch = $(GR.gitBranch)
                            }
      , packageName = $(packageVariable $ pkgName . package)
      , version = $(packageVariable $ pkgVersion . package)
      }
