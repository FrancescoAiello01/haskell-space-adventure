module Planets(chooseAPlanet) where

import Prelude hiding (lookup)
import qualified Data.Map.Strict as Map
import Data.Map (Map())

planets :: Map String String
planets = Map.fromList [
  ("mercury","A very hot planet, closest to the sun."),
  ("venus","It's very cloudy here!"),
  ("earth", "There is something very familiar about this planet."),
  ("mars", "Known as the red planet."),
  ("jupiter", "A gas giant, with a noticeable red spot."),
  ("saturn", "This planet has beautiful rings around it."),
  ("uranus", "Strangely, this planet rotates around on its side."),
  ("neptune", "A very cold planet, furthest from the sun."),
  ("pluto", "I don't care what they say - it's a planet.")]

chooseAPlanet :: IO()
chooseAPlanet = do
  putStrLn "Shall I randomly choose a planet for you to visit? (Y or N)"
  choice <- getLine
  if choice == "Y" then
    travelTorandomPlanet
  else if choice == "N" then
    do
      putStrLn "Name the planet you would like to visit."
      planet <- getLine
      travelToPlanet planet
  else
    do
      putStrLn "Sorry, I didn't get that."
      chooseAPlanet


rng :: Int -> Int
rng upper
 | upper<=4   = upper
 | otherwise  = 4

randomPlanet :: String
randomPlanet =
  ["mercury", "venus", "earth", "mars",
  "jupiter", "saturn", "uranus", "neptune",
  "pluto"]!!(rng 9)

travelTorandomPlanet :: IO()
travelTorandomPlanet = do
  travelToPlanet randomPlanet

lookupPlanet :: String -> String
lookupPlanet name =
  case Map.lookup name planets of
    Nothing -> "Sorry, I haven't heard of that planet."
    Just str -> ("Traveling to " ++ name ++ ". " ++ str)

travelToPlanet :: String -> IO()
travelToPlanet planet = do
  putStrLn (lookupPlanet planet)
