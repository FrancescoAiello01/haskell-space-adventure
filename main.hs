module Main where
import qualified Planets
import qualified JsonParser

welcomeMessage :: IO()
welcomeMessage = do
  putStrLn "Welcome to the Solar System!"
  putStrLn "There are 9 planets to explore."

greetPerson :: IO()
greetPerson = do
  putStrLn "What is your name?"
  name <- getLine
  putStrLn ("Nice to meet you, " ++ name ++ ". My name is Eliza, I'm an old friend of Alexa.")
  putStrLn "Let's go on an adventure!"


main = do
  JsonParser.getData
  welcomeMessage
  greetPerson
  Planets.chooseAPlanet
