def GodsPizza():
  requests = []
  CHNpizza = ["(1)ShaoSiming","(2)YueLao","(3)LiùěrMíhóu","(4)TaoTie","(5)YaoJi","(6)BaiShizun"]
  EGYpizza = ["(1)Sekhmet","(2)Medjed","(3)Heket","(4)Anubis","(5)Bastet"]
  GRKpizza = ["(1)Eros","(2)Medusa","(3)Helen","(4)Jason"]
  NOSpizza = ["(1)Vali","(2)Gerd","(3)Hodur","(4)Fenrir","(5)Idun","(6)Valkyrie","(7)Baldr"]
  MSPpizza = ["(1)Shamash","(2)Ninsun","(3)Pazuzu"]
  JPNpizza = ["(1)AmeNoUzume","(2)Izanagi","(3)Izanami"]
  KORpizza = ["(1)Dokkaebi"]
  AZTpizza = ["(1)Chantico", "(2)Quetzalcoatl"]
  while True:
     orderYN = input("Do you want to order any godspizza?(Y/N): ")
     if orderYN == "Y" or orderYN == "y":
       print("GodsRegions:\n 'Chinese'|'Egyptain'|'Greek'|'Norse'|\n'Mesopotamian'|'Japanese'|'Korean'|'Aztec'")
       orderRg = input("Input a god's region for run into menus: ")
       
       if orderRg == "Chinese":
          print("=Chinese godspizza MENU=")
          print(CHNpizza)
          orderPz = input("Which number do you want to order?")
          while True:
            if int(orderPz)<=len(CHNpizza) and int(orderPz)>0:
              requests.append(CHNpizza[int(orderPz)-1])
              print("Order success!")
              break
            else:
              print("❌ Please choose again! a number for order this menu is wrong.")
            orderPz = input("Which number do you want to order?")           
       elif orderRg == "Egyptian":
          print("=Egyptian godspizza MENU=")
          print(EGYpizza)
          orderPz = input("Which number do you want to order? ")
          while True:
            if int(orderPz)<=len(EGYpizza) and int(orderPz)>0:
              requests.append(EGYpizza[int(orderPz)-1])
              print("Order success!")
              break
            else:
              print("❌ Please choose again! a number for order this menu is wrong.")
            orderPz = input("Which number do you want to order?")
       elif orderRg == "Greek":
          print("=Greek godspizza MENU=")
          print(GRKpizza)
          orderPz = input("Which number do you want to order? ")
          while True:
            if int(orderPz)<=len(GRKpizza) and int(orderPz)>0:
              requests.append(GRKpizza[int(orderPz)-1])
              print("Order success!")
              break
            else:
              print("❌ Please choose again! a number for order this menu is wrong.")
            orderPz = input("Which number do you want to order?")
       elif orderRg == "Norse":
          print("=Norse godspizza MENU=")
          print(NOSpizza)
          orderPz = input("Which number do you want to order? ")
          while True:
            if int(orderPz)<=len(NOSpizza) and int(orderPz)>0:
              requests.append(NOSpizza[int(orderPz)-1])
              print("Order success!")
              break
            else:
              print("❌ Please choose again! a number for order this menu is wrong.")
            orderPz = input("Which number do you want to order?")
       elif orderRg == "Mesopotamian":
          print("=Mesopotamian godspizza MENU=")
          print(MSPpizza)
          orderPz = input("Which number do you want to order? ")
          while True:
            if int(orderPz)<=len(MSPpizza) and int(orderPz)>0:
              requests.append(MSPpizza[int(orderPz)-1])
              print("Order success!")
              break
            else:
              print("❌ Please choose again! a number for order this menu is wrong.")
            orderPz = input("Which number do you want to order?")
       elif orderRg == "Japanese":
          print("=Japanese godspizza MENU=")
          print(JPNpizza)
          orderPz = input("Which number do you want to order? ")
          while True:
            if int(orderPz)<=len(JPNpizza) and int(orderPz)>0:
              requests.append(JPNpizza[int(orderPz)-1])
              print("Order success!")
              break
            else:
              print("❌ Please choose again! a number for order this menu is wrong.")
            orderPz = input("Which number do you want to order?")
       elif orderRg == "Korean":
          print("=Korean godspizza MENU=")
          print(KORpizza)
          orderPz = input("Which number do you want to order? ")
          while True:
            if int(orderPz)<=len(KORpizza) and int(orderPz)>0:
              requests.append(KORpizza[int(orderPz)-1])
              print("Order success!")
              break
            else:
              print("❌ Please choose again! a number for order this menu is wrong.")
            orderPz = input("Which number do you want to order?")
       elif orderRg == "Aztec":
          print("=Aztec godspizza MENU=")
          print(AZTpizza)
          orderPz = input("Which number do you want to order? ")
          while True:
            if int(orderPz)<=len(AZTpizza) and int(orderPz)>0:
              requests.append(AZTpizza[int(orderPz)-1])
              print("Order success!")
              break
            else:
              print("❌ Please choose again! a number for order this menu is wrong.")
            orderPz = input("Which number do you want to order?")
       else:
          print("Please select a region depend on our list")
     elif orderYN == "N" or orderYN == "n":
       print("📝Summary your order: ", requests)
       print("Thank you for ordering")
       print("************************")
       break
     else:
       print("Please input 'Y' or 'N'")



GodsPizza()
