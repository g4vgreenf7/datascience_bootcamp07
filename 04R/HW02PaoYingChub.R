play_game <- function() {
  
  options <- c("ss", "hm", "pp")
  stage <- 1.0
  point <- 0.0
  print("Pao Ying Chub Challenge 20 games")
  print("Choose 'ss' = ✂, 'hm' = 🔨,  'pp' = 📄") 
  print("Put 'exit' to exit the game")
  while(stage<21){
    text= readline(paste("Game #",stage,"Input your best choice: "))
    if(text=="exit"){
      break
    }else{
      bot <- sample(options, 1)
      if(text=="ss"&bot=="pp"|text=="pp"&bot=="hm"|text=="hm"&bot=="ss"){
        point <- point+1
        print("You win!")
      }else if(text=="ss"&bot=="hm"|text=="pp"&bot=="ss"|text=="hm"&bot=="pp"){
        point <- point-1
        print("You lose!")
      }else if(text==bot){
        print("DRAW")
      }else{
        print("Your choice is incorrect, please choose again")
      }
    if(text == "ss" | text == "hm" | text == "pp"){
      print(paste("The bot counter with", bot))
      print(paste("Your winning points :", point))
      if(stage==20){
        print("---FINISH---")
        break
      }
      stage <- stage+1
     }
    }
  }
  print("Thank you for playing")
  print(paste("🎉Congrats! You can score", point, "points from 20 games"))
  print("***********************")
}
