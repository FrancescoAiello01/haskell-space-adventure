{-# LANGUAGE OverloadedStrings, DeriveGeneric #-}
module JsonParser (getData) where

import Data.Aeson
import Data.Text
import Control.Applicative
import Control.Monad
import qualified Data.ByteString.Lazy as B
import GHC.Generics

-- | Type of each JSON entry in record syntax.
data Planet =
  Planet { name  :: !Text
         , description   :: !Text
           } deriving (Show,Generic)


instance FromJSON Planet


jsonFile :: FilePath
jsonFile = "planetarySystem.json"


getJSON :: IO B.ByteString
getJSON = B.readFile jsonFile


getData = do
  -- Get JSON data and decode it
  d <- (eitherDecode <$> getJSON) :: IO (Either String [Planet])
  -- If d is Left, the JSON was malformed.
  -- In that case, we print the error.
  -- Otherwise, we perform the operation of
  -- our choice. In this case, just print it.
  case d of
    Left err -> putStrLn err
    Right ps -> print ps
