{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module HipBot.HipLambda.Eval where

import Control.Applicative
import Control.Lens
import Control.Monad.IO.Class
import Control.Monad.Reader
import Control.Monad.Trans.Maybe
import Data.Foldable
import Data.Maybe
import Data.Monoid
import Data.Text (Text)
import qualified Data.Text as T
import Prelude hiding (foldl1)
import System.Environment
import System.Exit
import System.Process.Text
import Webcrank.Wai

import HipBot
import HipBot.Webhooks

import Paths_hiplambda

data MuEvalRes = MuEvalRes
  { _muEvalResExpr :: Text
  , _muEvalResEtype :: Text
  , _muEvalResValue :: Text
  } deriving (Show, Eq)

makeFields ''MuEvalRes

evalResource :: WaiResource IO
evalResource = roomMessageWebhookResource "eval" $ \_ ->
  views message (liftIO . traverse (fmap textNotification) . eval)

eval :: Text -> Maybe (IO Text)
eval = runReader . runMaybeT $ exprType <|> evalExpr

exprType :: MonadReader Text m => MaybeT m (IO Text)
exprType = getExpr [":type", ":t"] <&> \e ->
  mueval True e <&> \case
    Left err -> err
    Right res -> view etype res

evalExpr :: MonadReader Text m => MaybeT m (IO Text)
evalExpr = getExpr [">", "/run"] <&> \e ->
  mueval False e <&> \case
    Left err -> err
    Right res -> view value res

getExpr :: (MonadReader Text m, Functor t, Foldable t) => t Text -> MaybeT m Text
getExpr xs = MaybeT . asks $ \t -> T.strip <$> foldl1 (<|>) (fmap (`T.stripPrefix` t) xs)

-- Borrowed from tryhaskell
mueval :: Bool -> Text -> IO (Either Text MuEvalRes)
mueval typeOnly e = do
  env <- getEnvironment
  importsfp <- getDataFileName "Imports.hs"
  let
    timeout = fromMaybe "1" $ lookup "MUEVAL_TIMEOUT" env
    opts = mconcat
      [ ["-i", "-t", timeout, "--expression", T.unpack e]
      , ["--no-imports", "-l", importsfp]
      , ["--type-only" | typeOnly]
      ]
  (status,out,err) <- readProcessWithExitCode "mueval" opts ""
  case status of
    ExitSuccess ->
      case T.lines out of
        [e', typ, value'] | e == e' -> return (Right (MuEvalRes e typ value'))
        _ -> return (Left ("Unable to get type and value of expression: " <> e))
    ExitFailure{} ->
      case T.lines out of
        [e',_typ,value'] | e == e' -> return (Left value')
        [e',_typ]        | e == e' -> return (Left "Evaluation killed!")
        _ -> return . Left $
          if out == "" then mconcat [err, " ", T.pack (show status)] else out

