#ATM_object
class ATM:
  def __init__(self, IDcard, PIN, bank, balance, phone):
    self.IDcard = IDcard
    self.PIN = PIN
    self.bank = bank
    self.balance = balance
    self.phone = phone
  def deposit(self):
    Dcurrency = int(input("Deposit amount(Baht): "))
    self.balance += Dcurrency
    print(f"You had deposited {Dcurrency} Baht |Account balance: {self.balance} Baht")
  def withdraw(self):
    Wcurrency = int(input("Withdraw amount(Baht): "))
    if Wcurrency <= self.balance:
      self.balance -= Wcurrency
      print(f"You had withdrawn {Wcurrency} Baht |Account balance: {self.balance} Baht")
    else:
      print("Your balance is not enough.")
  def transfer(self):
    receiverID = input("Enter receiverID: ")
    Tcurrency = int(input("Transfer amount(Baht): "))
    if Tcurrency <= self.balance:
      self.balance -= Tcurrency
      print(f"You had done a transfer transaction from your account to {receiverID} amount {Tcurrency} Baht |Account balance: {self.balance} Baht")
    else:
      print("Your balance is not enough.")
  def getincome(self, InterestRate=1.25, AnnualFee=200.0):
    remaining = float(self.balance)
    min = AnnualFee/(InterestRate/100)
    if remaining > min:
      income = ((self.balance*InterestRate)/100)-AnnualFee
      print(f"Account balance: {self.balance} Baht")
      print(f"You will get an interest income around {income} Baht from saving every 25th June.")
    else:
      print(f"Your remaining balance should more than {min} Baht.")
  def changePIN(self):
    OTP = input("Enter phone number: ")
    if (OTP == self.phone):
      PIN1 = self.PIN
      PIN2 = input("Set new 6-Digit PIN: ")
      self.PIN = PIN2
      print(f"You'd already changed a PIN from {PIN1} to {PIN2}.")
    else:
      print("Your phone number didn't match for the account's phone number")


#================================================
#CardsDB
person1 = ATM("5821146311", "001122", "QB", 35000,"0666666666")
person2 = ATM("7242424209", "555555", "QB", 90000,"0911111111")
person3 = ATM("8442121274", "123456", "QB", 145000,"0888888888")
person4 = ATM("3453634634", "752244", "XXB", 2100000,"0111222333")
persons = [person1, person2, person3, person4]

def check_if_exists1(x):
    if x in QB_IDcards:
        IDindex = QB_IDcards.index(x)
        return IDindex+1
    else:
      return 9999
def check_if_exists2(y):
    if y in QB_PINcards:
        PINindex = QB_PINcards.index(y)
        return PINindex+1
    else:
      return 1111
print("DB: QBank IDcard and PIN for testing")
QB_IDcards = []
for i in range(len(persons)):
    QB_IDcards.append(persons[i].IDcard)
print(QB_IDcards)

QB_PINcards = []
for i in range(len(persons)):
    QB_PINcards.append(persons[i].PIN)
print(QB_PINcards)
#=================================================
#ATM_System
def QB_ATM():
  status = 1
  fcode = " "
  print("******************************")
  print("*****Welcome to QBANK ATM*****")
  print("(Insert the card and enter your pin)")
  print("______________Caution______________")
  print("If you enter the incorrect PIN 3 times,")
  print("your card will be temporarily blocked")
  print("**********************************************")
  if status != 0:
    while status < 4:
      IDcheck = input(f"ID Card: ")
      PINcheck = input(f"6-Digit PIN: ")
      if check_if_exists1(IDcheck) != "9999" and check_if_exists1(IDcheck) == check_if_exists2(PINcheck):
        print("""ATM Function Codes
              #F1 Deposit money
              #F2 Withdraw money
              #F3 Tranfer money
              #F4 Check interest income
              #F5 Change pin
              #F6 Exit
              """)
        print("(Enter a code between F1 - F5 for each services)")
        select = 0
        while select < 1 :
              fcode = input("Function Code: ")
              if fcode == "F1":
                print("===F1: Deposit money service===")
                persons[check_if_exists1(IDcheck)-1].deposit()
              elif fcode == "F2":
                print("===F2: Withdraw money service===")
                persons[check_if_exists1(IDcheck)-1].withdraw()
              elif fcode == "F3":
                print("===F3: Transfer money service===")
                persons[check_if_exists1(IDcheck)-1].transfer()
              elif fcode == "F4":
                print("===F4: Check Interest Income service===")
                persons[check_if_exists1(IDcheck)-1].getincome()
              elif fcode == "F5":
                print("===F5: Change PIN service===")
                persons[check_if_exists1(IDcheck)-1].changePIN()
              elif fcode == "F6":
                print("***********************************")
                print("_____________Thank_you_____________")
                print("Don't forget to pull your card back")
                print("***********************************")
                status = 0
                return
              else:
                print("try enter function code (F1-F6) again")
      else:
        print("---------Your PIN is incorrected------------")
        status = status+1
    print("*************************************")
    print("Sorry, your card is blocked. Please contact at QBANK")
    print("_____________Thank_you_____________")
    print("*************************************")

  else:
    print("_____________Thank_you_____________")
    print("*************************************")


QB_ATM()
