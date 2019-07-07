{-# LANGUAGE OverloadedStrings #-}


module Lib
    ( proxy
    ) where

import Network.HTTP.ReverseProxy
import Data.Conduit.Network

someFunc :: IO ()
someFunc = putStrLn "someFunc"

proxy :: IO ()
proxy = runTCPServer (serverSettings 3000 "*") $ \appData ->
    rawProxyTo
        (\_headers -> return $ Right $ ProxyDest "www.example.com" 80)
        appData
