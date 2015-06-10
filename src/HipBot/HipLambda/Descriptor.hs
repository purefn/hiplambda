{-# LANGUAGE OverloadedStrings #-}

module HipBot.HipLambda.Descriptor where

import Control.Lens
import HipBot

descriptor :: AbsoluteURI -> AddOn
descriptor baseUri =
  defaultAddOn "com.atlassian.labs.hiplambda" "HipLambda"
    "A bot for Haskell"
    (defaultLinks baseUri
      & homepage ?~ baseUri)
    & capabilities ?~ (defaultCapabilities
      & installable ?~ (defaultInstallable
        & callbackUrl ?~ baseUri `appendPath` ["installations"]
        & allowRoom .~ True
        & allowGlobal .~ False)
      & hipchatApiConsumer ?~ (defaultAPIConsumer
        & scopes .~ [SendNotification]
        & fromName ?~ "HipLambda")
      & webhooks .~
        [ webhook (baseUri `appendPath` ["pointfree"]) RoomMessage
            & pattern ?~ "^/(pf|pointfree)(\\s|$).*"
        , webhook (baseUri `appendPath` ["pointful"]) RoomMessage
            & pattern ?~ "^/(unpf|pointful|pointy)(\\s|$).*"
        , webhook (baseUri `appendPath` ["eval"]) RoomMessage
            & pattern ?~ "^:(t|type)(\\s|$).*"
        , webhook (baseUri `appendPath` ["eval"]) RoomMessage
            & pattern ?~ "^(>|/run)(\\s|$).*"
        ])
    & vendor ?~ Vendor "https://atlassian.com" "Atlassian Labs"

