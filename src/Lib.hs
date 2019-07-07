{-# LANGUAGE OverloadedStrings #-}


module Lib
    ( proxy
    ) where

import Network.HTTP.ReverseProxy
import Data.Conduit.Network

proxy :: IO ()
proxy = runTCPServer (serverSettings 4321 "*") $ \appData ->
    rawProxyTo
        (\_headers -> return $ Right $ ProxyDest "51.68.173.144" 8080)
        appData
