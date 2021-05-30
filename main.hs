main = do
  putStrLn "Welcome to the Solar System!"
  putStrLn "There are 9 planets to explore."
  putStrLn "What is your name?"
  name <- getLine
  putStrLn ("Nice to meet you, " ++ name ++ ". My name is Eliza, I'm an old friend of Alexa.")
  putStrLn "Let's go on an adventure!"
  putStrLn "Shall I randomly  choose a planet for you to visit? (Y or N)"
  planet <- getLine
  putStrLn ("Going to fake planet")
