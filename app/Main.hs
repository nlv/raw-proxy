module Main where

import Lib
import Config

main :: IO ()
main = do
  opts <- getOpts
  proxy (srcPort opts) (destHost opts) (destPort opts)
