{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric     #-}

module Config (
  Opts(..)
, getOpts
)  
where

-- import GHC.Generics
import Data.Text
import Options.Applicative
import Data.Semigroup ((<>))

data Opts = Opts { srcPort  :: Int 
                    , destHost :: Text
                    , destPort :: Int
                    }

getOpts :: IO Opts
getOpts = execParser opts
  where opts = info (opts' <**> helper)
          (fullDesc <> progDesc "TCP raw proxy server" <> header "TCP raw proxy server")
        opts' = Opts <$> option auto (long "src-port" <> short 'p' <> help "source port") 
                     <*> (pack <$> strOption (long "dest-host" <> short 'H' <> help "destination host"))
                     <*> option auto (long "dest-port" <> short 'P' <> help "destination port") 
