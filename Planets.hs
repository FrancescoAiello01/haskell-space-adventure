module Planets(chooseAPlanet) where

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
