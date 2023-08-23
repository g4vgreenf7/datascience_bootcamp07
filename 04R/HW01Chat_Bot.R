greeting <- function(){
  username <- readLines("What's your name ?")
  print(paste("Hi!", username))
  age <- readLines("Do you study here?")
  print(paste("Well, I have been studying this school for ten years."))
  home <- readLines("You look handsome, where is your hometown?")
  print(paste("Really,",home,"is lists of my beautiful place."))
  distance <- readLines("You know,How far is it from here?")
  print(paste(distance,"? Maybe it's my long trip"))
  topic = readLines("Would you give me borrow 3000 baht?")
  print(paste("Thank you. Have a good luck my precious!"))
} 
