welcomeMessage :: IO()
welcomeMessage = do
  putStrLn "Welcome to the Solar System!"
  putStrLn "There are 9 planets to explore."

main = do
  welcomeMessage
  putStrLn "Shall I randomly  choose a planet for you to visit? (Y or N)"
  choice <- getLine
  if choice == "Y" then
    putStrLn "Going to fake planet"
  else if choice == "N" then
    do
      putStrLn "Name the planet you would like to visit."
      planet <- getLine
      putStrLn ("Traveling to " ++ planet ++ ". It is nice here.")
  else
    putStrLn "Sorry, I didn't get that."

