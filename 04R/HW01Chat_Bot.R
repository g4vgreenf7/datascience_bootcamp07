# HW 01 Chatbot
continue <- TRUE   
botchat <- function() {

  cat("What is your name?: ")
  name = readLines("stdin", 1)
  print(paste("Hello", name))
  cat("How old are you?: ")
  your_age = as.numeric(readLines("stdin", 1))
  print(paste("You are", your_age, "years old.", "You are older than me", your_age-1, "years old"))
  
  cat("Where are you come from, district?: ")
  location = readLines("stdin", 1)
  print(paste("You're from ", location, ".And I'm from Nakhonsawan."))
  cat("\nNice to meet you!")

  cat("\nWould you like to take a guess my lucky number?:")
  location = readLines("stdin", 1)
  cat("Choose a number from 1 to 9: ")
  number = readLines("stdin", 1)
  if (number == 5 | number == 7) {
    print("I can't believe it! 5 and 7 are my lucky.")
  } else if (number == 9 | number == 1) {
    print("That is your lucky number, right? It's not mine.")
  } else {
    print("Nope! It's so easy to tell you, let's try again tomorrow.")
  }

  print(paste("It's time to go to my class, Bye", name))
  cat("*************************************\n")
  continue <<-FALSE
}
botchat()
