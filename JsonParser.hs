{-# LANGUAGE OverloadedStrings, DeriveGeneric #-}
module JsonParser (getData) where

import Data.Aeson
import Data.Text (Text)
import Control.Applicative
import Control.Monad
import qualified Data.ByteString.Lazy as B
import GHC.Generics
import Data.List (findIndex, find)

-- Type of each JSON entry in record syntax
data Planet =
  Planet { name  :: !String
         , description   :: !String
           } deriving (Show,Generic)


instance FromJSON Planet


jsonFile :: FilePath
jsonFile = "planetarySystem.json"


getJSON :: IO B.ByteString
getJSON = B.readFile jsonFile


planetName :: Planet -> String
planetName (Planet x _) = x

planetDescription :: Planet -> String
planetDescription (Planet _ x) = x

mbPlanetName :: Maybe Planet -> Maybe String
mbPlanetName (Just x) = Just (planetName x)
mbPlanetName _ = Nothing

mbPlanetDescription :: Maybe Planet -> Maybe String
mbPlanetDescription (Just x) = Just (planetDescription x)
mbPlanetDescription _ = Nothing


getData = do
  d <- (eitherDecode <$> getJSON) :: IO (Either String [Planet])
  -- If d is Left, there is an error with the data
  case d of
    Left err -> putStrLn err
    Right ps -> do
      putStrLn ""
      -- Uncomment these to test finding planets in the json
      -- mbPrint $ mbPlanetName $ find (("Pluto" ==) . planetName) ps
      -- mbPrint $ mbPlanetDescription $ find (("Pluto" ==) . planetName) ps


mbPrint
  :: Show a
  => Maybe a -> IO ()
mbPrint (Just x) = print x
mbPrint x = print x
