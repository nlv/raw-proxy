{-# LANGUAGE OverloadedStrings #-}


module Lib
    ( proxy
    ) where

import Network.HTTP.ReverseProxy
import Data.Conduit.Network

import Data.Text
import Data.Text.Encoding

proxy :: Int -> Text -> Int -> IO ()
proxy srcPort dstHost dstPort = runTCPServer (serverSettings srcPort "*") $ \appData ->
    rawProxyTo
        (\_headers -> return $ Right $ ProxyDest (encodeUtf8 dstHost) dstPort)
        appData
