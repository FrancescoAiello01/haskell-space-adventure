module Planets(chooseAPlanet) where

import qualified Data.Map.Strict as Map
import Data.Map (Map())

planets :: Map String String
planets = Map.fromList [
  ("Mercury","A very hot planet, closest to the sun."),
  ("Venus","It's very cloudy here!"),
  ("Earth", "There is something very familiar about this planet."),
  ("Mars", "Known as the red planet."),
  ("Jupiter", "A gas giant, with a noticeable red spot."),
  ("Saturn", "This planet has beautiful rings around it."),
  ("Uranus", "Strangely, this planet rotates around on its side."),
  ("Neptune", "A very cold planet, furthest from the sun."),
  ("Pluto", "I don't care what they say - it's a planet.")]

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
    putStrLn "Sorry, I didn't get that."

travelTorandomPlanet :: IO()
travelTorandomPlanet = do
  putStrLn "Going to fake planet"

travelToPlanet :: String -> IO()
travelToPlanet planet = do
  putStrLn ("Traveling to " ++ planet ++ ". It is nice here.")
